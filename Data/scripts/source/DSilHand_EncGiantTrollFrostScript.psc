Scriptname DSilHand_EncGiantTrollFrostScript extends ObjectReference  
{Functions and event related to the Giant Frost Troll.}

Quest Property DSilvHand_M10SilverHunt  Auto  
{Quest related to the Giant Frost Troll.}

MiscObject Property TrollSkull  Auto  

Actor Property troll  Auto  


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; This trigger is activated when the player collects the Giant Frost Troll
; Skull. 
; 
; Input akBaseItem: The base object for the item that was removed from this container.
; Input aiItemCount: The number of items removed from this container.
; Input akItemReference: The specific reference removed from the container, if any. Will be None if a non-persistant object is moved to a different container; a persistant or not item used in crafting, (most likely) when consumed. If a non-persistant item is dropped from inventory into the world the generated reference is received.
; Input akDestContainer: The container that the object(s) went to. If None, then the object was dropped into the world, used in crafting or consumed.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
    Debug.Trace("-- OnItemRemoved: akBaseItem:" + akBaseItem + ", aiItemCount:" + aiItemCount + ", akItemReference:" + akItemReference + ", akDestContainer:" + akDestContainer) 
    if(akBaseItem == TrollSkull)
        if(akDestContainer == Game.GetPlayer())
            DSilvHand_M10SilverHunt.SetObjectiveCompleted(30)
            DSilvHand_M10SilverHunt.SetObjectiveDisplayed(40)
            DSilvHand_M10SilverHunt.SetStage(40)
        endif
    endif
Endevent



