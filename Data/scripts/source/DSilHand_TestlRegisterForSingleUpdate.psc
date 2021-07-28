Scriptname DSilHand_TestlRegisterForSingleUpdate extends ObjectReference  

Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("*EXEC REGISTER FOR ONE UPDATE*")
    RegisterForSingleUpdateGameTime(1.2)
EndEvent



Event OnUpdateGameTime()
    Debug.MessageBox("*REGISTER FOR SINGLE UPDATE DONE*")
EndEvent

