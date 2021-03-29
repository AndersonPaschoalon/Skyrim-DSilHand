;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_M70_TIF__020278A1 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Fjol sends Dragonborn to search for the last Ax fragment 
Debug.Trace("(DSilHand M70) -- Set Stage/Objective to 10")
GetOwningQuest().SetObjectiveDisplayed(10)
GetOwningQuest().SetStage(10);
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
