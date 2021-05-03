;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname QF_Sandbox_SceneTutorial2_0200E8F7 Extends Quest Hidden

;BEGIN ALIAS PROPERTY bandit
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bandit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY chair2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_chair2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Keerava
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Keerava Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY XMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_XMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY antidote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_antidote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Note
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Note Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY chair1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_chair1 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Start()
Debug.MessageBox("Scene2 10")
; we need to start the scene, the player st oin the start stool
ChairScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Debug.MessageBox("Scene2 30")
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_Antidote.GetReference())
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE Sandbox_Scene2TutorialScript
Quest __temp = self as Quest
Sandbox_Scene2TutorialScript kmyQuest = __temp as Sandbox_Scene2TutorialScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.endPoisoned()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Debug.MessageBox("Scene2 20")
Alias_Bandit.GetReference().Enable()
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property ChairScene  Auto  
