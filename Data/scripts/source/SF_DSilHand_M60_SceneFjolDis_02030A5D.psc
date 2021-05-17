;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_DSilHand_M60_SceneFjolDis_02030A5D Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Debug.Trace("(DSilHand_M60) -- Scene DSilHand_M60_SceneFjolDiscourse  is over")
Debug.Trace("(DSilHand_M60) -- Set Objective Completed 50")
Debug.Trace("(DSilHand_M60) -- Set Stage/Objective 60")
GetOwningQuest().SetObjectiveCompleted(50)
GetOwningQuest().SetStage(60)
GetOwningQuest().SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
