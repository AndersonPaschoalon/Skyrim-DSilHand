;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname DSilHand_QF_R00Controller Extends Quest Hidden

;BEGIN ALIAS PROPERTY SilverHand4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SilverHand4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY hillara
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_hillara Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TriggerLeavesGallows
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TriggerLeavesGallows Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestGiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SilverHand3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SilverHand3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SENAAR
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SENAAR Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SilverHand2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SilverHand2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SilverHand1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SilverHand1 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE DSilHand_R00Helper
Quest __temp = self as Quest
DSilHand_R00Helper kmyQuest = __temp as DSilHand_R00Helper
;END AUTOCAST
;BEGIN CODE
; In this stage the questgiver will have the DSilHand_R04WitchHunter dialog enabled.
; When this stage is completed, the stage 50, 60 or 70 will be set.
Debug.Trace(THIS_FILE + "#STAGE " + 40)
kmyQuest.dumpDSilHandR00Controller()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE DSilHand_R00Helper
Quest __temp = self as Quest
DSilHand_R00Helper kmyQuest = __temp as DSilHand_R00Helper
;END AUTOCAST
;BEGIN CODE
; In this stage the questgiver will have the DSilHand_R02BeastExtermination dialog enabled.
; When this stage is completed, the stage 50, 60 or 70 will be set.
Debug.Trace(THIS_FILE + "#STAGE " + 20)
kmyQuest.dumpDSilHandR00Controller()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE DSilHand_R00Helper
Quest __temp = self as Quest
DSilHand_R00Helper kmyQuest = __temp as DSilHand_R00Helper
;END AUTOCAST
;BEGIN CODE
; In this stage the questgiver will have theDSilHand_R01WolfHunt dialog enabled.
; When this stage is completed, the stage 50, 60 or 70 will be set.
Debug.Trace(THIS_FILE + "#STAGE " + 10)
kmyQuest.dumpDSilHandR00Controller()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE DSilHand_R00Helper
Quest __temp = self as Quest
DSilHand_R00Helper kmyQuest = __temp as DSilHand_R00Helper
;END AUTOCAST
;BEGIN CODE
; Waits one day to set the reward 
; this stage is set by the child quest.
Debug.Trace(THIS_FILE + "#STAGE " + 110)
kmyQuest.dumpDSilHandR00Controller()
kmyQuest.creatAlarmReward()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE DSilHand_R00Helper
Quest __temp = self as Quest
DSilHand_R00Helper kmyQuest = __temp as DSilHand_R00Helper
;END AUTOCAST
;BEGIN CODE
; Setup dialogs with Senaar and Hillara

; This stage will evaluate wich contract will be chosen 
; 10 - Wolf Hunt
; 20 - Beast Extermination
; 30 - Werewolf Lair
; 40 - Witch Hunter
; After that, the player will choose what behavior the silver hands are going to have
; 50 - The player will solve the contract alone
; 60 - The player and the quest giver will execute the contract
; 70 - The player and a silver hand band will solve the contract
; 100 - standby stage: the child quest is completed. It will wait a random time
;          (from 2 days up to 12), and rool back to the stage 5, to enable the quest again.
;
; To choose the contract, it will attempt to start a random picked radiant quest.
; If this one fails, it will attempt to start R01, R02, R03 and R04.
; If all attempt fails, it will create an 24 hours rowback alarm for the controller R00, and returns 0. 
; So the current stage will be set again to 0, and in 24 hours this exact same procedure will
; be executed again, and will try to start up a radiant quest, following the same procedure.

Debug.Trace(THIS_FILE + "#STAGE " + 5)
; log controller information
kmyQuest.dumpDSilHandR00Controller()

