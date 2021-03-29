Scriptname DSilHand_TestM70 extends ObjectReference  

Quest Property DSilHand_M70UncPast  Auto  
Quest Property DSilHand_M60Retaliation  Auto  

Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("Finalizing DSilHand_M60Retaliation...");
    DSilHand_M60Retaliation.Start()
    DSilHand_M60Retaliation.SetObjectiveDisplayed(60)    
    DSilHand_M60Retaliation.SetStage(70)
    Debug.MessageBox("Starting DSilHand_M70UncPast...");
    DSilHand_M70UncPast.Start()
    DSilHand_M70UncPast.SetStage(10)
    DSilHand_M70UncPast.SetObjectiveDisplayed(10)
EndEvent




