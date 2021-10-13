Scriptname DSilHand_TestM50 extends ObjectReference  

Quest Property DSilHand_M50WolfAmbush  Auto  

Actor Property DSilHand_KrevTheSkenner  Auto  

Faction Property SilverHandFaction  Auto  

Faction Property CompanionsFaction  Auto  

Faction Property PlayerFaction  Auto  

Quest Property DSilHand_A01Troubleshoot  Auto  

Event OnActivate(ObjectReference akActionRef)
    DSilHand_A01Troubleshoot.SetStage(50)
EndEvent




