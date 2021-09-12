Scriptname DSilHand_M90AliasWolfSpirit extends ReferenceAlias  
{Wolf Spirit, advances the quest when it dies.}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Member variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Consts
String THIS_FILE = "(DSilHand_M90AliasWolfSpirit.psc) "
int STAGE_KODLACK_SAVED = 40


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Private Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function handlerWolfSpiritDeath()
    Debug.Trace(THIS_FILE + " -- handlerWolfSpiritDeath()")
    int currStage = GetOwningQuest().GetStage()
    Debug.Trace(THIS_FILE + " -- GetOwningQuest().GetStage():" + currStage)
    if(currStage < STAGE_KODLACK_SAVED)
        Debug.Trace(THIS_FILE + " -- setting stage " + STAGE_KODLACK_SAVED)
        GetOwningQuest().SetStage(STAGE_KODLACK_SAVED)
    endif
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Events
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Runs when the wolfspirit dies
Event OnDeath(Actor akKiller)
    Debug.Trace(THIS_FILE + " -- OnDeath()")
    handlerWolfSpiritDeath()
endEvent


