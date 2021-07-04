Scriptname DSilHand_M40AliasFarkasScript extends ReferenceAlias  
{Farkas script to enable werewolf transformation}

 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ReferenceAlias Property Nord01  Auto  


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

String THIS_FILE = "(DSilHand_M40AliasFarkasScript.psc) "
Int OBJECTIVE_KILL_FARKAS = 30
Int OBJECTIVE_KILL_FARKAS_NEXT = 40
; Temporary stage to set Fjol ForceGreeging
Int STAGE_AFTER_BATTLE = 35

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: killer
; 
; Advances the quest M40 to the next stage if FARKAS and his shield brother are
; dead. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnDeath(Actor akKiller)
    if(Nord01 != None)
        if(Nord01.GetActorRef().IsDead())
            GetOwningQuest().SetObjectiveCompleted(OBJECTIVE_KILL_FARKAS)
            GetOwningQuest().SetObjectiveDisplayed(OBJECTIVE_KILL_FARKAS_NEXT)
            GetOwningQuest().SetStage(STAGE_AFTER_BATTLE)
        else
            Debug.Trace(THIS_FILE + " -- Farkas Shield Brother (Nord01) is not Dead yet...")
        endif  
    else 
        Debug.Trace(THIS_FILE + "**WARNING** ReferenceAlias Nord01 IS NULL", 1)
    endif
endEvent






