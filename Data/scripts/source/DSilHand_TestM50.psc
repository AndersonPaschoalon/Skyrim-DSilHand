Scriptname DSilHand_TestM50 extends ObjectReference  

Quest Property DSilHand_M50WolfAmbush  Auto  

Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("DSilHand_TestM50");
    DSilHand_KrevTheSkenner.Enable()
    DSilHand_M50WolfAmbush.Start()
    DSilHand_M50WolfAmbush.SetStage(5)
    ;DSilHand_M50WolfAmbush.SetObjectiveDisplayed(10)
EndEvent


Actor Property DSilHand_KrevTheSkenner  Auto  
