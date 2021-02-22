Scriptname DSilHand_YsgramorsBladePiece08Script extends ObjectReference  
{DSilHand: Script for Frag08 of Ysgramor Axe.}

Quest Property DSilHand_M20AngarvundesTreasure  Auto  
{Quest Reference}

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
    if (akNewContainer == Game.GetPlayer() && DSilHand_M20AngarvundesTreasure.GetStage() >= 10)
        Debug.Trace("-- Item Frag08 moved to player inventor!")
        DSilHand_M20AngarvundesTreasure.SetObjectiveCompleted(30)
        DSilHand_M20AngarvundesTreasure.SetObjectiveDisplayed(40)
        DSilHand_M20AngarvundesTreasure.SetStage(40)
    endIf
endEvent