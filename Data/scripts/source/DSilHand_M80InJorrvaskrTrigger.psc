Scriptname DSilHand_M80InJorrvaskrTrigger extends ReferenceAlias  
{Trigger to be fired when the player enters Jorrvaskr in the quest DSilHand_M80.}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
String THIS_FILE = "(DSilHand_M80InJorrvaskrTrigger.psc) "
int BEFORE_BATTLE_STAGE = 40
int BATTLE_STAGE = 50

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void 
;
; Handle the trigger activation. If M80 quest stage is 60, it will start the 
; Scene.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function playerEnterHandler(ObjectReference akTriggerRef)
    Debug.Trace(THIS_FILE + " -- OnTriggerEnter: playerEnterHandler")
    ; Only activates if m80 stage is BEFORE_BATTLE_STAGE.
    if( akTriggerRef == Game.GetPlayer() && GetOwningQuest().GetStage() == BEFORE_BATTLE_STAGE)
        Debug.Trace(THIS_FILE + " -- the player enteret the trigger M80InJorrvaskrTrigger toe BATTLE!")
        Debug.Trace(THIS_FILE + " -- ObjectiveCompleted/Displayed: " + BEFORE_BATTLE_STAGE + "/" + BATTLE_STAGE)
        Debug.Trace(THIS_FILE + " -- SetStage: " + BATTLE_STAGE)
        GetOwningQuest().SetObjectiveCompleted(BEFORE_BATTLE_STAGE)
        GetOwningQuest().SetStage(BATTLE_STAGE)
        GetOwningQuest().SetObjectiveDisplayed(BATTLE_STAGE)
    endif
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
    playerEnterHandler(akTriggerRef)     
EndEvent

