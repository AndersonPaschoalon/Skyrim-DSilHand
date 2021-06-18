;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_M60_TIF__0202582E Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Finished the talk with Fjol in particular
; Now Fjol will promote you, and give to you some gigts
Debug.Trace("(DSilHand_M60) -- Set Stage/Objective to 60")
GetOwningQuest().SetObjectiveCompleted(60)
GetOwningQuest().SetStage(70);
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
