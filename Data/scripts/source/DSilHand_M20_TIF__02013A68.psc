;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_M20_TIF__02013A68 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Debug.Trace("(DSilHand_M20_TIF) -- Set DSilHand_M20 Obj:20 Completed, Stage/Obj -> 30")
GetOwningQuest().SetObjectiveCompleted(20);
GetOwningQuest().SetObjectiveDisplayed(30)
GetOwningQuest().SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
