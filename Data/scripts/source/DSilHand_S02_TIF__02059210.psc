;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_S02_TIF__02059210 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Dragonborn finds the second totem.
; Fjol talks to you and tells the location of the third totem.

string THIS_FILE = "(DSilHand_S02_TIF) "
; -1 - do not complete objective
; 30 - next objective
; 30 - next stage
DSilHand_Utils.advanceQuest(GetOwningQuest(), -1, 30, 30, THIS_FILE)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
