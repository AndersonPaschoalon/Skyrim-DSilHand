;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_DSilHand_mi20preDwammerTe_0203F21C Extends Quest Hidden

;BEGIN ALIAS PROPERTY Kurdak
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Kurdak Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Debug.Trace("(DSilHand_mi20:10) -- misc quest m20 stage 10")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Debug.Trace("(DSilHand_mi20:20) -- misc quest m20 completed!")
Debug.Trace("(DSilHand_mi20:20) -- advances DSilHand_S01DwammerTempering to stage 10")
DSilHand_S01DwammerTempering.Start()
DSilHand_S01DwammerTempering.SetStage(10)
DSilHand_S01DwammerTempering.SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DSilHand_S01DwammerTempering  Auto  
{Quest object to DSilHand_S01DwammerTempering.}
