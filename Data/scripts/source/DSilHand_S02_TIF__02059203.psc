;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_S02_TIF__02059203 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Dragonborn agrees to search for the totems of hircine
; Fjol tells the first location

string THIS_FILE = "(DSilHand_S02_TIF) "
; -1 - do not complete objective
; 10 - next objective
; 10 - next stage
DSilHand_Utils.advanceQuest(GetOwningQuest(), -1, 10, 10, THIS_FILE)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
