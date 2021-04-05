Scriptname DSilHand_TestM20 extends ObjectReference  
{DSilHand_TestM20}

Quest Property DSilHand_M20AngavundesTreasure  Auto  
{DSilHand_M20AngavundesTreasure}

Actor Property DSilHand_KrevTheSkinner  Auto  

Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("DSilHand_TestM20");
    DSilHand_KrevTheSkinner.Enable()
    DSilHand_M20AngavundesTreasure.Start()
    DSilHand_M20AngavundesTreasure.SetStage(10)
    DSilHand_M20AngavundesTreasure.SetObjectiveDisplayed(10)
EndEvent


