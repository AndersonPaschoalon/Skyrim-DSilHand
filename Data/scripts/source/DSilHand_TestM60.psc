Scriptname DSilHand_TestM60 extends ObjectReference  

Quest Property DSilHand_M60Retaliation  Auto  

Faction Property SilverHandFaction  Auto  

Faction Property CompanionsFaction  Auto  

Faction Property PlayerFaction  Auto  

Quest Property DSilHand_A01Troubleshoot  Auto  

Event OnActivate(ObjectReference akActionRef)
    DSilHand_A01Troubleshoot.SetStage(60) 
;    Debug.MessageBox("You Have Joined the Silver Hands!")
;    Game.GetPlayer().AddToFaction(SilverHandFaction)
;    CompanionsFaction.SetEnemy(SilverHandFaction)
;    CompanionsFaction.SetEnemy(PlayerFaction)   
;    Debug.MessageBox("DSilHand_TestM60");
;    DSilHand_M60Retaliation.Start()
;    DSilHand_M60Retaliation.SetStage(10)
;    DSilHand_M60Retaliation.SetObjectiveDisplayed(10)
EndEvent





