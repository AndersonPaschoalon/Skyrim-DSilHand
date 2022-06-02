;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname DSilHand_S02_QF_IconoclasticRevenge Extends Quest Hidden

;BEGIN ALIAS PROPERTY fjol
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_fjol Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EternalFlameSconce
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EternalFlameSconce Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Totem3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Totem3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Chest3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Chest3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Totem2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Totem2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Chest2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Chest2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Totem1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Totem1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Chest1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Chest1 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE DSilHand_S02Helper
Quest __temp = self as Quest
DSilHand_S02Helper kmyQuest = __temp as DSilHand_S02Helper
;END AUTOCAST
;BEGIN CODE
; objective: find Totem1

Debug.Trace(THIS_FILE + " # STAGE 10")
kmyQuest.prepareFirstTotem()
Game.GetPlayer().AddItem(CR12TotemsOfHircine, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE DSilHand_S02Helper
Quest __temp = self as Quest
DSilHand_S02Helper kmyQuest = __temp as DSilHand_S02Helper
;END AUTOCAST
;BEGIN CODE
; burn the totems in the ethernal flame
Debug.Trace(THIS_FILE + " # STAGE 40")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DSilHand_S02Helper
Quest __temp = self as Quest
DSilHand_S02Helper kmyQuest = __temp as DSilHand_S02Helper
;END AUTOCAST
;BEGIN CODE
; STARTUP STAGE
Debug.Trace(THIS_FILE + " # STAGE 0 --  initializing quest...")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE DSilHand_S02Helper
Quest __temp = self as Quest
DSilHand_S02Helper kmyQuest = __temp as DSilHand_S02Helper
;END AUTOCAST
;BEGIN CODE
; Talk to Fjol the quest is complete
Debug.Trace(THIS_FILE + " # STAGE 50")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE DSilHand_S02Helper
Quest __temp = self as Quest
DSilHand_S02Helper kmyQuest = __temp as DSilHand_S02Helper
;END AUTOCAST
;BEGIN CODE
; find Totem2
Debug.Trace(THIS_FILE + " # STAGE 20")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE DSilHand_S02Helper
Quest __temp = self as Quest
DSilHand_S02Helper kmyQuest = __temp as DSilHand_S02Helper
;END AUTOCAST
;BEGIN CODE
; Quest Complete 
Debug.Trace(THIS_FILE + " # STAGE 60")
kmyQuest.playerReward()

; setup Fjol's Research Radiant Quest
Debug.Trace(THIS_FILE + "-- SETUP R05 QUEST!")
DSilHand_R05Helper r05 = (DSilHand_R05FjolsResearch as DSilHand_R05Helper)
r05.createAlarmRowbackQuest(1, 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE DSilHand_S02Helper
Quest __temp = self as Quest
DSilHand_S02Helper kmyQuest = __temp as DSilHand_S02Helper
;END AUTOCAST
;BEGIN CODE
; Fjol force greets you
Debug.Trace(THIS_FILE + " # STAGE 21")

kmyQuest.prepareThirdTotem()
Alias_fjol.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE DSilHand_S02Helper
Quest __temp = self as Quest
DSilHand_S02Helper kmyQuest = __temp as DSilHand_S02Helper
;END AUTOCAST
;BEGIN CODE
; find Totem3
Debug.Trace(THIS_FILE + " # STAGE 30")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE DSilHand_S02Helper
Quest __temp = self as Quest
DSilHand_S02Helper kmyQuest = __temp as DSilHand_S02Helper
;END AUTOCAST
;BEGIN CODE
; Fjol force greets you
Debug.Trace(THIS_FILE + " # STAGE 31")
Alias_fjol.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
; quest start allowed, Fjol dialog enabled!

Debug.Trace(THIS_FILE + " # STAGE 5")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE DSilHand_S02Helper
Quest __temp = self as Quest
DSilHand_S02Helper kmyQuest = __temp as DSilHand_S02Helper
;END AUTOCAST
;BEGIN CODE
; Fjol force greets you

Debug.Trace(THIS_FILE + " # STAGE 11")
kmyQuest.prepareSecondTotem()
Alias_fjol.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

String Property THIS_FILE Auto  

Book Property CR12TotemsOfHircine  Auto  
{The Totems Of Hircine book.}

Quest Property DSilHand_R05FjolsResearch  Auto  
{Reference to the quest Fjol's Research.}
