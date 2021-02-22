Scriptname DSilHand_M10AliasTrollScript extends ReferenceAlias  


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

MiscObject Property DSIlHand_BoneGiantTrollSkull  Auto  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
String THIS_FILE = "(DSilHand_M10AliasTrollScript.psc) "

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
    Debug.Trace( THIS_FILE + " -- OnItemRemoved: akBaseItem:" + akBaseItem + ", aiItemCount:" + aiItemCount + ", akItemReference:" + akItemReference + ", akDestContainer:" + akDestContainer) 
    if( (akBaseItem == DSIlHand_BoneGiantTrollSkull ) &&  (akDestContainer == Game.GetPlayer()) )
        Debug.Trace(THIS_FILE + " Troll skull removed and added to player container")
        GetOwningQuest().SetObjectiveCompleted(30)
        GetOwningQuest().SetObjectiveDisplayed(40)
        GetOwningQuest().SetStage(40)
    endif
Endevent


