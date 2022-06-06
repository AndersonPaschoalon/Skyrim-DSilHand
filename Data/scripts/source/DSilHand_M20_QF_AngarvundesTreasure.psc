;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname DSilHand_M20_QF_AngarvundesTreasure Extends Quest Hidden

;BEGIN ALIAS PROPERTY hillara
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_hillara Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Krev
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Krev Auto
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
; On this stage you have to talk to krev to start the quest

Debug.Trace(THIS_FILE + "#STAGE 10")

; Enable Frag08
Debug.Trace(THIS_FILE + "-- Enable Frag08")
DSilHand_Utils.enableObjectRefAlias(Alias_Frag08, "Alias_Frag08", THIS_FILE)
; Move to the right Chest
DSilHand_Utils.moveObjectToContainer(Alias_Frag08, Alias_Chest, "Frag08", "Chest", THIS_FILE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
Debug.Trace(THIS_FILE + "#STAGE 40")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
Debug.Trace(THIS_FILE + "#STAGE 50")

; Make Hillara a potential follower
int facRank = DSilHand_HillaraRef.GetFactionRank(PotentialFollowerFaction)
Debug.Trace(THIS_FILE + "--  DSilHand_HillaraRef: PotentialFollowerFaction:" + facRank)
DSilHand_HillaraRef.SetFactionRank(PotentialFollowerFaction, 0)

; remove fragment 08
Debug.Trace(THIS_FILE + "-- remove the fragment from players inventory")
Game.GetPlayer().RemoveItem(Alias_Frag08.GetReference())

; Start Next Quest
Debug.Trace(THIS_FILE + "-- start quest M30")
DSilHand_M30ScholarFragment.Start()
Debug.Trace(THIS_FILE + "--  M30 -> Stage:10 ObjectiveDisplayed:10")
DSilHand_M30ScholarFragment.SetStage(10)
DSilHand_M30ScholarFragment.SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Startup Stage
Debug.Trace(THIS_FILE + "#STAGE 00")

Debug.Trace(THIS_FILE + "-- Disable  Frag08 before quest starts")
DSilHand_Utils.disableObjectRefAlias(Alias_Frag08, "Alias_Frag08", THIS_FILE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
; In this stage you have to go talk to Hillara
Debug.Trace(THIS_FILE + "#STAGE 20")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Debug.Trace(THIS_FILE + "#STAGE 30")

; Set Hillara as a follower
Debug.Trace(THIS_FILE + "-- set Hillara as follower");
DSilHand_Utils.setupFollowerRefAlias(Alias_Hillara, "Alias_Hillara", THIS_FILE)

; just in case, for some reason the player already has the fragment
; theObject - Alias_Frag08.GetReference()
; objectLabel - "Frag08"
; objToComplete - 30
; nextObj - 40
; nextStage - 40
Debug.Trace(THIS_FILE + "-- Avance in case the players alredy has the fragment -> this shoudl not happen...");
DSilHand_Utils.advanceIfAlreadyTaken(Self, Alias_Frag08.GetReference(), "Frag08", 30,  40, 40, THIS_FILE)

; Add map marker
AngarvundeMarker.AddToMap()
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

String Property THIS_FILE  Auto  
{File name to be used on the logs.}

ObjectReference Property AngarvundeMarker  Auto  
