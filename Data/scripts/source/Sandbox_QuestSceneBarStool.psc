Scriptname Sandbox_QuestSceneBarStool extends ReferenceAlias  

ReferenceAlias Property playerStool  Auto  

ReferenceAlias Property otherStool  Auto  


Event OnActivate(ObjectReference akActivator)
    if((akActivator == Game.GetPlayer()) && (GetOwningQuest().GetStage() == 0) )
        if(self.GetReference() == otherStool.GetReference())
            ObjectReference other = otherStool.GetReference()
            otherStool.ForceRefTo(playerStool.GetReference())
            playerStool.ForceRefTo(other)
        endif
        GetOwningQuest().SetStage(10)
    endif
EndEvent
