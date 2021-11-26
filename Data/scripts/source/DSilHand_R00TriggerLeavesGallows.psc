Scriptname DSilHand_R00TriggerLeavesGallows extends ReferenceAlias  
{This trigger reports if the player leaves Gallows Rock after accepting a radiant quest.}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
String THIS_FILE = "(DSilHand_R00TriggerLeavesGallows.psc) "
int STAGE_SILVERHAND_BAND_TRIGGER = 70 
int STAGE_SILVERHAND_BAND_PROCEDURE = 71 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Event OnTriggerEnter(ObjectReference akTriggerRef)
    if (GetOwningQuest().GetStage() == STAGE_SILVERHAND_BAND_TRIGGER) && (akTriggerRef == Game.GetPlayer())
        ; right stage and is the player who activated the trigger
        Debug.Trace(THIS_FILE + "-- OnTriggerEnter()")
        ; advance to the stage where the right actions will be taken
        GetOwningQuest().SetStage(STAGE_SILVERHAND_BAND_PROCEDURE)
    endif
EndEvent
