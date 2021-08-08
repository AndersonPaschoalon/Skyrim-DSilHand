;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_M80_TIF__02044363 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Dragonborn deliver the last Wuulthread fragment (Frag05) to Fjol
; The objective must be compled, and the stage must advance to 91
; the scene first stage, where Fjol will call the silver hands to the Skyforge

Debug.Trace("(DSilHand_M80_TIF) -- Set Objective Completed 90")
GetOwningQuest().SetObjectiveCompleted(90)

; Start Fjol Call Scene
Debug.Trace("(DSilHand_M80_TIF) -- Set Stage 91")
GetOwningQuest().SetStage(91)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
