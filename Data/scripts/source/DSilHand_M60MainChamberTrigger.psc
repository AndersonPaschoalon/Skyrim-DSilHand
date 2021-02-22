Scriptname DSilHand_M60MainChamberTrigger extends ReferenceAlias  
{DSilHand_M60MainChamberTrigger}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

String THIS_FILE = "(DSilHand_M60MainChamberTrigger.psc) "
Int STAGE_ENABLE_CIRCLE = 20

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: player
; 
; Move Circle members to Gallows Main Chamber.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnTriggerEnter(ObjectReference akTriggerRef)
    ; The last quest must be completed to enable this trigger to be activated
    if( (akTriggerRef == Game.GetPlayer()) && (GetOwningQuest().GetStage() >= STAGE_ENABLE_CIRCLE))
        ; Player entered on trigger when Stage >= 20
        Debug.Trace(THIS_FILE + " OnTriggerEnter() -> Enable Circle Members. GetOwningQuest().GetStage():<" + GetOwningQuest().GetStage() + ">")
        ; Move Circle Actors to Gallows' Main Chamber
        Debug.Trace(THIS_FILE + " -- The player activated the trigger DSilHand_GallowsMainChamberTrigger!")
        ; Move Circle members (Aela and Skjor)
        DSilHand_M60Helper m60script = (GetOwningQuest() as DSilHand_M60Helper)
        if(m60script == None)
            Debug.Trace(THIS_FILE + "**ERROR** Reference to DSilHand_M60Helper (object m60script) is EMPTY!", 2)
        else
            Debug.Trace(THIS_FILE + " -- Enable Cricle Members")
            m60script.enableCircleMembers()
        endif
    endif
EndEvent
