Scriptname Sandbox_BarrelFactionScript extends ObjectReference  

Faction Property SilverHandFaction  Auto  

Faction Property CompanionsFaction  Auto  

Actor Property silver  Auto  

Actor Property companion  Auto  

int currentState = 0
int STATE_SILVER_TO_COMP_DEF = 0
int STATE_SILVER_TO_COMP_FRIND = 1
int STATE_SILVER_TO_COMP_ALLY = 2
int STATE_SILVER_TO_COMP_NEUTRAL = 3
int STATE_SILVER_TO_COMP_ENEMY = 4

Function stopCombat() 
    silver.StopCombat()
    silver.StopCombatAlarm()
    companion.StopCombat()
    companion.StopCombatAlarm()    
endFunction

Event OnActivate(ObjectReference akActionRef)
    stopCombat() 
    currentState = currentState + 1 
    if(currentState > 4)
        currentState = 0
    endif
    Debug.MessageBox("Test FACTIONS RELATIONSHIPS currentState:<" + currentState + ">" )    
    if (currentState == STATE_SILVER_TO_COMP_DEF)
        Debug.MessageBox("STATE_SILVER_TO_COMP_DEF")
    elseif (currentState == STATE_SILVER_TO_COMP_FRIND)
        Debug.MessageBox("STATE_SILVER_TO_COMP_FRIND")
        SilverHandFaction.SetAlly(CompanionsFaction)
    elseif (currentState == STATE_SILVER_TO_COMP_ALLY)
        Debug.MessageBox("STATE_SILVER_TO_COMP_ALLY")
        SilverHandFaction.SetAlly(CompanionsFaction, true, true)
    elseif (currentState == STATE_SILVER_TO_COMP_NEUTRAL)
        Debug.MessageBox("STATE_SILVER_TO_COMP_NEUTRAL")
        SilverHandFaction.SetEnemy(CompanionsFaction, true, true)
    elseif (currentState == STATE_SILVER_TO_COMP_ENEMY)
        Debug.MessageBox("STATE_SILVER_TO_COMP_ENEMY")
        SilverHandFaction.SetEnemy(CompanionsFaction)
    endif
endEvent
