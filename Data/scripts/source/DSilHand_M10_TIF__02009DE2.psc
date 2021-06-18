;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DSilHand_M10_TIF__02009DE2 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Debug
Debug.Trace("(DSilHand_M10) TopicInfo DSilHand_M10Ds_Topic01 <Can I join the Silver Hand?> ")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Dragonborn ask the Driftshade Guard to join
; The guard tell him to go to Gallows Rock

Debug.Trace("(DSilHand_M10) TopicInfo DSilHand_M10Ds_Topic01 End")
GetOwningQuest().SetStage(20)
GetOwningQuest().SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
