;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname QF_DSilHand_M60Retaliation_020092FE Extends Quest Hidden

;BEGIN ALIAS PROPERTY CompNord4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CompNord4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkjorReal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkjorReal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CompNord3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CompNord3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fjol
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fjol Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KrevBody
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KrevBody Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sennar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sennar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Skjor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Skjor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Aela
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Aela Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CompBret1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CompBret1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MainChamberTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MainChamberTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CompRed2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CompRed2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CompImp1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CompImp1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Krev
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Krev Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CompRed1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CompRed1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GallowsInTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GallowsInTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AelaReal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AelaReal Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
; Dragonborn listen to Fjol in particular
Debug.Trace("(DSilHand_M60) -- M60 Stage 60")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
; Quest completed 
Debug.Trace("(DSilHand_M60) -- M60 Stage 70")

; Add Fjol Gift
Debug.Trace("-- Adding Fjol Gift")
Game.GetPlayer().AddItem(ArmorSteelPlateCuirass)
Game.GetPlayer().AddItem(ArmorSteelPlateBoots)
Game.GetPlayer().AddItem(ArmorSteelPlateGauntlets)
Game.GetPlayer().AddItem(ArmorSteelPlateHelmet)
Game.GetPlayer().AddItem(DSilHand_TemperedSilverGreatsword)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
; Dragonborn have killed all Companions invaders on Gallows Rock
Debug.Trace("-- M60 Stage 30")
Debug.Trace("-- Dragonborn killed all Companions members. Now Need to talk with Senaar")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE DSilHand_M60Helper
Quest __temp = self as Quest
DSilHand_M60Helper kmyQuest = __temp as DSilHand_M60Helper
;END AUTOCAST
;BEGIN CODE
; DSilHand_M60Helper, Stage 10
; Before entering on Gallows Rock
Debug.Trace("(DSilHand_M60) -- M60 Stage 10")
Debug.Trace("(DSilHand_M60) -- Setup Stage(10) Enables the conversation with the Gallows Guard!" )
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE DSilHand_M60Helper
Quest __temp = self as Quest
DSilHand_M60Helper kmyQuest = __temp as DSilHand_M60Helper
;END AUTOCAST
;BEGIN CODE
; Start-Up stage.
Debug.Trace("(DSilHand_M60) -- Setup Stage() Start-Up Stage!" )
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE DSilHand_M60Helper
Quest __temp = self as Quest
DSilHand_M60Helper kmyQuest = __temp as DSilHand_M60Helper
;END AUTOCAST
;BEGIN CODE
; Dragonborn Entes on Gallows Rock fort after talking the with the Silver Hand Guard 
Debug.Trace("-- M60 Stage 20")

Debug.Trace("(DSilHand_M60)  -- Enable Werewolves")
kmyQuest.enableWerewolves()
Debug.Trace("(DSilHand_M60)  --  Move NPCs")
; Move all npcs
kmyQuest.moveNpcs()
; Disable circle members
kmyQuest.disableCircleMembers()
Debug.Trace("(DSilHand_M60)  --  Setup Doors")
kmyQuest.setupDoors()

; Enable Aela Transformation
Debug.Trace("(DSilHand_M60)  --  Alias_Aela.enableWerewolfTransformation()")
Debug.Trace("(DSilHand_M60)   Alias_Aela:<" +  Alias_Aela + ">")
DSilHand_M60AliasAelaScript scriptAela =  Alias_Aela as DSilHand_M60AliasAelaScript
scriptAela.enableWerewolfTransformation()

; Enable Skjor Transformation
Debug.Trace("(DSilHand_M60)  -- DSilHand_M60AliasSkjorScript.enableWerewolfTransformation()")
Debug.Trace("(DSilHand_M60)   Alias_Skjor:<" + Alias_Skjor + ">")
DSilHand_M60AliasSkjorScript scriptSkjor =  Alias_Skjor as DSilHand_M60AliasSkjorScript
scriptSkjor.enableWerewolfTransformation()

; Disable Actual Circle members references
Alias_AelaReal.GetReference().Disable()
Alias_SkjorReal.GetReference().Disable()

; Disable Krev, and enable its body
Debug.Trace("(DSilHand_M60)  Alias_Krev:<" + Alias_Krev + ">")
Debug.Trace("(DSilHand_M60)  Alias_KrevBody:<" + Alias_KrevBody + ">")
Alias_Krev.GetActorReference().Disable()
Alias_KrevBody.GetActorReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
; Dragonborn listen to Fjol discourse 
; ** THIS STAGE DOES NOT HAVE OBJECTIVES**
Debug.Trace("(DSilHand_M60) -- M60 Stage 50")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; Dragonborn goes to Driftshade listen to Fjol
Debug.Trace("(DSilHand_M60) -- M60 Stage 40")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


ObjectReference Property WerewolfWild1  Auto  
{WerewolfWild1 for the quest M60.}

ObjectReference Property WerewolfWild2  Auto  
{WerewolfWild2 for the quest M60.}

ObjectReference Property markNord3  Auto  
{markNord3 reference to xMarker for Companion Nord3.}

ObjectReference Property markNord4  Auto  
{markNord4 reference to xMarker for Companion Nord4.}

ObjectReference Property markRed1  Auto  
{markRed1 reference to xMarker for Companion Redguard 1.}

ObjectReference Property markRed2  Auto  
{markRed3 reference to xMarker for Companion Redguard 2 for quest M60.}

ObjectReference Property markAela  Auto  
{markAela reference to xMarker for CompanionAela fro quest M60.}

ObjectReference Property markSkjol  Auto  
{markSkjol reference to xMarker for Companion Skjol for quest M60.}

Armor Property ArmorSteelPlateCuirass  Auto  
{Fjol Gift at the end of the quest M60}

Armor Property ArmorSteelPlateBoots  Auto  
{Fjol Gift at the end of the quest M60}

Armor Property ArmorSteelPlateGauntlets  Auto  
{Fjol Gift at the end of the quest M60}

Armor Property ArmorSteelPlateHelmet  Auto  
{Fjol Gift at the end of the quest M60}

WEAPON Property DSilHand_TemperedSilverGreatsword  Auto  
{Tempered Silver Greatsword gifted by Fjol, at the end of M60 quest. }
