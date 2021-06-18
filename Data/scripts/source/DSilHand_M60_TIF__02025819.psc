;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_M60_TIF__02025819 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Dragonborn Finish the talk with senaar after M60 (Retaliation quest)
Debug.Trace("(DSilHand_M60) -- Dragonborn finishes the talk with Senaar")

; Update Quest Objective/Stage
Debug.Trace("(DSilHand_M60) -- Objective Completed 30")
GetOwningQuest().SetObjectiveCompleted(30);
Debug.Trace("(DSilHand_M60) -- ObjectiveDisplayed 40")
GetOwningQuest().SetObjectiveDisplayed(40)
Debug.Trace("(DSilHand_M60) -- Stage 40")
GetOwningQuest().SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
