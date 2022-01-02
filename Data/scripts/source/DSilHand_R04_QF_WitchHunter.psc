;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname DSilHand_R04_QF_WitchHunter Extends Quest Hidden

;BEGIN ALIAS PROPERTY Witch
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Witch Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WitchLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_WitchLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ContractGiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ContractGiver Auto
;END ALIAS PROPERTY

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

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; Complete quest
Debug.Trace(THIS_FILE + " #Stage 30")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; Go execute the contract

; Quest setup
Debug.Trace(THIS_FILE + " #Stage 10")
SetActive(true)
Start()
SetObjectiveDisplayed(10)

; ensure target is alive and location is revealed
Debug.Trace(THIS_FILE + "  * Alias_Witch:<" + Alias_Witch + ">")
Debug.Trace(THIS_FILE + "  * Alias_LocationMarker:<" + Alias_LocationMarker + ">")
Debug.Trace(THIS_FILE + "  * Alias_WitchLocation:<" + Alias_WitchLocation + ">")
;Alias_Witch.GetReference().Enable()
Alias_Witch.GetActorReference().Resurrect()
Alias_LocationMarker.GetReference().AddToMap()

; add/equip some itens for imersion
Alias_Witch.GetActorReference().AddItem(DSilHand_GlenmorilWitchStaff, 1, true)
Alias_Witch.GetActorReference().EquipItem(DSilHand_GlenmorilWitchStaff, true)
Alias_Witch.GetActorReference().AddItem(HagravenClaw, 1, true)
Alias_Witch.GetActorReference().AddItem(HagravenFeathers, 1, true)
Alias_Witch.GetActorReference().AddItem(SabrecatEyeball, 1, true)
Alias_Witch.GetActorReference().AddItem(DaedraHeart, 1, true)
Alias_Witch.GetActorReference().AddItem(HumanHeart, 1, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; Talk to quest giver
Debug.Trace(THIS_FILE + " #Stage 20")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

String Property THIS_FILE  Auto  
{this file name, to be used on logs.}

WEAPON Property DSilHand_GlenmorilWitchStaff  Auto  

Ingredient Property HagravenClaw  Auto  

Ingredient Property HagravenFeathers  Auto  

Ingredient Property SabrecatEyeball  Auto  

Ingredient Property DaedraHeart  Auto  

Ingredient Property HumanHeart  Auto  
