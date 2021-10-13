Scriptname DSilHand_TestM20 extends ObjectReference  
{DSilHand_TestM20}

Quest Property DSilHand_M20AngavundesTreasure  Auto  
{DSilHand_M20AngavundesTreasure}

Actor Property DSilHand_KrevTheSkinner  Auto  

Faction Property SilverHandFaction  Auto  

Faction Property CompanionsFaction  Auto  

Faction Property PlayerFaction  Auto  

Quest Property DSilHand_A01Troubleshoot  Auto  

Event OnActivate(ObjectReference akActionRef)
    DSilHand_A01Troubleshoot.SetStage(20)
EndEvent






