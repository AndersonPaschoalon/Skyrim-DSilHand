Scriptname DSilHand_M70AliasFrag01 extends ReferenceAlias  
{DSilHand: Script for Frag01 of Ysgramor Axe.}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
String THIS_FILE = "(DSilHand_M70AliasFrag01.psc) "


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; This script run on the Quest M70: Uncovering the Past. It reports to the
; Quest object that the player has taken the fragment from the chest
; 
; Input akNewContainer: destination container
; Input akOldContainer: First Container
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
    ; If the player have grabed the Item from the chest
    Debug.Trace(THIS_FILE + " -- OnContainerChanged()  for Frag01 GetOwningQuest()<" + GetOwningQuest() + ">")
    if (akNewContainer == Game.GetPlayer() && GetOwningQuest().GetStage() >= 10)
        Debug.Trace(THIS_FILE + "-- Item Frag01 moved to player inventory!")
        GetOwningQuest().SetObjectiveCompleted(10)
        GetOwningQuest().SetObjectiveDisplayed(20)
        GetOwningQuest().SetStage(20)
    endIf
EndEvent


