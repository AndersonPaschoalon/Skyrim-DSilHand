;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_M80_TIF__0204435E Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Dragonborn accepts to help Fjol search for the last Axe fragment 
Debug.Trace("DSilHand_M80_TIF -- Set Objective Completed/Displayed 70/80")
Debug.Trace("DSilHand_M80_TIF -- Set Stage 80")
GetOwningQuest().SetObjectiveCompleted(70)
GetOwningQuest().SetStage(80)
GetOwningQuest().SetObjectiveDisplayed(80)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
