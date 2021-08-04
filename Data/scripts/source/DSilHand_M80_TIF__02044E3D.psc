;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_M80_TIF__02044E3D Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; here, vignar completed his action of arriving at the right position.
Debug.Trace("DSilHand_M80_TIF -- Vignar Calls Athis")

; advances to stage 62
Debug.Trace("DSilHand_M80_TIF -- Advaces to Stage 62")
GetOwningQuest().SetStage(62)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
