;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname DSilHand_QF_iR05Trigger Extends Quest Hidden

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Debug.Trace(THIS_FILE + "# Stage 0")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Debug.Trace(THIS_FILE +  "# Stage 10")

; Debug.Trace(THIS_FILE +  "-- DSilHand_R05FjolsResearch.Start()")
; DSilHand_R05FjolsResearch.Start()

Utility.Wait(2)

Debug.Trace(THIS_FILE +  "-- DSilHand_R05FjolsResearch.SetStage(5)")
DSilHand_R05FjolsResearch.SetStage(5)

Debug.Trace(THIS_FILE +  "-- SetStage(20)")
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Debug.Trace(THIS_FILE + "# Stage 20")
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DSilHand_R05FjolsResearch  Auto  


String Property THIS_FILE  Auto  
{This file name.}
