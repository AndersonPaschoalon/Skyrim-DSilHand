;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_M40_TIF__0202AE99 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Fjol receives Draborn on the entrance of the Tomb
Debug.Trace("(DSilHand M40) -- Objective Completed 10")
GetOwningQuest().SetObjectiveCompleted(10);
Debug.Trace("(DSilHand M40) -- ObjectiveDisplayed 20")
GetOwningQuest().SetObjectiveDisplayed(20)
Debug.Trace("(DSilHand M40) -- Stage 20")
GetOwningQuest().SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
