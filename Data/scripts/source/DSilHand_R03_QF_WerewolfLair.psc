;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname DSilHand_R03_QF_WerewolfLair Extends Quest Hidden

;BEGIN ALIAS PROPERTY ContractGiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ContractGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ReachHold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ReachHold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BountyLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_BountyLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BanditBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BanditBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SelectedHold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_SelectedHold Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; Go execute the contract
Debug.Trace(THIS_FILE + " #Stage 10")

Debug.Trace(THIS_FILE + "  * Alias_SelectedHold:<" + Alias_SelectedHold + ">")
Debug.Trace(THIS_FILE + "  * Alias_BountyLocation:<" + Alias_BountyLocation + ">")
Debug.Trace(THIS_FILE + "  * Alias_MapMarker:<" + Alias_MapMarker + ">")
Debug.Trace(THIS_FILE + "  * Alias_BanditBoss:<" + Alias_BanditBoss + ">")
Debug.Trace(THIS_FILE + "  * Alias_ContractGiver:<" + Alias_ContractGiver + ">")

Alias_BanditBoss.GetReference().Enable()
Alias_BanditBoss.GetActorReference().Resurrect()
Alias_MapMarker.GetReference().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; Complete quest
Debug.Trace(THIS_FILE + " #Stage 30")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Debug.Trace(THIS_FILE + " #Stage 0")
SetObjectiveDisplayed(10, false)
SetObjectiveDisplayed(20, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; Talk to quest giver
Debug.Trace(THIS_FILE + " #Stage 20")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

String Property THIS_FILE  Auto  
{This file name to be used on logs.}
