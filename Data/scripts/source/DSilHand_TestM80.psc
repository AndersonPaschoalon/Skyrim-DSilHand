Scriptname DSilHand_TestM80 extends ObjectReference  

Quest Property DSilHand_M80AssaultJor  Auto  

Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("DSilHand_TestM80");
    DSilHand_M80AssaultJor.Start()
    DSilHand_M80AssaultJor.SetStage(10)
    DSilHand_M80AssaultJor.SetObjectiveDisplayed(10)
EndEvent


