Scriptname Sandbox_Chair1Script extends ReferenceAlias  


Event OnActivate(ObjectReference akActivator)
    if((akActivator == Game.GetPlayer()) && (GetOwningQuest().GetStage() == 0) )
        Debug.MessageBox("Scene Quest 02 -> Stage 10")
        GetOwningQuest().SetStage(10)
    endif
EndEvent
