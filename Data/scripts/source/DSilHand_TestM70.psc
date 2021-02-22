Scriptname DSilHand_TestM70 extends ObjectReference  

Quest Property DSilHand_M70UncPast  Auto  


Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("DSilHand_TestM70");
    DSilHand_M70UncPast.Start()
    DSilHand_M70UncPast.SetStage(10)
    DSilHand_M70UncPast.SetObjectiveDisplayed(10)
EndEvent


