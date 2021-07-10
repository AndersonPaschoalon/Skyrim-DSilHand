Scriptname DSilHand_TestS01 extends ObjectReference  

Quest Property DSilHand_mi20preDwammerTempering  Auto  

Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("DSilHand_TestS01")
    DSilHand_mi20preDwammerTempering.SetStage(10)
    DSilHand_mi20preDwammerTempering.SetObjectiveDisplayed(10)
EndEvent


