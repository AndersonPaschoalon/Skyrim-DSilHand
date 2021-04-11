Scriptname DSilHand_TestM40 extends ObjectReference  

Quest Property DSilHand_M40CompConspiracy  Auto  


Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("DSilHand_TestM40");
    DSilHand_Fjol.Enable()
    DSilHand_M40CompConspiracy.Start()
    DSilHand_M40CompConspiracy.SetStage(10)
    DSilHand_M40CompConspiracy.SetObjectiveDisplayed(10)
EndEvent



Actor Property DSilHand_Fjol  Auto  
