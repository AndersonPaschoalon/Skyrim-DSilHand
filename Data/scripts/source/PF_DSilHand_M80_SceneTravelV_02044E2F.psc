;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname PF_DSilHand_M80_SceneTravelV_02044E2F Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
; here, vignar completed his action of arriving at the right position.
Debug.Trace("DSilHand_M80 -- Vignar Scene completed")

; wait 1 second
int waitSeconds = 1
Debug.Trace("DSilHand_M80 -- wait:<" + waitSeconds + "> seconds")
Utility.Wait(waitSeconds)

; advances to stage 61
Debug.Trace("DSilHand_M80 -- Advaces to Stage 61")
GetOwningQuest().SetStage(61)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
