;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_M60_TIF__02025826 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Finished the first talk with Fjol. 
; Now you must listen to him speach
Debug.Trace("(DSilHand M60) -- Set Objective 40 Complete")
Debug.Trace("(DSilHand M60) -- Set Stage to 50")
GetOwningQuest().SetObjectiveCompleted(40);
GetOwningQuest().SetStage(50);
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
