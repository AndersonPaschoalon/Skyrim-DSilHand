;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname DSilHand_M90_QF_HonYsgramor Extends Quest Hidden

;BEGIN ALIAS PROPERTY TriggerEnterYsgramorTomb
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TriggerEnterYsgramorTomb Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WitchHead01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WitchHead01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WitchHead03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WitchHead03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WitchHead02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WitchHead02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Witch03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Witch03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EternalFlameSconce
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EternalFlameSconce Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY fjol
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_fjol Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WitchHead04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WitchHead04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Witch02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Witch02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Witch01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Witch01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Witch05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Witch05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WitchHead05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WitchHead05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Witch04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Witch04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KodlaksGhost
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KodlaksGhost Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ShieldOfYsgramor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ShieldOfYsgramor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StatueActivator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StatueActivator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WolfSpirit
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WolfSpirit Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE DSilHand_M90Helper
Quest __temp = self as Quest
DSilHand_M90Helper kmyQuest = __temp as DSilHand_M90Helper
;END AUTOCAST
;BEGIN CODE
; Kill the wolf spirit

Debug.Trace("(DSilHand_M90:30) -- M90HonYsgramor Stage 30")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE DSilHand_M90Helper
Quest __temp = self as Quest
DSilHand_M90Helper kmyQuest = __temp as DSilHand_M90Helper
;END AUTOCAST
;BEGIN CODE
; Fjol will force greet you on this stage
Debug.Trace("(DSilHand_M90:50) -- Evaluate Fjol AI pkg so he will force greet Dragonborn")

; Evaluate Fjol AI Package
Alias_fjol.GetActorReference().EvaluatePackage()

; after you finish the dialog with Fjol, this stage will be completed!
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE DSilHand_M90Helper
Quest __temp = self as Quest
DSilHand_M90Helper kmyQuest = __temp as DSilHand_M90Helper
;END AUTOCAST
;BEGIN CODE
; Save Kodlak Spirit
Debug.Trace("(DSilHand_M90:40) -- M90HonYsgramor Stage 40")

; runs script to save kodlak function
kmyQuest.saveKodlakSoul()

; complete quest stage, wait a small time to allow force greeting
Utility.Wait(5)
int STAGE_FJOL_FORCE_GREET = 50
SetStage(STAGE_FJOL_FORCE_GREET)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE DSilHand_M90Helper
Quest __temp = self as Quest
DSilHand_M90Helper kmyQuest = __temp as DSilHand_M90Helper
;END AUTOCAST
;BEGIN CODE
; You talked with Fjol, and you both are going to hunt the witches

Debug.Trace("(DSilHand_M90:10) -- M90HonYsgramor Stage 10")
kmyQuest.setupQuestWorldElements()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE DSilHand_M90Helper
Quest __temp = self as Quest
DSilHand_M90Helper kmyQuest = __temp as DSilHand_M90Helper
;END AUTOCAST
;BEGIN CODE
; Now you must burn the Witches heads on the harbinger flame

Debug.Trace("(DSilHand_M90:20) -- M90HonYsgramor Stage 20")
Debug.Trace("(DSilHand_M90:20) -- M90HonYsgramor Stage 20")
kmyQuest.setupYsgramorTomb()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE DSilHand_M90Helper
Quest __temp = self as Quest
DSilHand_M90Helper kmyQuest = __temp as DSilHand_M90Helper
;END AUTOCAST
;BEGIN CODE
; Complete the quest
Debug.Trace("(DSilHand_M90:60) -- M90HonYsgramor Stage 60 FINALIZE QUEST")

; finalize quest script
Debug.Trace("(DSilHand_M90:60) -- M90HonYsgramor Stage 60")
kmyQuest.finalizeQuest()

; Questline End Settings
Game.IncrementStat("Questlines Completed")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Setup stage, and runs at the begining of the game
Debug.Trace("(DSilHand_M90:0) -- M90HonYsgramor Stage 0")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


