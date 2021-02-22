Scriptname DSilHand_M20AliasFrag08 extends ReferenceAlias  
{DSilHand: Script for Frag08 of Ysgramor Axe.}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
String THIS_FILE = "(DSilHand_M20AliasFrag08.psc) "


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; This script run on the Quest M20: Angarvundes' Treasure. It reports to the
; Quest object that the player has taken the fragment from the boss chest
; 
; Input akNewContainer: destination container
; Input akOldContainer: First Container
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
    ; If the player have grabed the Item from the chest
    Debug.Trace(THIS_FILE + " -- OnContainerChanged()  for Frag09 GetOwningQuest()<" + GetOwningQuest() + ">")
    if (akNewContainer == Game.GetPlayer() && GetOwningQuest().GetStage() >= 10)
        Debug.Trace(THIS_FILE + "-- Item Frag08 moved to player inventor!")
        GetOwningQuest().SetObjectiveCompleted(30)
        GetOwningQuest().SetObjectiveDisplayed(40)
        GetOwningQuest().SetStage(40)
    endIf
EndEvent

