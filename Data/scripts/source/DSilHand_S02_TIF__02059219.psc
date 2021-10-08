;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_S02_TIF__02059219 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Fjol does the final talking lines with you about what you have done
; Advance quest stage to complete.
string THIS_FILE = "(DSilHand_S02_TIF)"

; 50 - complete objective
; -1 - do not set objective
; 60 - go to next stage
DSilHand_Utils.advanceQuest(GetOwningQuest(), 50, -1, 60, THIS_FILE)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
