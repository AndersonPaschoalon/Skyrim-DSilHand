Scriptname DSilHand_TestM30 extends ObjectReference  

Quest Property DSilHand_M30ScholarFragment  Auto  

Faction Property SilverHandFaction  Auto  

Faction Property CompanionsFaction  Auto  

Faction Property PlayerFaction  Auto  

Quest Property DSilHand_A01Troubleshoot  Auto  

Event OnActivate(ObjectReference akActionRef)
    DSilHand_A01Troubleshoot.SetStage(30)
;    Debug.MessageBox("You Have Joined the Silver Hands!")
;    Game.GetPlayer().AddToFaction(SilverHandFaction)
;    CompanionsFaction.SetEnemy(SilverHandFaction)
;    CompanionsFaction.SetEnemy(PlayerFaction)   
;    Debug.MessageBox("DSilHand_TestM30");
;    DSilHand_M30ScholarFragment.Start()
;    DSilHand_M30ScholarFragment.SetStage(10)
;    DSilHand_M30ScholarFragment.SetObjectiveDisplayed(10)
EndEvent



