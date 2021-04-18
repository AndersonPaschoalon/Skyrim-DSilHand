Scriptname Test_M40Silver02T extends ObjectReference  


Event OnActivate(ObjectReference akActionRef)
  Debug.Trace("Activated by " + akActionRef)
    sil02.EnableAI(true)
EndEvent


Actor Property sil02  Auto  
