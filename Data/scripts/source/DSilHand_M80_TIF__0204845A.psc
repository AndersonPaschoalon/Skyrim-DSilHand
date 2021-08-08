;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_M80_TIF__0204845A Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Complete Scene
int STAGE_SCENE_START = 60
int STAGE_SCENE_END = 70
Debug.Trace("(DSilHand_M80_PF) -- Complete Armistice Scene")
Debug.Trace("(DSilHand_M80_PF) -- Complete Objective: " + STAGE_SCENE_START)
GetOwningQuest().SetObjectiveCompleted(STAGE_SCENE_START)
Debug.Trace("(DSilHand_M80_PF) -- Set Stage: " + STAGE_SCENE_END)
GetOwningQuest().SetStage(STAGE_SCENE_END)

; wait 1 second, to make the scene cooler
int waitSeconds = 1
Debug.Trace("PF_DSilHand_M80 -- wait:<" + waitSeconds + "> seconds")
Utility.Wait(waitSeconds)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
