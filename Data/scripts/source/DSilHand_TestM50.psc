Scriptname DSilHand_TestM50 extends ObjectReference  

Quest Property DSilHand_M50WolfAmbush  Auto  

Actor Property DSilHand_KrevTheSkenner  Auto  

Faction Property SilverHandFaction  Auto  

Faction Property CompanionsFaction  Auto  

Faction Property PlayerFaction  Auto  


Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("You Have Joined the Silver Hands!")
    Game.GetPlayer().AddToFaction(SilverHandFaction)
    CompanionsFaction.SetEnemy(SilverHandFaction)
    CompanionsFaction.SetEnemy(PlayerFaction)   
    Debug.MessageBox("DSilHand_TestM50");
    DSilHand_KrevTheSkenner.Enable()
    DSilHand_M50WolfAmbush.Start()
    DSilHand_M50WolfAmbush.SetStage(5)
EndEvent


