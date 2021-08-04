;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_M80_TIF__020453AD Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Fjol called all man to Skyforge
Debug.Trace("DSilHand_M80_TIF -- Fjol called the man to Skyforge")

; advances to stage 61
Debug.Trace("DSilHand_M80_TIF -- Advaces to Stage/Objective 110")
; GetOwningQuest().SetObjectiveCompleted(100)
GetOwningQuest().SetStage(110)
GetOwningQuest().SetObjectiveDisplayed(110)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
