Scriptname DSilHand_TestM30 extends ObjectReference  

Quest Property DSilHand_M30ScholarFragment  Auto  


Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("DSilHand_TestM30");
    DSilHand_M30ScholarFragment.Start()
    DSilHand_M30ScholarFragment.SetStage(10)
    DSilHand_M30ScholarFragment.SetObjectiveDisplayed(10)
EndEvent
