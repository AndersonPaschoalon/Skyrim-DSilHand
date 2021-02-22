Scriptname DSilHand_M10GallowsEntranceTrigger extends ReferenceAlias  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ReferenceAlias Property GallowsGuard  Auto  


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

String THIS_FILE = "(DSilHand_M10GallowsEntranceTrigger.pcs)  "
Int QUEST_TASK_STAGE = 30


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: none
; 
; First met conversation with Gallows Guard. If he have not give to you a quest
; or you have not failed M10 (joining the Companions), he will start talking to
; you and draw his weapon
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function firstMetConversation()
    Debug.Trace(THIS_FILE + " -- firstMetConversation")
    Actor guard = GallowsGuard.GetActorReference()
    if(guard != None)
        Debug.Trace(THIS_FILE + " -- GallowsGuard:<" + guard + ">")
        ; TODO Make the Gallows Guard Draw his weapon 
        ; TODO Close Gallows main entrance
        ; TODO make the guard start a conversation
        ; https://www.creationkit.com/index.php?title=ForceGreet_(Procedure) 
        Debug.Trace(THIS_FILE + "GallowsGuard <" + GallowsGuard + ">.DrawWeapon()" )
        guard.DrawWeapon()
    else 
        Debug.Trace( THIS_FILE + "**ERROR**  COULD NOT LOAD GallowsGuard.GetActorReference()", 2)
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
    Debug.Trace("<" + GallowsGuard + ">")
    if( akTriggerRef == Game.GetPlayer() && (GetOwningQuest().GetStage() < QUEST_TASK_STAGE ) )
        firstMetConversation()
    endif
EndEvent
