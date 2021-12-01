;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname DSilHand_R02_QF_BeastExtermination Extends Quest Hidden

;BEGIN ALIAS PROPERTY Beast
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Beast Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BeastLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_BeastLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ContractGiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ContractGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; Talk to quest giver
Debug.Trace(THIS_FILE + " #Stage 20")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; Go execute the contract
Debug.Trace(THIS_FILE + " #Stage 10")
Debug.MessageBox("Alias_ContractGiver:" + Alias_ContractGiver)

Debug.Trace(THIS_FILE + "  * Alias_Beast:<" + Alias_Beast + ">")
Debug.Trace(THIS_FILE + "  * Alias_LocationMarker:<" + Alias_LocationMarker + ">")
Debug.Trace(THIS_FILE + "  * Alias_BeastLocation:<" + Alias_BeastLocation + ">")
Alias_Beast.GetReference().Enable()
Alias_Beast.GetActorReference().Resurrect()
Alias_LocationMarker.GetReference().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; Complete quest
Debug.Trace(THIS_FILE + " #Stage 30")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; startup stage
Debug.Trace(THIS_FILE + " #Stage 0")
SetObjectiveDisplayed(10, false)
SetObjectiveDisplayed(20, false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

String Property THIS_FILE = "(DSilHand_R02_QF_BeastExtermination.psc) " Auto  
{String with the quest main script name.}
