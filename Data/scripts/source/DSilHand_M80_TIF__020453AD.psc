;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_M80_TIF__020453AD Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Fjol called all man to Skyforge
Debug.Trace("DSilHand_M80_TIF -- Fjol called the man to Skyforge")

; advances to stage 100
int STAGE_GOSKYFORGE = 100
Debug.Trace("DSilHand_M80_TIF -- Advaces to Stage/Objective " + STAGE_GOSKYFORGE)
GetOwningQuest().SetObjectiveDisplayed(STAGE_GOSKYFORGE)
GetOwningQuest().SetStage(STAGE_GOSKYFORGE)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
