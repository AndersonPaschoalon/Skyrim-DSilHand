;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_M60_TIF__02025829 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Finished the speach to the Silver Hands
; Now Fjol must talk with you in particular
Debug.Trace("(DSilHand M60) -- Set Stage/Objective to 60")
GetOwningQuest().SetObjectiveDisplayed(60)
GetOwningQuest().SetStage(60);
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
