;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_DSilHand_A03PlayerHouse_020530EA Extends Quest Hidden

;BEGIN ALIAS PROPERTY StatueTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StatueTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SENAAR
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SENAAR Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Debug.Trace(THIS_FILE + "#Stage 20: Gallows Rock's Player House quest finished.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Debug.Trace(THIS_FILE + "#Stage 0")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Debug.Trace(THIS_FILE + "#Stage 10: initializes Gallows Rock's PlayerHouse quest.")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


String Property THIS_FILE  Auto 
{String with this file name}

