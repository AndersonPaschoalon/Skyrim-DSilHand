;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0204845A Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; advances to stage 70
int LAST_STAGE = 70
Debug.Trace("DSilHand_M80_PF -- Advaces to LAST" + LAST_STAGE)
GetOwningQuest().SetStage(LAST_STAGE)

; wait 1 second
int waitSeconds = 1
Debug.Trace("PF_DSilHand_M80 -- wait:<" + waitSeconds + "> seconds")
Utility.Wait(waitSeconds)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
