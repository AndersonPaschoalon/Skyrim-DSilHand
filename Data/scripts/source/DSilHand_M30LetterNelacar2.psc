Scriptname DSilHand_M30LetterNelacar2 extends ReferenceAlias  
{Script to Go to the next quest stage after oppening the letter.}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

String THIS_FILE = "(DSilHand_M30LetterNelacar2.psc) "

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
    Debug.Trace(THIS_FILE + " Event OnRead  GetOwningQuest()<" + GetOwningQuest() + ">")
    GetOwningQuest().SetObjectiveCompleted(30)
    GetOwningQuest().SetObjectiveDisplayed(40)
    GetOwningQuest().SetStage(40)
endEvent
