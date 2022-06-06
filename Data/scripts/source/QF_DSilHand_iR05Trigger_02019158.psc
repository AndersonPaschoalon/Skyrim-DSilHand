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

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
string THIS_FILE = "(DSilHand_iR05Trigger) "

Debug.Trace(THIS_FILE +  "# Stage 10")
Debug.Trace(THIS_FILE +  "# DSilHand_R05FjolsResearch.Start()")

bool start = DSilHand_R05FjolsResearch.Start()
Debug.Trace(THIS_FILE +  " start:" + start )

Debug.Trace(THIS_FILE +  " DSilHand_R05FjolsResearch.SetStage(0)" )
bool set0 = DSilHand_R05FjolsResearch.SetStage(0)
Debug.Trace(THIS_FILE +  " set0:" + set0 )

Utility.Wait(2)
Debug.Trace(THIS_FILE +  " DSilHand_R05FjolsResearch.SetStage(5)" )
bool set5 = DSilHand_R05FjolsResearch.SetStage(5)
Debug.Trace(THIS_FILE +  " set5:" + set5 )


SetStage(20)
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

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DSilHand_R05FjolsResearch  Auto  
