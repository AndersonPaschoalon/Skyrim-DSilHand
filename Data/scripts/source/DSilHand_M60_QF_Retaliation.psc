;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 18
Scriptname DSilHand_M60_QF_Retaliation Extends Quest Hidden

;BEGIN ALIAS PROPERTY GallowsInTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GallowsInTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CompImp1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CompImp1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY xHeadFjol
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_xHeadFjol Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CompBret1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CompBret1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SilverRef01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SilverRef01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CompRed2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CompRed2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CompNord3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CompNord3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CompNord4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CompNord4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Krev
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Krev Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY xHead07
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_xHead07 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY xHead08
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_xHead08 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sennar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sennar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY xHead06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_xHead06 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Skjor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Skjor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SilverRef04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SilverRef04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KrevBody
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KrevBody Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY xMarkerEnabler
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_xMarkerEnabler Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CompRed1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CompRed1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SilverRef05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SilverRef05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY xHead05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_xHead05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SilverRef02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SilverRef02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AelaReal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AelaReal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY xHead01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_xHead01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkjorReal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkjorReal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY xHead02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_xHead02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Aela
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Aela Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY fjol
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_fjol Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SilverRef03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SilverRef03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MainChamberTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MainChamberTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY xHead04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_xHead04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY xHead03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_xHead03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GallowsGuard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GallowsGuard Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
; Quest completed 
Debug.Trace(THIS_FILE + "# Stage 70")

; Add Fjol Gift
Debug.Trace(THIS_FILE + " -- Adding Fjol Gift")
Game.GetPlayer().AddItem(ArmorSteelPlateCuirass)
Game.GetPlayer().AddItem(ArmorSteelPlateBoots)
Game.GetPlayer().AddItem(ArmorSteelPlateGauntlets)
Game.GetPlayer().AddItem(ArmorSteelPlateHelmet)
Game.GetPlayer().AddItem(DSilHand_TemperedSilverGreatsword)

; Advance the next quest stage to setup stage
Debug.Trace(THIS_FILE + " -- Advance the next quest DSilHand_M70 to SETUP STAGE (Stage 5)")
DSilHand_M70UncPast.SetStage(5);

; disable Krev Body
Alias_KrevBody.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
; Dragonborn have killed all Companions invaders on Gallows Rock
Debug.Trace(THIS_FILE + "# Stage 30")
Debug.Trace(THIS_FILE + "-- Evaluate Senaar Package")
Alias_Sennar.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; Dragonborn goes to Driftshade listen to Fjol
Debug.Trace(THIS_FILE + "# Stage 40")

; Set senaar as a potential follower
int facRank = DSilHand_Senaar.GetFactionRank(PotentialFollowerFaction)
Debug.Trace(THIS_FILE + "-- DSilHand_Senaar: PotentialFollowerFaction:" + facRank)
DSilHand_Senaar.SetFactionRank(PotentialFollowerFaction, 0)
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
Debug.Trace(THIS_FILE + "# Stage 20")

Debug.Trace(THIS_FILE + "-- Enable Werewolves")
kmyQuest.enableWerewolves()
Debug.Trace(THIS_FILE + "--  Move NPCs")
; Move all npcs
kmyQuest.moveNpcs()
; Disable circle members
kmyQuest.disableCircleMembers()
Debug.Trace(THIS_FILE + "--  Setup Doors")
kmyQuest.setupDoors()

; Enable Aela Transformation
Debug.Trace(THIS_FILE + "--  Alias_Aela.enableWerewolfTransformation()")
Debug.Trace(THIS_FILE + "     Alias_Aela:<" +  Alias_Aela + ">")
DSilHand_WerewolfTransformation scriptAela =  Alias_Aela as DSilHand_WerewolfTransformation
scriptAela.enableWerewolfTransformation()

; Enable Skjor Transformation
Debug.Trace(THIS_FILE + "-- DSilHand_M60AliasSkjorScript.enableWerewolfTransformation()")
Debug.Trace(THIS_FILE + "Alias_Skjor:<" + Alias_Skjor + ">")
DSilHand_WerewolfTransformation scriptSkjor =  Alias_Skjor as DSilHand_WerewolfTransformation
scriptSkjor.enableWerewolfTransformation()

