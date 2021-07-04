Scriptname Sandbox_BarrelFactionToPlayerScript extends ObjectReference  

Faction Property SilverHandFaction  Auto  

Faction Property CompanionsFaction  Auto  

Actor Property silver  Auto  

Actor Property comp  Auto  

int currentState = 0
int STATE_PLAYER_NONE = 1
int STATE_PLAYER_SILVER = 2
int STATE_PLAYER_COMP = 3
int STATE_PLAYER_BOTH = 4

Function stopCombat() 
    silver.StopCombat()
    silver.StopCombatAlarm()
    comp.StopCombat()
    comp.StopCombatAlarm()    
endFunction


Event OnActivate(ObjectReference akActionRef)
    stopCombat() 
    currentState = currentState + 1 
    if(currentState > 4)
        currentState = 0
    endif
    Debug.MessageBox("Test add/remove actor from faction Sandbox_BarrelTestFaction currentState:<" + currentState + ">" )    
    if (currentState == STATE_PLAYER_NONE)
        Debug.MessageBox("STATE_PLAYER_NONE player removed from both")
        Game.GetPlayer().RemoveFromFaction(CompanionsFaction)
        Game.GetPlayer().RemoveFromFaction(SilverHandFaction)
    elseif (currentState == STATE_PLAYER_SILVER) 
        Debug.MessageBox("STATE_PLAYER_SILVER added player to silver")
        Game.GetPlayer().AddToFaction(SilverHandFaction)
        Game.GetPlayer().RemoveFromFaction(CompanionsFaction)
    elseif (currentState == STATE_PLAYER_COMP)
        Debug.MessageBox("STATE_PLAYER_COMP added player to comp")
        Game.GetPlayer().AddToFaction(CompanionsFaction)
        Game.GetPlayer().RemoveFromFaction(SilverHandFaction)
    elseif (currentState == STATE_PLAYER_BOTH)
        Debug.MessageBox("STATE_PLAYER_BOTH added player to both")
        Game.GetPlayer().AddToFaction(CompanionsFaction)
        Game.GetPlayer().AddToFaction(SilverHandFaction)
    endif

endEvent
