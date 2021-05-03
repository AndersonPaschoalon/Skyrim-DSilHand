;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_Sandbox_SceneTutorial_Sce_0200E8F8 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Game.DisablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
getowningquest().setstage(20)
Game.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
