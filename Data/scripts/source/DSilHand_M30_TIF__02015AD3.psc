;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_M30_TIF__02015AD3 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; The Dragonborn accept Fjol's task to go to winterhold
; and talk to the informant: Nelacar
Debug.Trace("-- M30 ObjectiveCompleted:10")
Debug.Trace("-- M30 Stage/Objective:20/20")
GetOwningQuest().SetObjectiveCompleted(10);
GetOwningQuest().SetObjectiveDisplayed(20)
GetOwningQuest().SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
