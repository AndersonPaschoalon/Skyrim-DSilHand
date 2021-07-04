Scriptname Sandbox_BarrelTestFaction extends ObjectReference  

Faction Property SilverHandFaction  Auto  

Faction Property CompanionsFaction  Auto  

Actor Property NewProperty  Auto  

Actor Property silver  Auto  

Actor Property Companions  Auto  


int currentState = 0
int STATE_BOTH_ADDED = 1
int STATE_SILVER_REMOVED = 2
int STATE_COMP_REMOVED = 3
int STATE_BOTH_REMOVED = 4

Function stopCombat() 
    silver.StopCombat()
    silver.StopCombatAlarm()
    Companions.StopCombat()
    Companions.StopCombatAlarm()    
endFunction


Event OnActivate(ObjectReference akActionRef)
    stopCombat() 
    currentState = currentState + 1 
    if(currentState > 4)
        currentState = 0
    endif
    Debug.MessageBox("Test add/remove actor from faction Sandbox_BarrelTestFaction currentState:<" + currentState + ">" )    
    if (currentState == STATE_BOTH_ADDED)
        Debug.MessageBox("STATE_BOTH_ADDED npcs added to both")
        Companions.AddToFaction(CompanionsFaction)
        silver.AddToFaction(SilverHandFaction)

    elseif (currentState == STATE_SILVER_REMOVED) 
        Debug.MessageBox("STATE_SILVER_REMOVED npc comp added silver removed")
        Companions.AddToFaction(CompanionsFaction)
        silver.RemoveFromFaction(SilverHandFaction)

    elseif (currentState == STATE_COMP_REMOVED)
        Debug.MessageBox("STATE_COMP_REMOVED npc silver added comp removed")
        Companions.RemoveFromFaction(CompanionsFaction)
        silver.AddToFaction(SilverHandFaction)

    elseif (currentState == STATE_BOTH_REMOVED)
        Debug.MessageBox("STATE_BOTH_REMOVED both npcs removed")
        Companions.RemoveFromFaction(CompanionsFaction)
        silver.RemoveFromFaction(SilverHandFaction)

    endif
endEvent





