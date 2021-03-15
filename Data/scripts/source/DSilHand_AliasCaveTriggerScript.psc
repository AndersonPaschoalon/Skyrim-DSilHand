Scriptname DSilHand_AliasCaveTriggerScript extends ReferenceAlias  
{DSilHand_AliasCaveTriggerScript Script for quest M50}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Quest Property DSilHand_M50WolfAmbush  Auto  
{DSilHand_M50WolfAmbush Quest}

Actor Property NjadaStonearm  Auto  
{NjadaStonearm actor}

ReferenceAlias Property NewProperty  Auto  

Actor Property NjadaShield  Auto  

ObjectReference Property NjadaMarker  Auto  

ObjectReference Property ShieldMarker  Auto  

String THIS_FILE = "(DSilHand_CaveM50Script.psc) "
Bool alreadyActivated = false

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Actor who entes on the Cave Bonechill Passage. 
; 
; Calls bonechillDSIlHandM50EventHandler()
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnTriggerEnter(ObjectReference akTriggerRef)
    bonechillDSIlHandM50EventHandler(akTriggerRef)     
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Actor who entes on the Cave Bonechill Passage. 
; 
; Cave event Hander for the Quest DSilHand_M50WolfAmbush
; (1) Njada(NjadaStonearm) and her Shield Brother (DSilHand_CompanionRookieNord02) 
;     must be moved to the specific locations marked. 
; (2) They must start combat with the Dragonborn.
; This is script is executed when the player entes on the cave bonechill 
; passage on the quest M50 od the mod DSilHand
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function bonechillDSIlHandM50EventHandler(ObjectReference akTriggerRef)
    Debug.Trace(THIS_FILE + " -- OnTriggerEnter: Bonechill Passage")
    ; Only activates if is the Player at M50 Stage 10
    if(DSilHand_M50WolfAmbush != None)
        Debug.Trace(THIS_FILE + "DSilHand_M50WolfAmbush:<" + DSilHand_M50WolfAmbush + ">")
        Debug.Trace(THIS_FILE + "DSilHand_M50WolfAmbush.GetStage():<" + DSilHand_M50WolfAmbush.GetStage() + ">")
        if( akTriggerRef == Game.GetPlayer() && DSilHand_M50WolfAmbush.GetStage() == 10)
            Debug.Trace(THIS_FILE + "-- Player entered on Bonechill Passage")
            if(alreadyActivated == false)
                ; Activate only ONCE
                alreadyActivated = true
                bonechillDSilHandM50Teleport()
            endif
            bonechillDSilHandM50ForceCombat()
        endif
    else 
        Debug.Trace(THIS_FILE + "**ERROR** DSilHand_M50WolfAmbush is NULL or not initialized!!", 2)
    endif 
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; This function teleports NjadaStonearm and DSilHand_CompanionRookieNord02
; to the XMarker Locations.  Must run only once.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function bonechillDSilHandM50Teleport()
    Debug.Trace(THIS_FILE + " -- run function: bonechillDSilHandM50Teleport()")
    ; Update Quest Stages
    DSilHand_M50WolfAmbush.SetObjectiveCompleted(10)
    DSilHand_M50WolfAmbush.SetStage(20)
    DSilHand_M50WolfAmbush.SetObjectiveDisplayed(20)
    ; Njada 
    NjadaStonearm.MoveTo(NjadaMarker)
    NjadaStonearm.SetPosition(NjadaMarker.GetPositionX(), NjadaMarker.GetPositionY(), NjadaMarker.GetPositionZ())
    ; Njada Shield Brother    
    NjadaShield.MoveTo(ShieldMarker)
    NjadaShield.Enable()
    NjadaShield.SetPosition(ShieldMarker.GetPositionX(), ShieldMarker.GetPositionY(), ShieldMarker.GetPositionZ())
EndFunction 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; This function forces the combat between NjadaStonearm and
; DSilHand_CompanionRookieNord02 with Dragonborn. Will run each time
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function bonechillDSilHandM50ForceCombat()
    Debug.Trace(THIS_FILE + " -- run function: bonechillDSilHandM50ForceCombat()")
    NjadaShield.StartCombat(Game.GetPlayer())
    NjadaStonearm.StartCombat(Game.GetPlayer())
EndFunction 
