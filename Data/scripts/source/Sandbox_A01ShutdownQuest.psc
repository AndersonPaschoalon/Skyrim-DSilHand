Scriptname Sandbox_A01ShutdownQuest extends ObjectReference  

Faction Property SilverHandFaction  Auto  

Faction Property CompanionsFaction  Auto  

Faction Property PlayerFaction  Auto  


Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("You Have Joined the Companions!")
    SilverHandFaction.SetEnemy(PlayerFaction)
EndEvent

