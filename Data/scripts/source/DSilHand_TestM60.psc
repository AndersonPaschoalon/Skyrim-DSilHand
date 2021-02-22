Scriptname DSilHand_TestM60 extends ObjectReference  

Quest Property DSilHand_M60Retaliation  Auto  

Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("DSilHand_TestM60");
    DSilHand_M60Retaliation.Start()
    DSilHand_M60Retaliation.SetStage(10)
    DSilHand_M60Retaliation.SetObjectiveDisplayed(10)
EndEvent


