;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname DSilHand_R01_QF_WolfHunt Extends Quest Hidden

;BEGIN ALIAS PROPERTY LocationMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WerewolfLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_WerewolfLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Werewolf
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Werewolf Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ContractGiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ContractGiver Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; startup stage
Debug.Trace(THIS_FILE + " #Stage 0")
SetObjectiveDisplayed(10, false)
SetObjectiveDisplayed(20, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; Go execute the contract

; Quest setup
Debug.Trace(THIS_FILE + " #Stage 10")
SetActive(true)
Start()
SetObjectiveDisplayed(10)

; ensure target is alive and location is revealed
Debug.Trace(THIS_FILE + "  * Alias_Werewolf:<" + Alias_Werewolf + ">")
Debug.Trace(THIS_FILE + "  * Alias_LocationMarker:<" + Alias_LocationMarker + ">")
Debug.Trace(THIS_FILE + "  * Alias_WerewolfLocation:<" + Alias_WerewolfLocation + ">")
Alias_Werewolf.GetReference().Enable()
Alias_Werewolf.GetActorReference().Resurrect()
Alias_LocationMarker.GetReference().AddToMap()

; add werewolf pelt for immersion
Alias_Werewolf.GetActorReference().AddItem(WerewolfPelt, 2, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
; Talk to quest giver
Debug.Trace(THIS_FILE + " #Stage 20")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
; Complete quest
Debug.Trace(THIS_FILE + " #Stage 30")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

; String Property THIS_FILE = (DSilHand_R01_QF_WolfHunt.psc)  Auto  
; {This file name, to be used on logs.}

String Property THIS_FILE  Auto  
{This file name, to be used on logs}

MiscObject Property WerewolfPelt  Auto  
