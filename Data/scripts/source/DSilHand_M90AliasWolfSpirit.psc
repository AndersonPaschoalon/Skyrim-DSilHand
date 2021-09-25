Scriptname DSilHand_M90AliasWolfSpirit extends ReferenceAlias  
{Wolf Spirit, advances the quest when it dies.}

Ingredient Property Ectoplasm  Auto  
{Ectoplasm to be dropped when the Wolf dies.}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Member variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Consts
String THIS_FILE = "(DSilHand_M90AliasWolfSpirit.psc) "
int STAGE_KILL_WOLF = 30
int STAGE_KODLACK_SAVED = 40


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Private Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function handlerWolfSpiritDeath()
    Debug.Trace(THIS_FILE + " -- handlerWolfSpiritDeath()")
    int currStage = GetOwningQuest().GetStage()
    Debug.Trace(THIS_FILE + " -- GetOwningQuest().GetStage():" + currStage)
    if(currStage < STAGE_KODLACK_SAVED)
        Debug.Trace(THIS_FILE + " -- completing objective completed " + STAGE_KILL_WOLF)
        GetOwningQuest().SetObjectiveCompleted(STAGE_KILL_WOLF)
        Debug.Trace(THIS_FILE + " -- setting stage " + STAGE_KODLACK_SAVED)
        GetOwningQuest().SetStage(STAGE_KODLACK_SAVED)
    endif
    ; Make body disapear, and put some ectoplasm in the same place
    Debug.Trace(THIS_FILE + " -- add actoplasm to be dropped")
    GetReference().AddItem(Ectoplasm)
    Debug.Trace(THIS_FILE + " -- wait a small time")
    Utility.Wait(1)
    Debug.Trace(THIS_FILE + " -- drop some ectoplasm")
    GetReference().DropObject(Ectoplasm, 1)
    Debug.Trace(THIS_FILE + " -- disable Wolf spirit body")
    Utility.Wait(0.1)
    GetActorReference().Delete()
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Events
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Runs when the wolfspirit dies
Event OnDeath(Actor akKiller)
    Debug.Trace(THIS_FILE + " -- OnDeath()")
    handlerWolfSpiritDeath()
endEvent

