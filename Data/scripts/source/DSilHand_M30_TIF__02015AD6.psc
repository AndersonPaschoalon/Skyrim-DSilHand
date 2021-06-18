;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_M30_TIF__02015AD6 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Dragonborn receive a letter fom Nelacar
Debug.Trace("(DSilHand_M30) -- M30 ObjectiveCompleted:20")
Debug.Trace("(DSilHand_M30) -- M30 Stage/Objective:30/30")
GetOwningQuest().SetObjectiveCompleted(20);
GetOwningQuest().SetObjectiveDisplayed(30)
GetOwningQuest().SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
