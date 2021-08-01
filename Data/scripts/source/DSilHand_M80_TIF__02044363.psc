;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_M80_TIF__02044363 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Dragonborn deliver the last Wuulthread fragment (Frag05) to Fjol
Debug.Trace("DSilHand_M80_TIF -- Set Objective Completed/Displayed 90/100")
Debug.Trace("DSilHand_M80_TIF -- Set Stage 100")
GetOwningQuest().SetObjectiveCompleted(90)
GetOwningQuest().SetStage(100)
GetOwningQuest().SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
