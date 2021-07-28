;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_M80_TIF__02042850 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Dragonborn has just met Fjol on the secret passage below the Underforge
; Advances to Stage 30, so the Attack Scene will start
Debug.Trace("DSilHand_M80 -- M80 Objective Completed:20");
GetOwningQuest().SetObjectiveCompleted(20)
Debug.Trace("DSilHand_M80 -- M80 Stage/Objective:30");
GetOwningQuest().SetObjectiveDisplayed(30)
GetOwningQuest().SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
