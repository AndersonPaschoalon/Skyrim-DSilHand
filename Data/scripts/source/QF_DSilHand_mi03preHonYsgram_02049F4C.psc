;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_DSilHand_mi03preHonYsgram_02049F4C Extends Quest Hidden

;BEGIN ALIAS PROPERTY fjol
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_fjol Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; This stage is used as condition to enable the diaob between Fjol and dragonborn, to start up M90
Debug.Trace("(DSilHand_iM90:20) -- Enable Fjol-Dragonborn dialog to start M90")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Startup stage
Debug.Trace("(DSilHand_mi03:0) -- START QUEST")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Debug.Trace("(DSilHand_iM90:30) -- Starts quest DSilHand_M90HonYsgramor")
DSilHand_M90HonYsgramor.Start()
DSilHand_M90HonYsgramor.SetStage(10)
DSilHand_M90HonYsgramor.SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; Enables quest objective to be displayed on Misc quests
Debug.Trace("(DSilHand_iM90:10) -- Enable quest objective")
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DSilHand_M90HonYsgramor  Auto  
{Quest M90 (Honnor of Ysgramor) object, to be started after the initial dialog.}
