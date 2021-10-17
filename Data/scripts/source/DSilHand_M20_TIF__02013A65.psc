;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_M20_TIF__02013A65 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
string THIS_FILE = "(DSilHand_M20_TIF) "
; Show quest on menu
Debug.Trace(THIS_FILE + " -- START QUEST M20")
GetOwningQuest().Start()
; -1 - complete objective (do nothing)
; 20 - Set quest objective to 20
; 20 - Set quest stage to 20
DSilHand_Utils.advanceQuest(GetOwningQuest(), -1, 20, 20, THIS_FILE)


; -- old impl
; Debug.Trace("(DSilHand_M20_TIF) -- Set DSilHand_M20 Obj:10 Completed, Stage/Obj -> 20")
; GetOwningQuest().Start()
; GetOwningQuest().SetObjectiveCompleted(10);
; GetOwningQuest().SetObjectiveDisplayed(20)
; GetOwningQuest().SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