; Disable Actual Circle members references
Alias_AelaReal.GetReference().Disable()
Alias_SkjorReal.GetReference().Disable()

; Disable Krev, and enable its body
Debug.Trace(THIS_FILE + "Alias_Krev:<" + Alias_Krev + ">")
Debug.Trace(THIS_FILE + "Alias_KrevBody:<" + Alias_KrevBody + ">")
Alias_Krev.GetActorReference().Disable()
Alias_KrevBody.GetActorReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
Debug.Trace(THIS_FILE + "# Stage 55")
; not used anymore
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE DSilHand_M60Helper
Quest __temp = self as Quest
DSilHand_M60Helper kmyQuest = __temp as DSilHand_M60Helper
;END AUTOCAST
;BEGIN CODE
; Dragonborn listen to Fjol in particular
Debug.Trace(THIS_FILE + "# Stage 60")

Debug.Trace(THIS_FILE + "-- play  IdleApplaud animations for the Silver Hand NPC's expectors")

DSilHand_Utils.playIdleHelper(Alias_SilverRef01, "Alias_SilverRef01", IdleApplaud2, "IdleApplaud2", THIS_FILE)
DSilHand_Utils.playIdleHelper(Alias_SilverRef02, "Alias_SilverRef02", IdleApplaud2, "IdleApplaud2", THIS_FILE)
DSilHand_Utils.playIdleHelper(Alias_SilverRef03, "Alias_SilverRef03", IdleApplaud2, "IdleApplaud2", THIS_FILE)
DSilHand_Utils.playIdleHelper(Alias_SilverRef04, "Alias_SilverRef04", IdleApplaud2, "IdleApplaud2", THIS_FILE)
DSilHand_Utils.playIdleHelper(Alias_SilverRef05, "Alias_SilverRef05", IdleApplaud2, "IdleApplaud2", THIS_FILE)
DSilHand_Utils.playIdleHelper(Alias_Fjol,              "Alias_Fjol",             IdleApplaud2, "IdleApplaud2", THIS_FILE)
Utility.Wait(8)
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
Debug.Trace(THIS_FILE + "# Stage 10")
Debug.Trace(THIS_FILE +  "-- Enables injuried Gallows Guard scene and enables the conversation")
SceneGuardWounded.Start()
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
;
; Start-Up stage.
;
Debug.Trace(THIS_FILE + "# Stage 00")
Debug.Trace(THIS_FILE + "-- Setup Stage() Start-Up Stage!" )

;
; Enable soldiers on Driftshade Refugee
; 
Debug.Trace(THIS_FILE + "-- Setup kmyQuest.silverHandDriftshadeSetup()!" )
Alias_xMarkerEnabler.GetReference().Enable()
kmyQuest.silverHandDriftshadeSetup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
; Dragonborn listen to Fjol discourse 
; ** THIS STAGE DOES NOT HAVE OBJECTIVES**
Debug.Trace(THIS_FILE + "# Stage 50")
SceneFjolDiscourse.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


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

Faction Property PotentialFollowerFaction  Auto  
{Fallower faction reference, used to allow Sennar folow you.}

Actor Property DSilHand_Senaar  Auto  
{Sennar Actor reference}

Scene Property SceneFjolDiscourse  Auto  
{Fjol discourse scene DSilHand_M60_SceneFjolDiscourse.}

Idle Property IdleApplaud2  Auto  
{Clapping animation 2}

Idle Property IdleApplaud3  Auto  
{Clapping animation 3}

Idle Property IdleApplaud4  Auto  
{Clapping animation 4}

Idle Property IdleApplaud5  Auto  
{Idle clapping animation 5}

Scene Property SceneGuardWounded  Auto  
{Scene to make the Gallows Guard feel pain.}

Quest Property DSilHand_M70UncPast  Auto  
{reference to Uncovering the Past quest}

String Property THIS_FILE  Auto  
{String with this file name to be used by logs.}
