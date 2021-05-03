Scriptname Sandbox_TriggerScript extends ReferenceAlias  

ReferenceAlias Property theon  Auto  


Event OnTriggerEnter(ObjectReference akActionRef)
    if( (akActionRef == theon.GetReference()) && (GetOwningQuest().GetStage() == 10))
            GetOwningQuest().SetStage(20)
    endif

EndEvent


