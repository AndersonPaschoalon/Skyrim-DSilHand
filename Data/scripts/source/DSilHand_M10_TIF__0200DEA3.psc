;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_M10_TIF__0200DEA3 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Dragonborn brings the Troll Skull to Krev

; Complete Quest Objective
Debug.Trace("-- Objective Completed 40")
GetOwningQuest().SetObjectiveCompleted(40);
Debug.Trace("-- ObjectiveDisplayed 50")
GetOwningQuest().SetObjectiveDisplayed(50)
Debug.Trace("-- Stage 50")
GetOwningQuest().SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
