;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname DSilHand_M60_SF_SceneFjolDis Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Fjol M60 end scene completed
string THIS_FILE = "(DSilHand_M60_SF) "
Debug.Trace(THIS_FILE + "-- Scene DSilHand_M60_SceneFjolDiscourse  is over")
; 50 - complete objective
; 60 - do not set objective
; 60 - go to next stage
DSilHand_Utils.advanceQuest(GetOwningQuest(), 50, 60, 60, THIS_FILE)

; DELETE
;Debug.Trace("(DSilHand_M60) -- Set Objective Completed 50")
;Debug.Trace("(DSilHand_M60) -- Set Stage/Objective 60")
;GetOwningQuest().SetObjectiveCompleted(50)
;GetOwningQuest().SetStage(60)
;GetOwningQuest().SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ReferenceAlias akAlias)
;BEGIN CODE
Debug.Trace("DSilHand_M60_SF -- Waiting 1 seconds")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; The Fjol discource scene will finishe when the finishes his speach.
; The scene will end when the scene dialog 16 is complete
Debug.Trace("(DSilHand_M60) -- Fjol Discource End Condition Matched!")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
