;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 19
Scriptname DSilHand_M10_QF_SilverHunt Extends Quest Hidden

;BEGIN ALIAS PROPERTY GiantTroll
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GiantTroll Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DriftshadeGuard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DriftshadeGuard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY hillara
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_hillara Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GallowsEntranceTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GallowsEntranceTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpyWhiterun
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpyWhiterun Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DriftshadeEntranceTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DriftshadeEntranceTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Krev
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Krev Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Skull
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Skull Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY fjol
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_fjol Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SENAAR
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SENAAR Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GallowsGuard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GallowsGuard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Kurdak
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Kurdak Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Debug.Trace(THIS_FILE + "#STAGE10")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; Log Quest Stage
Debug.Trace(THIS_FILE + "#STAGE 30")

; Enable Frost troll
DSilHand_Utils.enableActorRefAlias(Alias_GiantTroll, "Alias_GiantTroll", THIS_FILE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Debug.Trace(THIS_FILE + "#STAGE 00")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE DSilHand_M10Helper
Quest __temp = self as Quest
DSilHand_M10Helper kmyQuest = __temp as DSilHand_M10Helper
;END AUTOCAST
;BEGIN CODE
Debug.Trace(THIS_FILE + "#STAGE 100 => FAILED")

;
; Setup after joined Companions
; 
Debug.Trace(THIS_FILE + "-- kmyQuest.setupCompanionsJoin() ")
kmyQuest.setupCompanionsJoin() 


;
; Set objective failed
;
Debug.Trace(THIS_FILE +" -- SetObjectiveFailed(100)")
SetObjectiveFailed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
Debug.Trace(THIS_FILE + "#STAGE 50")

; remove the trool skull from the player inventory
Game.GetPlayer().RemoveItem(Alias_Skull.GetReference())

; Enable Krev
DSilHand_Utils.enableActorRefAlias(Alias_Krev, "Alias_Krev", THIS_FILE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Debug.Trace(THIS_FILE + "#STAGE 20")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE DSilHand_M10Helper
Quest __temp = self as Quest
DSilHand_M10Helper kmyQuest = __temp as DSilHand_M10Helper
;END AUTOCAST
;BEGIN CODE
Debug.Trace(THIS_FILE + "#STAGE 60 => COMPLETED")

;
; Faction Setup: add to Silver hand and make the Companions an enemy faction
;
Debug.Trace(THIS_FILE +" -- Add player to Silver Hand Faction")
kmyQuest.setupSilverHandJoin()

;
; Add Reward
;
Debug.Trace(THIS_FILE + "-- Adding reward after joining the Silver Hand")
Game.GetPlayer().AddItem(ArmorBanditCuirass)
Game.GetPlayer().AddItem(ArmorBanditHelmet)
Game.GetPlayer().AddItem(ArmorStormcloakBoots)
Game.GetPlayer().AddItem(ArmorBanditGauntlets)
Game.GetPlayer().AddItem(ArmorIronBandedShield)
Game.GetPlayer().AddItem(SilverSword)
Game.GetPlayer().AddItem(Book2CommonSongOfReturnV7)

;
; Setup next quest
;
Debug.Trace(THIS_FILE + "-- Starting next quest! -- but do not display")
DSilHand_M20AngarvundesTreasure.SetStage(10)
; DSilHand_M20AngarvundesTreasure.SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
Debug.Trace(THIS_FILE + "#STAGE 40")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property DSIlHand_BoneGiantTrollSkull  Auto  

Armor Property ArmorBanditCuirass  Auto  

Armor Property ArmorBanditHelmet  Auto  

Armor Property ArmorStormcloakBoots  Auto  

Armor Property ArmorBanditGauntlets  Auto  

Armor Property ArmorIronBandedShield  Auto  

WEAPON Property SilverSword  Auto  

Int Property isGallowsRockFirstConversation  = 0 Auto Hidden 
{Keep Tracvk if the Dragonborn have talked with the GallowsRock Guard yet or not}

Int Property gallowRockGuardPatience = 0 Auto  
{keep track of how much bad responses you have given to the Gallows Rock Guard.}

;Quest Property DSilHand_M20CompConspiracy  Auto  
;{DEPRECATED}

Quest Property DSilHand_M20AngarvundesTreasure  Auto  
{Reference to DSilHand_M20AngarvundesTreasure quest.}

Faction Property SilverHandFaction  Auto  

ObjectReference Property WerewolfWild1  Auto  

ObjectReference Property WerewolfWild2  Auto  
{WerewolfWild2}

Faction Property CompanionsFaction  Auto  
{reference to companions faction}

Faction Property PlayerFaction  Auto  
{reference to the player faction}

Book Property Book2CommonSongOfReturnV7  Auto  
{Book Songs Of Return V7, to be given to the player after the quest is completed.}

String Property THIS_FILE  Auto  
{File name used in the logs.}
