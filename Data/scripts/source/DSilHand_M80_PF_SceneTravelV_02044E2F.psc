;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_M80_PF_SceneTravelV_02044E2F Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
; here, vignar completed his action of arriving at the right position.
Debug.Trace("PF_DSilHand_M80 -- Vignar Scene completed")

; wait 1 second
int waitSeconds = 1
Debug.Trace("PF_DSilHand_M80 -- wait:<" + waitSeconds + "> seconds")
Utility.Wait(waitSeconds)

; advances to stage 62
int NEXT_STAGE = 62
Debug.Trace("DSilHand_M80_PF -- Advaces to Stage " + NEXT_STAGE)
GetOwningQuest().SetStage(NEXT_STAGE)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
