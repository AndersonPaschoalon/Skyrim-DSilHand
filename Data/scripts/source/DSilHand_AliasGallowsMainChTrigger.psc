Scriptname DSilHand_AliasGallowsMainChTrigger extends ReferenceAlias  
{DSilHand_AliasGallowsMainChTrigger script for Gallows Main Chamber script.}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Quest Property DSilHand_M50WolfAmbush  Auto  
{DSilHand_M50WolfAmbush reference to the last Quest. The Last quest (M50) must be completed to enable the trigger activation.}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

String THIS_FILE = "(DSilHand_AliasGallowsMainChamberTrigger.psc) "
Int M50_FINAL_STAGE = 40

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: player
; 
; Move Circle members to Gallows Main Chamber.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnTriggerEnter(ObjectReference akTriggerRef)
    if(DSilHand_M50WolfAmbush != None)
        ; The last quest must be completed to enable this trigger to be activated
        if( (akTriggerRef == Game.GetPlayer()) && (DSilHand_M50WolfAmbush.GetStage() >= M50_FINAL_STAGE ))
			; Move Circle Actors to Gallows' Main Chamber
            Debug.Trace(THIS_FILE + " -- The player activated the trigger DSilHand_GallowsMainChamberTrigger!")
            ; Move Circle members (Aela and Skjor)
            DSilHand_M60Helper m60script = (GetOwningQuest() as DSilHand_M60Helper)
            if(m60script == None)
                Debug.Trace(THIS_FILE + "**ERROR** Reference to DSilHand_M60Helper (object m60script) is EMPTY!")
            else
                m60script.moveCircleActors()
            endif
        endif
    else
        Debug.Trace(THIS_FILE + " **ERROR** DSilHand_M50WolfAmbush quest reference is EMPTY!!")
    endif
EndEvent

