Scriptname DSilHand_LetterNelacarScript extends ObjectReference  
{Script to Go to the next quest stage after oppening the letter.}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Quest Property DSilHand_M30ScholarFragment  Auto  
{Reference to the Quest.}

String THIS_FILE = "(DSilHand_LetterNelacarScript.psc) "

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; This script run on the Quest M30: Scholar Fragment. It reports to the
; Quest object that the player has read the Nelacar Letter, so the quest stage
; and objective should advance to 40.
; 
; Input void
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnRead()
    ;Debug.Trace(THIS_FILE + " Event OnRead ")
   ; DSilHand_M30ScholarFragment.SetObjectiveCompleted(30)
   ; DSilHand_M30ScholarFragment.SetObjectiveDisplayed(40)
   ; DSilHand_M30ScholarFragment.SetStage(40)
endEvent
