Scriptname DSilHand_M50CaveTrigger extends ReferenceAlias  
{DSilHand_M50CaveTrigger Script for quest M50.}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ReferenceAlias Property Njada  Auto  
{Copy of NjadaStonearm actor ReferenceAlias.}

ReferenceAlias Property NjadaOriginal  Auto  
{NjadaStonearm actor ReferenceAlias.}

ReferenceAlias Property CompNord2  Auto  
{Reference Alias to Njada Shield Brother.}

ReferenceAlias Property NjadaXMarker  Auto  
{XMarker for Njada teleport on quest M50.}

ReferenceAlias Property CompNor2XMarker  Auto  
{XMarker for Njada Shield Brother (CompNord2) teleport on quest M50.}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
String THIS_FILE = "(DSilHand_M50CaveTrigger.psc) "
Bool alreadyActivated = false


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
    if( akTriggerRef == Game.GetPlayer() && GetOwningQuest().GetStage() == 10)
        Debug.Trace(THIS_FILE + "-- Player entered on Bonechill Passage")
        if(alreadyActivated == false)
            ; Activate only ONCE
            alreadyActivated = true
            bonechillDSilHandM50Teleport()
        endif
        bonechillDSilHandM50ForceCombat()
    endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; This function forces the combat between NjadaStonearm and
; DSilHand_CompanionRookieNord02 with Dragonborn. Will run each time
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function bonechillDSilHandM50ForceCombat()
    Debug.Trace(THIS_FILE + " -- bonechillDSilHandM50ForceCombat()")
    ; Njada Starts combat with the player
    if (Njada != None)
        NJada.GetActorReference().StartCombat(Game.GetPlayer())
    else
        Debug.Trace(THIS_FILE + " -- **ERROR** Njada ReferenceAlias Njada is EMPTY!")
    endif
    ; Njada Shield Brother starts combat with the player
    if (CompNord2 != None)
        CompNord2.GetActorReference().StartCombat(Game.GetPlayer())
    else
        Debug.Trace(THIS_FILE + " -- **ERROR** NJada Shield borther ReferenceAlias CompNord2 is EMPTY!")
    endif
EndFunction 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; This function teleports NjadaStonearm and DSilHand_CompanionRookieNord02
; to the XMarker Locations, and disable original Njada.  Must run only once.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function bonechillDSilHandM50Teleport()
    Debug.Trace(THIS_FILE + " -- run function: bonechillDSilHandM50Teleport()")
    ; Update Quest Stages
    GetOwningQuest().SetObjectiveCompleted(10)
    GetOwningQuest().SetStage(20)
    GetOwningQuest().SetObjectiveDisplayed(20)
    ; Njada: diable original, enable copy and move
    if (NjadaOriginal != None) 
        NjadaOriginal.GetActorRef().Disable()
    else
        Debug.Trace(THIS_FILE + "**ERROR** NjadaOriginal actor object is EMPTY!", 2)
    endif
    Njada.GetActorRef().Enable()
    DSilHand_Utils.moveSingleNpcRefAlias(Njada, NjadaXMarker, "Njada", THIS_FILE)
    ; Njada Shield Brother    
    DSilHand_Utils.moveSingleNpcRefAlias(CompNord2, CompNor2XMarker, "(Njada Shield brother) CompNord2", THIS_FILE)
EndFunction 


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














