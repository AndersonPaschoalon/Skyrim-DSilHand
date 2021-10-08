;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_S02_TIF__02059216 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Fjol talks to you after you have found all the Totems
; Fjol talks to you to burn all the totems on the ethernal flame

string THIS_FILE = "(DSilHand_S02_TIF) "

; -1 - do not complete objective
; 40 - next objective
; 40 - next stage
DSilHand_Utils.advanceQuest(GetOwningQuest(), -1, 40, 40, THIS_FILE)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
