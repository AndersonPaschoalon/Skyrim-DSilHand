;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_mi03_TIF__02049F51 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; You taked with Fjol after Wuulthrad reassemble
; You talk about Kodlak journal, and he decided to go to 
; Glenmoril Coven to hunt down the witches.
Debug.Trace("(DSilHand_mi03_TIF) -- Complete Objective 10, Set Stage 30");
; complete last objective
GetOwningQuest().SetObjectiveCompleted(10)
; shut down the quest
GetOwningQuest().SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
