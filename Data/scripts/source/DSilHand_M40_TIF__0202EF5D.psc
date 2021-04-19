;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_M40_TIF__0202EF5D Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Dragonborn go speak with Krev after finding the fragment on Dustmans Cairn
Debug.Trace("(DSilHand_m40) -- Dragonborn go speak with Krev after finding the fragment on Dustmans Cairn")
Debug.Trace("(DSilHand_M40) -- M40 ObjectiveCompleted:60")
Debug.Trace("(DSilHand_M40) -- M40 Stage 70: Quest completed!")
GetOwningQuest().SetObjectiveCompleted(60);
GetOwningQuest().SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
