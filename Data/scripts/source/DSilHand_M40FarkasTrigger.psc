Scriptname DSilHand_M40FarkasTrigger extends ReferenceAlias  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
String THIS_FILE = "(DSilHand_M40FarkasTrigger.psc) "
int    STAGE_EXPLORING_DUSTMANS_CAIRN = 20
int    STAGE_INTERMEDIATE_STAGE = 25

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: player
; 
; The event is triggered when the player is exploring Dustman's Cairn and 
; arrives at the first central chamber. Then, Farkas and his shield brother 
; will appear to fight.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnTriggerEnter(ObjectReference akTriggerRef)
    if(GetOwningQuest().GetStage() == STAGE_EXPLORING_DUSTMANS_CAIRN)
        if(akTriggerRef == Game.GetPlayer())
            GetOwningQuest().SetStage(STAGE_INTERMEDIATE_STAGE)
        else
            Debug.Trace(THIS_FILE + "**WARNING** NOT THE PLAYER CROSSED THE TRIGGER!!", 1)
            Debug.Trace(THIS_FILE + "**WARNING** akTriggerRef:<" + akTriggerRef + ">", 1)
        endif      
    else 
        Debug.Trace(THIS_FILE + " -- Something crossed the trigger DSilHand_M40FarkasTrigger akTriggerRef:" + akTriggerRef + ">")
        Debug.Trace(THIS_FILE + " -- The quest M40 will not be advanced because the stage is not the expected. Expected/Actual:<" + STAGE_EXPLORING_DUSTMANS_CAIRN + "/" + GetOwningQuest().GetStage() + ">")
    endif
EndEvent