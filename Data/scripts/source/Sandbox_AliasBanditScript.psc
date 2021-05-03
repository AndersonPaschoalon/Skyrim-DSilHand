Scriptname Sandbox_AliasBanditScript extends ReferenceAlias  

Event OnDeath(Actor killer)
	GetOwningQuest().SetStage(30)
EndEvent