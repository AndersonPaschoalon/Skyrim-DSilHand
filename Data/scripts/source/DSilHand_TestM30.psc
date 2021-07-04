Scriptname DSilHand_TestM30 extends ObjectReference  

Quest Property DSilHand_M30ScholarFragment  Auto  

Faction Property SilverHandFaction  Auto  

Faction Property CompanionsFaction  Auto  

Faction Property PlayerFaction  Auto  

Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("You Have Joined the Silver Hands!")
    Game.GetPlayer().AddToFaction(SilverHandFaction)
    CompanionsFaction.SetEnemy(SilverHandFaction)
    CompanionsFaction.SetEnemy(PlayerFaction)   
    Debug.MessageBox("DSilHand_TestM30");
    DSilHand_M30ScholarFragment.Start()
    DSilHand_M30ScholarFragment.SetStage(10)
    DSilHand_M30ScholarFragment.SetObjectiveDisplayed(10)
EndEvent

