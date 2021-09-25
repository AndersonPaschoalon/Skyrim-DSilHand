;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DSilHand_M90_PF_ActivateStatueTake Extends Package Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(Actor akActor)
;BEGIN CODE
Debug.Trace("(DSilHand_M90_PF) -- Finishing DSilHand_M90_ActivateStatue...")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
Debug.Trace("(DSilHand_M90_PF) -- Starting DSilHand_M90_ActivateStatue => Take axe back!")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property IdleTake  Auto
{Runs the animation IdleTake}

