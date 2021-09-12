Scriptname DSilHand_TestS01 extends ObjectReference  

Quest Property DSilHand_A01Troubleshoot  Auto  

Quest Property DSilHand_iS01Trigger  Auto  



Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("DSilHand_TestS01")
    ;DSilHand_iS01Trigger.SetStage(10)
    ;DSilHand_iS01Trigger.SetObjectiveDisplayed(10)
    DSilHand_A01Troubleshoot.SetStage(101)
EndEvent



