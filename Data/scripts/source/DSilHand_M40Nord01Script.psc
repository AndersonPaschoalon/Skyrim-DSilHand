Scriptname DSilHand_M40Nord01Script extends ReferenceAlias  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ReferenceAlias Property Farkas  Auto  


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
String THIS_FILE = "(DSilHand_M40Nord01Script.psc) "
Int STAGE_AFTER_BATTLE = 40
Int OBJECTIVE_KILL_FARKAS = 30
Int OBJECTIVE_KILL_FARKAS_NEXT = 40


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: killer
; 
; Advances the quest M40 to the next stage if FARKAS and his shield brother are
; dead. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnDeath(Actor akKiller)
    if(Farkas != None)
        if(Farkas.GetActorRef().IsDead())
            GetOwningQuest().SetObjectiveCompleted(OBJECTIVE_KILL_FARKAS)
            GetOwningQuest().SetObjectiveDisplayed(OBJECTIVE_KILL_FARKAS_NEXT)
            GetOwningQuest().SetStage(STAGE_AFTER_BATTLE)
        else
            Debug.Trace(THIS_FILE + " -- Farkas is not Dead yet...")
        endif  
    else 
        Debug.Trace(THIS_FILE + "**WARNING** ReferenceAlias Farkas IS NULL", 1)
    endif
endEvent
