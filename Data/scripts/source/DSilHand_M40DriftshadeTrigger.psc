Scriptname DSilHand_M40DriftshadeTrigger extends ReferenceAlias  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
String THIS_FILE = "(DSilHand_M40FDriftshadeTrigger.psc) "
int    STAGE_PRE_START_QUEST= 5
int    STAGE_START_QUEST= 10
int    OBJECTIVE_START_QUEST = 10

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: player
; 
; Complete the quest M50 when the player arrives back to Gallows Rock.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnTriggerEnter(ObjectReference akTriggerRef)
    if(GetOwningQuest().GetStage() == STAGE_PRE_START_QUEST)
        if(akTriggerRef == Game.GetPlayer())
            ; Starts next quest
            Debug.Trace(THIS_FILE + "-- Starts quest M40")
            GetOwningQuest().Start()
            Debug.Trace(THIS_FILE + "--  M40 -> Stage:10 ObjectiveDisplayed:10")
            GetOwningQuest().SetStage(STAGE_START_QUEST)
            GetOwningQuest().SetObjectiveDisplayed(OBJECTIVE_START_QUEST)
        else
            Debug.Trace(THIS_FILE + "**WARNING** NOT THE PLAYER CROSSED THE DRIFTSAHDE TRIGGER!!", 1)
            Debug.Trace(THIS_FILE + "**WARNING** akTriggerRef:<" + akTriggerRef + ">", 1)
        endif      
    endif
EndEvent
