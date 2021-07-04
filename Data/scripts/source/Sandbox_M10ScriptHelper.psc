Scriptname Sandbox_M10ScriptHelper extends ObjectReference  

Faction Property SilverHandFaction  Auto  

Faction Property CompanionsFaction  Auto  

Faction Property PlayerFaction  Auto  


Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("You Have Joined the Silver Hands!")
    Game.GetPlayer().AddToFaction(SilverHandFaction)
    CompanionsFaction.SetEnemy(SilverHandFaction)
    CompanionsFaction.SetEnemy(PlayerFaction)
EndEvent

