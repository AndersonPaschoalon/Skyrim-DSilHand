Scriptname DSilHand_M10DriftshadeEntranceTrigger extends ReferenceAlias  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ReferenceAlias Property DriftshadeGuard  Auto  


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

String THIS_FILE = "(DSilHand_M10DriftshadeEntranceTrigger.pcs)  "
Int QUEST_TASK_STAGE = 20


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: none
; 
; First met conversation with Driftshade Guard. If he have not sent you to 
; Gallows already,  or you have not failed M10 (joining the Companions), 
; he will start talking to you and draw his weapon
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function firstMetConversation()
    Debug.Trace(THIS_FILE + " -- firstMetConversation (Driftshade Guard)")
    Actor guard = DriftshadeGuard.GetActorReference()
    if(guard != None)
        Debug.Trace(THIS_FILE + " -- DriftshadeGuard:<" + guard + ">")
        ; TODO Make the Gallows Guard Draw his weapon 
        ; TODO Close Gallows main entrance
        ; TODO make the guard start a conversation
        ; https://www.creationkit.com/index.php?title=ForceGreet_(Procedure) 
        guard.DrawWeapon()
    else 
        Debug.Trace(THIS_FILE + "**ERROR**  COULD NOT LOAD DriftshadeGuard.GetActorReference()", 2)
    endif
Endfunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Actor who entes on the trigger-box close to the Gallows Rock entrance. 
; 
; This is script is executed when the player entes on Gallows Rock
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnTriggerEnter(ObjectReference akTriggerRef)
    if( akTriggerRef == Game.GetPlayer() && (GetOwningQuest().GetStage() < QUEST_TASK_STAGE ) )
        firstMetConversation()
    endif
EndEvent

