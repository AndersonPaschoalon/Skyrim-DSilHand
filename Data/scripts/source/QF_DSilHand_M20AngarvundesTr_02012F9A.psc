;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_DSilHand_M20AngarvundesTr_02012F9A Extends Quest Hidden

;BEGIN ALIAS PROPERTY Frag08
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Frag08 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Krev
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Krev Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hillara
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hillara Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY chest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_chest Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Debug.Trace("(QF_DSilHand_M20) M20 - Stage 10");

; Enable Frag08
Debug.Trace("(QF_DSilHand_M20) -- Enable Frag08")
Alias_Frag08.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
Debug.Trace("(QF_DSilHand_M20)  M20 - Stage 40");
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Diasable Troll
Debug.Trace("(QF_DSilHand_M20) -- Disable  Grag08 before quest starts")
Alias_Frag08.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Debug.Trace("(QF_DSilHand_M20)  M20 - Stage 30");
Debug.Trace("(QF_DSilHand_M20)  -- set Hillara as follower");
Actor hillara = Alias_Hillara.GetReference() as Actor
hillara.SetPlayerTeammate()
hillara.KeepOffsetFromActor(Game.GetPlayer(), 0.0, 0.0, 20.0, afFollowRadius = 10.0)
hillara.AddToFaction(CurrentFollowerFaction)
hillara.AddToFaction(DunPlayerAllyFaction)
hillara.SetRelationshipRank(Game.GetPlayer(), 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
Debug.Trace("(QF_DSilHand_M20)  M20 - Stage 20");
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
Debug.Trace("(QF_DSilHand_M20) M20 - Stage 50");

; Hillara stop following
Debug.Trace("(QF_DSilHand_M20) -- set Hillara as follower");
Actor hillara = Alias_Hillara.GetReference() as Actor
hillara.SetPlayerTeammate(false)

; remove fragment 08
Debug.Trace("(QF_DSilHand_M20) -- remove the fragment from players inventory")
Game.GetPlayer().RemoveItem(Alias_Frag08.GetReference())

; Start Next Quest
Debug.Trace("(QF_DSilHand_M20) -- start quest M30")
DSilHand_M30ScholarFragment.Start()
Debug.Trace("(QF_DSilHand_M20) --  M30 -> Stage:10 ObjectiveDisplayed:10")
DSilHand_M30ScholarFragment.SetStage(10)
DSilHand_M30ScholarFragment.SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property CurrentFollowerFaction  Auto  

Faction Property DunPlayerAllyFaction  Auto  

Quest Property DSilHand_M30ScholarFragment  Auto  
{Next quest M30}
