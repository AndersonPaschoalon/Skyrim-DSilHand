;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_M10_TIF__02009DF0 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Dragonborn  Ask what he have to to to Join the Silver Hand
; Gallows's guard request to kill a Troll on Cold Rock Pass

; This conversation should start-up the next quest stage.

; Enable the Frost Troll on Cold Rock Pass
Debug.Trace("** DSilHand_EncGiantTrollFrost.Enable()")
DSilHand_EncGiantTrollFrost.Enable()

; Complete Objective 10
Debug.Trace("** GetOwningQuest().SetObjectiveCompleted(10)")
GetOwningQuest().SetObjectiveCompleted(10)

; Display Objective 30
Debug.Trace("** GetOwningQuest().SetObjectiveDisplayed(30)")
GetOwningQuest().SetObjectiveDisplayed(30)

; Set Stage as 30
Debug.Trace("** GetOwningQuest().SetStage(30)");
GetOwningQuest().SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Actor Property DSilHand_EncGiantTrollFrost  Auto  
