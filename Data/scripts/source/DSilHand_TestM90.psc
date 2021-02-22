Scriptname DSilHand_TestM90 extends ObjectReference  

Quest Property DSilHand_M90HonYsgramor  Auto  


Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("DSilHand_TestM90");
    DSilHand_M90HonYsgramor.Start()
    DSilHand_M90HonYsgramor.SetStage(10)
    DSilHand_M90HonYsgramor.SetObjectiveDisplayed(10)
EndEvent


