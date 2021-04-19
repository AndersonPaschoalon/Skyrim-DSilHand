;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_M40_TIF__0202EF5A Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Dragonborn finish the talk with Fjol
; Now Dragonborn giver the fragment to Fjol, and go talk with Krev
GetOwningQuest().SetObjectiveCompleted(50)
GetOwningQuest().SetObjectiveDisplayed(60)
GetOwningQuest().SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
