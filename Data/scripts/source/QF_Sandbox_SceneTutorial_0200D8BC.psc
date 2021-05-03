;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_Sandbox_SceneTutorial_0200D8BC Extends Quest Hidden

;BEGIN ALIAS PROPERTY noteGiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_noteGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Note
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Note Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY otherBarStool
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_otherBarStool Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY playerStool
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_playerStool Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Debug.MessageBox("Scene Stage 30")
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Debug.MessageBox("Scene Stage 10")
; we need to start the scene, the player st oin the start stool
BarScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Debug.MessageBox("Scene Stage 20")
Game.GetPlayer().AddItem(Alias_note.GetReference())
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property BarScene  Auto  
