;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_Sandbox_MindlessKilling_020119B8 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY strangerOrigin
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_strangerOrigin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Beggar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Beggar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY stranger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_stranger Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; startup stage
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; when the player starts atacking the beggar
Alias_Stranger.GetReference().MoveTo(Alias_Player.GetReference())
Alias_Stranger.GetActorReference().SetAlpha(0)
Game.DisablePlayerControls(true, true)
Game.ForceThirdPerson()
Game.SetPlayerAIDriven(true)
FightScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; after the beggar is killed
Alias_stranger.GetReference().MoveTo(Alias_strangerOrigin.GetReference())
Alias_Stranger.GetActorReference().SetAlpha(1)
Game.EnablePlayerControls()
Game.SetPlayerAIDriven(false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property FightScene  Auto  
