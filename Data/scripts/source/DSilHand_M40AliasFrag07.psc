Scriptname DSilHand_M40AliasFrag07 extends ReferenceAlias  
{DSilHand: Script for Frag07 of Ysgramor Axe.}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
String THIS_FILE = "(DSilHand_M40AliasFrag07.psc) "

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input akNewContainer: destination container
; Input akOldContainer: First Container
;
; This script run on the Quest M40: Companion Conspiracy. It reports to the
; Quest object that the player has taken the fragment from the Dungeon
; altar. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
    ; If the player have grabed the Item from the chest
    Debug.Trace(THIS_FILE + " -- OnContainerChanged()  for Frag07 GetOwningQuest()<" + GetOwningQuest() + ">")
    if (akNewContainer == Game.GetPlayer() && GetOwningQuest().GetStage() >= 10)
        Debug.Trace(THIS_FILE + "-- Item Frag07 moved to player inventory!")
        GetOwningQuest().SetObjectiveCompleted(40)
        GetOwningQuest().SetObjectiveDisplayed(50)
        GetOwningQuest().SetStage(50)
    endIf
EndEvent