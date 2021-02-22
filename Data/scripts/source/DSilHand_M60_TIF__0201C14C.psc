;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_M60_TIF__0201C14C Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Dragonborn finishd to talk with Gallows Guard about the Compations retaliation
; Now he must go inside defeat the companions
Debug.Trace("(DSilHand_M60)  -- M60 ObjectiveCompleted:10")
Debug.Trace("(DSilHand_M60)  -- Dragonborn finishd to talk with Gallows Guard about the Compations retaliation")
GetOwningQuest().SetObjectiveCompleted(10);
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
