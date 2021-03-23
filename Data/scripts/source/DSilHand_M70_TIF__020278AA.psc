;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_M70_TIF__020278AA Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Finishes the current quest
Debug.Trace("(QF_DSilHand M70) -- remove the Fragment 02")
Game.GetPlayer().RemoveItem(Frag02.GetReference())

; Finish the quest and complete objective
Debug.Trace("(QF_DSilHand M70) -- Set Objective complete 20")
GetOwningQuest().SetObjectiveCompleted(20)
Debug.Trace("(QF_DSilHand M70) -- Finish quest - set to 30")
GetOwningQuest().SetStage(30);
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Frag02  Auto  
