Scriptname Sandbox_BarrelRemoveCrime extends ObjectReference  

Faction Property CrimeFactionWhiterun  Auto  

Faction Property TownWhiterunFaction  Auto  

int nActivates = 0


Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("Tutorial Sandbox_BarrelRemoveCrime => Remove Crime")
    if (nActivates == 0)
        Debug.MessageBox("0: GetCrimeGoldViolent<" + CrimeFactionWhiterun.GetCrimeGoldViolent() + ">")
        Debug.MessageBox("0: GetCrimeGold<" + CrimeFactionWhiterun.GetCrimeGold() + ">")
        CrimeFactionWhiterun.PlayerPayCrimeGold(false, false)
        Debug.MessageBox("0: CrimeFactionWhiterun.PlayerPayCrimeGold(false, false)")
        nActivates = 1
    elseif(nActivates == 1)
        Faction crimeFac = Game.GetPlayer().GetCrimeFaction()
        crimeFac.PlayerPayCrimeGold(true, true)
        Debug.MessageBox("1: Game.GetPlayer().GetCrimeFaction() => <" + crimeFac + ">")
        nActivates = 2
    elseif(nActivates == 2)
        Debug.MessageBox("2: SetCrimeGold")
        CrimeFactionWhiterun.SetCrimeGoldViolent(0)
        CrimeFactionWhiterun.SetCrimeGold(0)
        nActivates = 3
    elseif(nActivates == 3)
        Debug.MessageBox("3: TownWhiterunFaction.GetCrimeGoldViolent(): <" + TownWhiterunFaction.GetCrimeGoldViolent() + ">")       
        nActivates = 4
    elseif(nActivates == 4)
        Debug.MessageBox("0: GetCrimeGoldViolent<" + CrimeFactionWhiterun.GetCrimeGoldViolent() + ">")
        Debug.MessageBox("0: GetCrimeGold<" + CrimeFactionWhiterun.GetCrimeGold() + ">")        
        CrimeFactionWhiterun.PlayerPayCrimeGold(true, true)
        Debug.MessageBox("4: CrimeFactionWhiterun.PlayerPayCrimeGold(true, true)")      
        nActivates = 0        
    endif
endEvent








