;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
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

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; The Fjol discource scene will finishe when the finishes his speach.
; When he finishes his dialog, the stage will be set to 55, and the Scene will end.
Debug.Trace("(DSilHand_M60) -- Fjol Discource End Condition Matched!")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ReferenceAlias akAlias)
;BEGIN CODE
Debug.Trace("DSilHand_M60 -- Advances to Stage 51")
Debug.Trace("DSilHand_M60 -- Waiting 1 seconds")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
