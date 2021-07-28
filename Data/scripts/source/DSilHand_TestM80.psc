Scriptname DSilHand_TestM80 extends ObjectReference  

Quest Property DSilHand_M80AssaultJor  Auto  

Faction Property SilverHandFaction  Auto  

Faction Property CompanionsFaction  Auto  

Faction Property PlayerFaction  Auto  


Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("You Have Joined the Silver Hands!")
    Game.GetPlayer().AddToFaction(SilverHandFaction)
    CompanionsFaction.SetEnemy(SilverHandFaction)
    CompanionsFaction.SetEnemy(PlayerFaction)    
    Debug.MessageBox("DSilHand_TestM80");
    DSilHand_M10SilverHunt.Start()
    DSilHand_M10SilverHunt.SetStage(60)
    DSilHand_M10SilverHunt.SetObjectiveCompleted(60)
    DSilHand_M80AssaultJor.Start()
    DSilHand_M80AssaultJor.SetStage(10)
    DSilHand_M80AssaultJor.SetObjectiveDisplayed(10)
EndEvent




Quest Property DSilHand_M10SilverHunt  Auto  
