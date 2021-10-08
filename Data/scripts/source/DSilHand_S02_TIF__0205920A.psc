;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_S02_TIF__0205920A Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Dragonborn finds the first totem. Fjol talks to you, and tells the location
; of the second.

string THIS_FILE = "(DSilHand_S02_TIF) "
; -1 - do not complete objective
; 20 - next objective
; 20 - next stage
DSilHand_Utils.advanceQuest(GetOwningQuest(), -1, 20, 20, THIS_FILE)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
