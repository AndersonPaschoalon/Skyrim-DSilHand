;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_DSilHand_iR05Trigger_02019158 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Debug.Trace("(DSilHand_iR05Trigger) # Stage 20")
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Debug.Trace("(DSilHand_iR05Trigger) # Stage 0")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Debug.Trace("(DSilHand_iR05Trigger) # Stage 10")
DSilHand_R05FjolsResearch.Start()
DSilHand_R05FjolsResearch.SetStage(0)
Utility.Wait(2)
DSilHand_R05FjolsResearch.SetStage(5)
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DSilHand_R05FjolsResearch  Auto  
