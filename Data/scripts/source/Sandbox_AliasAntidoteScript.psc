Scriptname Sandbox_AliasAntidoteScript extends ReferenceAlias  

Event OnEquipped(Actor akActor)
	if(AkActor == Game.GetPlayer())
		GetOwningQuest().SetStage(50)
	endif
EndEvent