; tries to select a radiant quest to start 
int nextStage = kmyQuest.selectNextRadiantStage()
Debug.Trace(THIS_FILE + "-- SELECTED STAGE: " + nextStage)
; advance the controller to the choosen radiant stage, or rowback if selectNextRadiantStage() failed
SetStage(nextStage)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; A band will follow the dragonborn to do the contract. 
; The band will follow the player until the contract is executed.
Debug.Trace(THIS_FILE + "#STAGE " + 72)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE DSilHand_R00Helper
Quest __temp = self as Quest
DSilHand_R00Helper kmyQuest = __temp as DSilHand_R00Helper
;END AUTOCAST
;BEGIN CODE
; You must talk to QuestGiver
; The quest giver will tell you to come back take the money tomorrow. 
; once he speaks, the stage is set to 110
kmyQuest.dumpDSilHandR00Controller()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DSilHand_R00Helper
Quest __temp = self as Quest
DSilHand_R00Helper kmyQuest = __temp as DSilHand_R00Helper
;END AUTOCAST
;BEGIN CODE
; Startup Stage
Debug.Trace(THIS_FILE + "#STAGE " + 0)
kmyQuest.dumpDSilHandR00Controller()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE DSilHand_R00Helper
Quest __temp = self as Quest
DSilHand_R00Helper kmyQuest = __temp as DSilHand_R00Helper
;END AUTOCAST
;BEGIN CODE
; In this stage the questgiver will have the DSilHand_R03WerewolfLair dialog enabled.
; When this stage is completed, the stage 50, 60 or 70 will be set.
Debug.Trace(THIS_FILE + "#STAGE " + 30)
kmyQuest.dumpDSilHandR00Controller()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE DSilHand_R00Helper
Quest __temp = self as Quest
DSilHand_R00Helper kmyQuest = __temp as DSilHand_R00Helper
;END AUTOCAST
;BEGIN CODE
; A band will follow the dragonborn to do the contract. 
; In this stage the player leaves Gallows rock and execute the trigger, and 
; the band will be transported outside gallows rock

; prepare band outside gallows rock
Debug.Trace(THIS_FILE + "#STAGE " + 71)
kmyQuest.prepareSilverHandBand()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE DSilHand_R00Helper
Quest __temp = self as Quest
DSilHand_R00Helper kmyQuest = __temp as DSilHand_R00Helper
;END AUTOCAST
;BEGIN CODE
; The player will go alone to execute the contract
Debug.Trace(THIS_FILE + "#STAGE " + 50)
kmyQuest.dumpDSilHandR00Controller()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE DSilHand_R00Helper
Quest __temp = self as Quest
DSilHand_R00Helper kmyQuest = __temp as DSilHand_R00Helper
;END AUTOCAST
;BEGIN CODE
; The quest giver will follow the player
Debug.Trace(THIS_FILE + "#STAGE " + 60)
kmyQuest.dumpDSilHandR00Controller()

Utility.Wait(1)
Alias_QuestGiver.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE DSilHand_R00Helper
Quest __temp = self as Quest
DSilHand_R00Helper kmyQuest = __temp as DSilHand_R00Helper
;END AUTOCAST
;BEGIN CODE
; A band will follow the dragonborn to do the contract. 
; It will be triggered when the player leaves gallows rock.
Debug.Trace(THIS_FILE + "#STAGE " + 70)
kmyQuest.dumpDSilHandR00Controller()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DSilHand_R01WolfHunt  Auto  
{Reference to the Radiant quest Wolf Hunt. }

Quest Property DSilHand_R02BeastExtermination  Auto  
{Reference to the Radiant quest Beast Extermination. }

Quest Property DSilHand_R03WerewolfLair  Auto  
{Reference to the radiant quest Werewolf Lair.}

Quest Property DSilHand_R04WitchHunter  Auto  
{Reference to the radiant quest Witch Hunter.}

String Property THIS_FILE = "(DSilHand_QF_R00Controller.psc) " Auto  

;Int Property NextRadiantStage  Auto  
;{The selected stage wich represents the actual radiant quest wich was choosen to run.}
