;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname DSilHand_iS01_QF_Trigger Extends Quest Hidden

;BEGIN ALIAS PROPERTY Kurdak
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Kurdak Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Debug.Trace(THIS_FILE + "#STAGE 20")
Debug.Trace(THIS_FILE + "-- advances DSilHand_S01DwammerTempering to stage 10")
DSilHand_S01DwammerTempering.Start()
DSilHand_S01DwammerTempering.SetStage(10)
DSilHand_S01DwammerTempering.SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Debug.Trace(THIS_FILE + "#STAGE 10")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Debug.Trace(THIS_FILE + "#STAGE 00")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DSilHand_S01DwammerTempering  Auto  
{Quest object to DSilHand_S01DwammerTempering.}

String Property THIS_FILE  Auto  
{File name to be used in the logs.}
