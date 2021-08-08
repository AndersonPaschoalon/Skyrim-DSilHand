Scriptname DSilHand_M80FakeKodlak extends ReferenceAlias  
{Script for Kodlack. When all circle members are ded, the quest advances.}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ReferenceAlias Property FakeVilkas  Auto  
{FakeVilkas ACTOR OBJECT}

ReferenceAlias Property CircleNord01  Auto  
{CircleNord01 ACTOR OBJECT}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

String THIS_FILE = "(DSilHand_M80FakeKodlak.psc)"
int STAGE_BATTLE = 50
int STAGE_BATTLE_END = 60


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: killer
; 
; Advances the quest M80 to the next stage if all Circle members are dead.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnDeath(Actor akKiller)
    Debug.Trace(THIS_FILE + " -- FakeKodlak is DEAD")
    if(DSilHand_Utils.are2ActorsRefAliasDead(CircleNord01, FakeVilkas, THIS_FILE))
        Debug.Trace(THIS_FILE + " -- CircleNord01, FakeVilkas, FakeKodlak are Dead!")
        Debug.Trace(THIS_FILE + " -- ADVANCES TO STAGE " + STAGE_BATTLE_END)
        GetOwningQuest().SetObjectiveCompleted(STAGE_BATTLE)
        GetOwningQuest().SetObjectiveDisplayed(STAGE_BATTLE_END)
        GetOwningQuest().SetStage(STAGE_BATTLE_END)
    else 
        Debug.Trace(THIS_FILE + " Not all circle members are dead yet!")
        Debug.Trace(THIS_FILE + " -- cIRCLE IsDead() result:")
        Debug.Trace(THIS_FILE + "    * FakeKodlak: <" + CircleNord01.GetActorReference().IsDead() + ">")
        Debug.Trace(THIS_FILE + "    * FakeVilkas : <" + FakeVilkas.GetActorReference().IsDead() + ">")  
    endif
endEvent

