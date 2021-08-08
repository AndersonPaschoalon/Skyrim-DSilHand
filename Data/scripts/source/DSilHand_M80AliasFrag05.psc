Scriptname DSilHand_M80AliasFrag05 extends ReferenceAlias  
{DSilHand: Script for Frag05 of Ysgramor Axe.}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
String THIS_FILE = "(DSilHand_M80AliasFrag05.psc) "
int QUEST_STAGE_FRAMENT = 80
int QUEST_STAGE_DELIVER = 90


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
    Debug.Trace(THIS_FILE + " -- OnContainerChanged()  for Frag05 GetOwningQuest()<" + GetOwningQuest() + "> (last frament quest)")
    if (akNewContainer == Game.GetPlayer() && GetOwningQuest().GetStage() >= QUEST_STAGE_FRAMENT)
        Debug.Trace(THIS_FILE + "-- Item Frag05 moved to player's inventory!")
        GetOwningQuest().SetObjectiveCompleted(QUEST_STAGE_FRAMENT)
        GetOwningQuest().SetObjectiveDisplayed(QUEST_STAGE_DELIVER)
        GetOwningQuest().SetStage(QUEST_STAGE_DELIVER)
        Debug.Trace(THIS_FILE + "-- Emulates Fjol collecting the other fragments")
        DSilHand_M80Helper m80Helper = (GetOwningQuest() as DSilHand_M80Helper)
        m80Helper.fjolCollectFragments()        
    endIf
EndEvent


