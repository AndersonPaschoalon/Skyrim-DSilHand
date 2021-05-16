;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_Sandbox_CustomAiTest_0201040B Extends Quest Hidden

;BEGIN ALIAS PROPERTY theon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_theon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY theonStart
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_theonStart Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY balonTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_balonTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY balon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_balon Auto
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
;BEGIN AUTOCAST TYPE Sandbox_CustomAiTestHelper
Quest __temp = self as Quest
Sandbox_CustomAiTestHelper kmyQuest = __temp as Sandbox_CustomAiTestHelper
;END AUTOCAST
;BEGIN CODE
kmyQuest.theonToSkeever()
Alias_Theon.GetReference().MoveTo(Alias_theonStart.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
FinalScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property FinalScene  Auto  
