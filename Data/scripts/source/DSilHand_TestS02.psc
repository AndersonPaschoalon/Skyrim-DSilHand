Scriptname DSilHand_TestS02 extends ObjectReference  

Quest Property DSilHand_A01Troubleshoot  Auto  


Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("DSilHand_TestS02")
    DSilHand_A01Troubleshoot.SetStage(102)
EndEvent


