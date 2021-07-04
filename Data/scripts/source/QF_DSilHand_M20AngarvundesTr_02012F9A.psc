;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_DSilHand_M20AngarvundesTr_02012F9A Extends Quest Hidden

;BEGIN ALIAS PROPERTY Krev
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Krev Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY hillara
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_hillara Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY chest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_chest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Frag08
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Frag08 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Debug.Trace("(DSilHand_M20) -- Stage 10");

; Enable Frag08
Debug.Trace("(DSilHand_M20) -- Enable Frag08")
DSilHand_Utils.enableObjectRefAlias(Alias_Frag08, "Alias_Frag08", "(DSilHand_M20:10)")
;Alias_Frag08.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Diasable Ax Fragment 08
Debug.Trace("(DSilHand_M20:0) -- Disable  Frag08 before quest starts")
DSilHand_Utils.disableObjectRefAlias(Alias_Frag08, "Alias_Frag08", "(DSilHand_M20:0)")
; Alias_Frag08.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
Debug.Trace("(DSilHand_M20:50) -- Stage 50");

; Make Hillara a potential follower
int facRank = DSilHand_HillaraRef.GetFactionRank(PotentialFollowerFaction)
Debug.Trace("(DSilHand_M20:50) --  DSilHand_HillaraRef: PotentialFollowerFaction:" + facRank)
DSilHand_HillaraRef.SetFactionRank(PotentialFollowerFaction, 0)

; remove fragment 08
Debug.Trace("(DSilHand_M20:50) -- remove the fragment from players inventory")
Game.GetPlayer().RemoveItem(Alias_Frag08.GetReference())

; Start Next Quest
Debug.Trace("(DSilHand_M20:50) -- start quest M30")
DSilHand_M30ScholarFragment.Start()
Debug.Trace("(DSilHand_M20:50) --  M30 -> Stage:10 ObjectiveDisplayed:10")
DSilHand_M30ScholarFragment.SetStage(10)
DSilHand_M30ScholarFragment.SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Debug.Trace("(DSilHand_M20:30) -- Stage 30");

; Set Hillara as a follower
Debug.Trace("(DSilHand_M20:30)  -- set Hillara as follower");
;Actor hillara = Alias_Hillara.GetReference() as Actor
;; set Hillara as team mate
;hillara.SetPlayerTeammate()
;; make hillara friendly
;hillara.SetRelationshipRank(Game.GetPlayer(), 3)
DSilHand_Utils.setupFollowerRefAlias(Alias_Hillara, "Alias_Hillara", "(DSilHand_M20:30)")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
Debug.Trace("(DSilHand_M20:40) -- Stage 40");
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
Debug.Trace("(DSilHand_M20:20)  -- Stage 20");
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property CurrentFollowerFaction  Auto  

; Faction Property DunPlayerAllyFaction  Auto  

Quest Property DSilHand_M30ScholarFragment  Auto  
{Next quest M30}

Faction Property PotentialFollowerFaction  Auto  

; Package Property DSilHand_HillaraAiFollower  Auto  

Actor Property DSilHand_HillaraRef  Auto  
