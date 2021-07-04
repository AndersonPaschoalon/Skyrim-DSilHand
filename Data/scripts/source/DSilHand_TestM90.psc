Scriptname DSilHand_TestM90 extends ObjectReference  

Quest Property DSilHand_M90HonYsgramor  Auto  

Faction Property SilverHandFaction  Auto  

Faction Property CompanionsFaction  Auto  

Faction Property PlayerFaction  Auto  


Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("You Have Joined the Silver Hands!")
    Game.GetPlayer().AddToFaction(SilverHandFaction)
    CompanionsFaction.SetEnemy(SilverHandFaction)
    CompanionsFaction.SetEnemy(PlayerFaction)    
    Debug.MessageBox("DSilHand_TestM90");
    DSilHand_M90HonYsgramor.Start()
    DSilHand_M90HonYsgramor.SetStage(10)
    DSilHand_M90HonYsgramor.SetObjectiveDisplayed(10)
EndEvent



