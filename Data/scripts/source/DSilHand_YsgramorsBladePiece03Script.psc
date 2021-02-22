Scriptname DSilHand_YsgramorsBladePiece03Script extends ObjectReference  
{Script for the third piece of the Ysgramors Axe.}

Quest Property DSilHand_M30ScholarFragment  Auto  
{Reference to the Quest}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; This script run on the Quest M30: Scholar Fragment. It reports to the
; Quest object that the player has taken the fragment from  Sergius Turrianus
; "bag".
; 
; Input akNewContainer: destination container
; Input akOldContainer: First Container
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
    ; If the player have grabed the Item from the chest
    ;if (akNewContainer == Game.GetPlayer())
   ;     Debug.Trace("-- Item Frag03 moved to player inventor!")
   ;     DSilHand_M30ScholarFragment.SetObjectiveCompleted(40)
    ;    DSilHand_M30ScholarFragment.SetObjectiveDisplayed(50)
   ;     DSilHand_M30ScholarFragment.SetStage(50)
   ; endIf
endEvent
