Scriptname DSilHand_TestR00 extends ObjectReference  

Quest Property DSilHand_A01Troubleshoot  Auto  

Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("DSilHand_TestR00")
    DSilHand_A01Troubleshoot.SetStage(200)
EndEvent


