Scriptname DSilHand_TestM40 extends ObjectReference  

Quest Property DSilHand_M40CompConspiracy  Auto  

Actor Property DSilHand_Fjol  Auto  

Faction Property SilverHandFaction  Auto  

Faction Property CompanionsFaction  Auto  

Faction Property PlayerFaction  Auto  

Quest Property DSilHand_A01Troubleshoot  Auto  

Event OnActivate(ObjectReference akActionRef)
    DSilHand_A01Troubleshoot.SetStage(40)    
;    Debug.MessageBox("You Have Joined the Silver Hands!")
;    Game.GetPlayer().AddToFaction(SilverHandFaction)
;    CompanionsFaction.SetEnemy(SilverHandFaction)
;    CompanionsFaction.SetEnemy(PlayerFaction)    
;    Debug.MessageBox("DSilHand_TestM40");
;    DSilHand_Fjol.Enable()
;    DSilHand_M40CompConspiracy.Start()
;    DSilHand_M40CompConspiracy.SetStage(10)
;    DSilHand_M40CompConspiracy.SetObjectiveDisplayed(10)
EndEvent








