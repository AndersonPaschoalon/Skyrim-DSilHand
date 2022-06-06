;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname DSilHand_M50_QF_WolfAmbush Extends Quest Hidden

;BEGIN ALIAS PROPERTY GallowsTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GallowsTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CompNord2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CompNord2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PreM60xMarkerImp1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PreM60xMarkerImp1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PreM60xMarkerBret1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PreM60xMarkerBret1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CaveTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CaveTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NjadaXMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NjadaXMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CompBret1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CompBret1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Njada
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Njada Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Krev
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Krev Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CompImp1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CompImp1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CompNor2XMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CompNor2XMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; Temp stage
Debug.Trace(THIS_FILE + " #STAGE 5")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Starts DSilHand_M50WolfAmbush Quest
Debug.Trace(THIS_FILE + " #STAGE 0 : Starts DSilHand_M50WolfAmbush Quest ")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; Kill Njada Stonearm and her Shield Brother Objective completed
Debug.Trace(THIS_FILE + "#STAGE 30")

; Teleport the companions rokies to Gallows entrance
Debug.Trace(THIS_FILE + " -- M50 preM60: teleport the companions rookies to Gallows Rock entrace")
DSilHand_Utils.moveSingleNpcRefAlias(Alias_CompBret1, Alias_PreM60xMarkerBret1, "Alias_CompBret1", THIS_FILE) 
DSilHand_Utils.moveSingleNpcRefAlias(Alias_CompImp1, Alias_PreM60xMarkerImp1, "Alias_CompImp1", THIS_FILE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; Players starts the fight against the companions
Debug.Trace(THIS_FILE + "#STAGE 20: Player starts the fight against the Companions...")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; Player must go to Bonecill cave now
Debug.Trace(THIS_FILE + "#STAGE 10: Player must go to Bonechill cave...")
BonechillMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Debug.Trace(THIS_FILE + " -- Quest M60 Completed")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

;Quest Property DSilHand_M60Retaliation  Auto  
;{DSilHand_M60Retaliation reference to quest, to update to the "Setup Stage 1".}

String Property THIS_FILE  Auto  
{String with this file name: DSilHand_M50_QF_WolfAmbush, used for logs}

ObjectReference Property BonechillMarker  Auto  
