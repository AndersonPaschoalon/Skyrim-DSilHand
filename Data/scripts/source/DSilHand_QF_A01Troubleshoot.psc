;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 40
Scriptname DSilHand_QF_A01Troubleshoot Extends Quest Hidden

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; INITIALIZE QUEST M60
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Debug.MessageBox("DSilHand Troubleshooter: Initializing Quest Retaliation")

; Join the silver hands
Debug.MessageBox("You Have Joined the Silver Hands!")
Game.GetPlayer().AddToFaction(SilverHandFaction)
CompanionsFaction.SetEnemy(SilverHandFaction)
CompanionsFaction.SetEnemy(PlayerFaction)   

; Setup quest
Debug.Trace(THIS_FILE + " -- INITIALIZING M60");
DSilHand_M60Retaliation.Start()
DSilHand_M60Retaliation.SetStage(10)
DSilHand_M60Retaliation.SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; INITIALIZE QUEST M50
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Debug.MessageBox("DSilHand Troubleshooter: Initializing Quest Wolf Ambush")

; Join the Silver Hands
Debug.MessageBox("You Have Joined the Silver Hands!")
Game.GetPlayer().AddToFaction(SilverHandFaction)
CompanionsFaction.SetEnemy(SilverHandFaction)
CompanionsFaction.SetEnemy(PlayerFaction)   

; Setup Quest
Debug.Trace(THIS_FILE + " -- INITIALIZING M50");
DSilHand_KrevTheSkinner.Enable()
DSilHand_M50WolfAmbush.Start()
DSilHand_M50WolfAmbush.SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; INITIALIZE QUEST M90
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Debug.MessageBox("DSilHand Troubleshooter: Initializing Quest In honor of Ysgramor")

; Join the Silver Hands
Debug.MessageBox("You Have Joined the Silver Hands!")
Game.GetPlayer().AddToFaction(SilverHandFaction) 
SilverHandFaction.SetAlly(CompanionsFaction)

Debug.Trace(THIS_FILE + " -- INITIALIZING M90");
; Initializing trigger quest
DSilHand_iM90Trigger.Start()
DSilHand_iM90Trigger.SetStage(10)
DSilHand_iM90Trigger.SetStage(20)

; Give Wuulthrad to Fjol, and equip
DSilHand_Fjol.AddItem(C06BladeOfYsgramor)
DSilHand_Fjol.EquipItem(C06BladeOfYsgramor)

; Give Kodlak journal to the player
Game.GetPlayer().AddItem(C06KodlaksJournal)

; Move Fjol next to the player
DSilHand_Fjol.MoveTo(Game.GetPlayer())

; Add witch heads
Game.GetPlayer().AddItem(DSilHand_HagravenHead, 5, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FINALIZE QUEST M80
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
Debug.MessageBox("FINALIZE QUEST R03")
DSilHand_R03WerewolfLair.SetObjectiveCompleted(30)
DSilHand_R03WerewolfLair.SetStage(30)
DSilHand_R03WerewolfLair.CompleteAllObjectives()
DSilHand_R03WerewolfLair.CompleteQuest()
DSilHand_R03WerewolfLair.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; 0: FACTION(MAIN) QUESTS
; This quest is an invisible quest, used to complete quests and setup the world as if 
; it was actually completed. 
; It can be used to Debug or troubleshoot.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FINALIZE QUEST M30
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FINALIZE QUEST M20
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
Debug.MessageBox("FINALIZE QUEST R04")
DSilHand_R04WitchHunter.SetObjectiveCompleted(30)
DSilHand_R04WitchHunter.SetStage(30)
DSilHand_R04WitchHunter.CompleteAllObjectives()
DSilHand_R04WitchHunter.CompleteQuest()
DSilHand_R04WitchHunter.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; INITIALIZE QUEST R04
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Debug.MessageBox("DSilHand_R04WitchHunter")

DSilHand_R00Helper r00Helper = (DSilHand_R00Controller as DSilHand_R00Helper)
r00Helper.enableAllTartgets()

; Send the event with no extra data
if(DSilHand_R04Keyword.SendStoryEventAndWait())
  Debug.MessageBox("R04 Quest started!")
else
  Debug.MessageBox("R04 No quest started")
endIf

Debug.MessageBox("Target R04: " + R04Target.GetActorReference())
r00Helper.disableAllTargetsExcept(R04Target.GetActorReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
Debug.MessageBox("START QUEST R02")
DSilHand_R02BeastExtermination.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FINALIZE QUEST M60
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FINALIZE QUEST M90
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FINALIZE QUEST M40
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 300: Auxiliary Quests
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
Debug.MessageBox("START QUEST R03")
DSilHand_R04WitchHunter.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
Debug.MessageBox("Creating a Divine Shrine on the Underforge")
DSilHand_A04UnderforgeDivines.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FINALIZE QUEST M50
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; INITIALIZE QUEST M10
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Debug.MessageBox("DSilHand Troubleshooter: Silver Hunt")

; Quest Setup
DSilHand_M10SilverHunt.Start()
DSilHand_M10SilverHunt.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 200: RADIANT QUESTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Debug.MessageBox("DSilHand Troubleshooter: Startup Radiant controller")
DSilHand_R00Controller.SetStage(5)

; Join the silver hands
Game.GetPlayer().AddToFaction(SilverHandFaction)

; Make player silver hand leader
int PLAYER_IS_LEADER = 1
DSilHand_isPlayerLeader.SetValue(PLAYER_IS_LEADER)

; ensure all targets are disabled
; DSilHand_R00Helper r00Helper = (DSilHand_R00Controller as DSilHand_R00Helper)
; r00Helper.disableAllTargetsExcept(None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
; This stages completes S01
Debug.MessageBox("DSilHand Troubleshooter: Initializing Quest Dwammer Tempering")

Debug.MessageBox("DSilHand_TestS01")
DSilHand_iS01Trigger.SetStage(10)
DSilHand_iS01Trigger.SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 100: SIDE QUESTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
Debug.MessageBox("START QUEST R01")
DSilHand_R01WolfHunt.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; INITIALIZE QUEST M20
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Debug.MessageBox("DSilHand Troubleshooter: Initializing Quest Angarvunde's Treasure")

; Join the silver hands
Game.GetPlayer().AddToFaction(SilverHandFaction)
Debug.MessageBox("You have Joined the Silver Hands!")
CompanionsFaction.SetEnemy(SilverHandFaction)
CompanionsFaction.SetEnemy(PlayerFaction)    

Debug.Trace(THIS_FILE + " -- STARTING M20");
DSilHand_KrevTheSkinner.Enable()
DSilHand_M20AngarvundesTreasure.Start()
DSilHand_M20AngarvundesTreasure.SetStage(10)
DSilHand_M20AngarvundesTreasure.SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; INITIALIZE QUEST R03
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Debug.MessageBox("DSilHand_R03WerewolfLair")

DSilHand_R00Helper r00Helper = (DSilHand_R00Controller as DSilHand_R00Helper)
r00Helper.enableAllTartgets()

; Send the event with no extra data
if(DSilHand_R03Keyword.SendStoryEventAndWait())
  Debug.MessageBox("R03 Quest started!")
else
  Debug.MessageBox("R03 No quest started")
endIf

Debug.MessageBox("Target R03: " + R03Target.GetActorReference())
r00Helper.disableAllTargetsExcept(R03Target.GetActorReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; INITIALIZE QUEST M30
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Debug.MessageBox("DSilHand Troubleshooter: Initializing Quest Scholar Fragment")

; Join the silver hands
Debug.MessageBox("You Have Joined the Silver Hands!")
Game.GetPlayer().AddToFaction(SilverHandFaction)
CompanionsFaction.SetEnemy(SilverHandFaction)
CompanionsFaction.SetEnemy(PlayerFaction)   

; Setup quest
Debug.MessageBox(THIS_FILE + " -- INITIALIZING M30");
DSilHand_M30ScholarFragment.Start()
DSilHand_M30ScholarFragment.SetStage(10)
DSilHand_M30ScholarFragment.SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
Debug.MessageBox("SETUP QUEST A03 - PLAYER HOME")
DSilHand_A03Helper a03Helper = (DSilHand_A03PlayerHouse as DSilHand_A03Helper)
a03Helper.playerAcquireHouse()
DSilHand_A03PlayerHouse.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
Debug.MessageBox("START QUEST R03")
DSilHand_R03WerewolfLair.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
Debug.MessageBox("FINALIZE QUEST R01")
DSilHand_R01WolfHunt.SetObjectiveCompleted(30)
DSilHand_R01WolfHunt.SetStage(30)
DSilHand_R01WolfHunt.CompleteAllObjectives()
DSilHand_R01WolfHunt.CompleteQuest()
DSilHand_R01WolfHunt.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
; This stages completes S02
Debug.MessageBox("DSilHand Troubleshooter: Initializing Main Quest Sovngarde")

Game.GetPlayer().ModActorValue("DragonSouls", 30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
; FINALIZE QUEST M70
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
Debug.MessageBox("FINALIZE QUEST R02")
DSilHand_R02BeastExtermination.SetObjectiveCompleted(30)
DSilHand_R02BeastExtermination.SetStage(30)
DSilHand_R02BeastExtermination.CompleteAllObjectives()
DSilHand_R02BeastExtermination.CompleteQuest()
DSilHand_R02BeastExtermination.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FINALIZE QUEST M10
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
; This stages completes S02
Debug.MessageBox("DSilHand Troubleshooter: Initializing Quest Iconoclastic Revenge!")

; disable Ysgramor tomb door
NorSecRmSmDoorSm01.Disable()

; Join the Silver Hands
Debug.MessageBox("You Have Joined the Silver Hands!")
Game.GetPlayer().AddToFaction(SilverHandFaction) 
SilverHandFaction.SetAlly(CompanionsFaction)

; Move Fjol next to the player
DSilHand_Fjol.MoveTo(Game.GetPlayer())

; set quest stage to 5
DSilHand_S02IconoclasticRevenge.SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; INITIALIZE QUEST M80
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Debug.MessageBox("DSilHand Troubleshooter: Initializing Quest Assault on Jorrvaskr")
Debug.Trace(THIS_FILE + " -- INITIALIZING M80");

; Join the Silver Hand
Debug.MessageBox("You Have Joined the Silver Hands!")

; Setup Init quest
DSilHand_M10SilverHunt.Start()
DSilHand_M10SilverHunt.SetStage(60)
DSilHand_M10SilverHunt.SetObjectiveCompleted(60)

; Setup Quest
DSilHand_M80AssaultJor.Start()
DSilHand_M80AssaultJor.SetStage(10)
DSilHand_M80AssaultJor.SetObjectiveDisplayed(10)

; Setup World
AelaTheHuntress.Disable()
Skjor.Disable()
Njada.Disable()
Farkas.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; INITIALIZE QUEST R02
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Debug.MessageBox("DSilHand_R02BeastExtermination")

DSilHand_R00Helper r00Helper = (DSilHand_R00Controller as DSilHand_R00Helper)
r00Helper.enableAllTartgets()

; Send the event with no extra data
if(DSilHand_R02Keyword.SendStoryEventAndWait())
  Debug.MessageBox("R02 Quest started!")
else
  Debug.MessageBox("R02 No quest started")
endIf

Debug.MessageBox("Target R02: " + R02Target.GetActorReference())
r00Helper.disableAllTargetsExcept(R02Target.GetActorReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; INITIALIZE QUEST M70
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Debug.MessageBox("DSilHand Troubleshooter: Initializing Quest Uncovering the Past")

Debug.MessageBox("You Have Joined the Silver Hands!")
Game.GetPlayer().AddToFaction(SilverHandFaction)
CompanionsFaction.SetEnemy(SilverHandFaction)
CompanionsFaction.SetEnemy(PlayerFaction)    
Debug.MessageBox("Finalizing DSilHand_M60Retaliation...");
DSilHand_M60Retaliation.Start()
DSilHand_M60Retaliation.SetObjectiveDisplayed(60)    
DSilHand_M60Retaliation.SetStage(70)
Debug.MessageBox("Starting DSilHand_M70UncPast...");
DSilHand_M70UncPast.Start()
DSilHand_M70UncPast.SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; INITIALIZE QUEST R01
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Debug.MessageBox("DSilHand_R01WolfHunt")

DSilHand_R00Helper r00Helper = (DSilHand_R00Controller as DSilHand_R00Helper)
r00Helper.enableAllTartgets()

; Send the event with no extra data
if(DSilHand_R01Keyword.SendStoryEventAndWait())
  Debug.MessageBox("R01 Quest started!")
else
  Debug.MessageBox("R01 No quest started")
endIf

Debug.MessageBox("Target R01: " + R01Target.GetActorReference())
r00Helper.disableAllTargetsExcept(R01Target.GetActorReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; INITIALIZE QUEST M40
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Debug.MessageBox("DSilHand Troubleshooter: Initializing Quest Companion Conspiracy")

; Join the silver Hands
Debug.MessageBox("You Have Joined the Silver Hands!")
Game.GetPlayer().AddToFaction(SilverHandFaction)
CompanionsFaction.SetEnemy(SilverHandFaction)
CompanionsFaction.SetEnemy(PlayerFaction)

; Stup quest    
Debug.Trace(THIS_FILE + " -- STARTING M40");
DSilHand_Fjol.Enable()
DSilHand_M40CompConspiracy.Start()
DSilHand_M40CompConspiracy.SetStage(10)
DSilHand_M40CompConspiracy.SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DSilHand_M10SilverHunt  Auto  

Quest Property DSilHand_M20AngarvundesTreasure  Auto  

Quest Property DSilHand_M30ScholarFragment  Auto  

Quest Property DSilHand_M40CompConspiracy  Auto  

Quest Property DSilHand_M50WolfAmbush  Auto  

Quest Property DSilHand_M60Retaliation  Auto  

Quest Property DSilHand_M70UncPast  Auto  

Quest Property DSilHand_M80AssaultJor  Auto  

Quest Property DSilHand_M90HonYsgramor  Auto  

Actor Property DSilHand_KrevTheSkinner  Auto  

Actor Property DSilHand_Fjol  Auto  

Actor Property AelaTheHuntress  Auto  

Actor Property Skjor  Auto  

Actor Property Njada  Auto  

Actor Property Farkas  Auto  

Faction Property PlayerFaction  Auto  

Faction Property CompanionsFaction  Auto  

Faction Property SilverHandFaction  Auto  

Quest Property DSilHand_iS01Trigger  Auto  

String Property THIS_FILE = "(QF_DSilHand_A01Troubleshoot_020530E9.psc)" Auto  

Quest Property DSilHand_iM90Trigger  Auto  

Book Property C06KodlaksJournal  Auto  

WEAPON Property C06BladeOfYsgramor  Auto  

MiscObject Property DSilHand_HagravenHead  Auto  

Quest Property DSilHand_S02IconoclasticRevenge  Auto  

ObjectReference Property NorSecRmSmDoorSm01  Auto  

Shout Property Dragonrend  Auto  

Shout Property ClearSkiesShout  Auto  

Quest Property DSilHand_R00Controller  Auto  

Quest Property DSilHand_R01WolfHunt  Auto  

Quest Property DSilHand_R02BeastExtermination  Auto  

Quest Property DSilHand_R03WerewolfLair  Auto  

Quest Property DSilHand_R04WitchHunter  Auto  

Keyword Property DSilHand_R01Keyword  Auto  

Keyword Property DSilHand_R02Keyword  Auto  

Keyword Property DSilHand_R03Keyword  Auto  

Keyword Property DSilHand_R04Keyword  Auto  

GlobalVariable Property DSilHand_isPlayerLeader  Auto  

ObjectReference Property DSilHand_R02xMarker02  Auto  

ObjectReference Property DSilHand_R02xMarker03  Auto  

ReferenceAlias Property R01Target  Auto  

ReferenceAlias Property R02Target  Auto  

ReferenceAlias Property R03Target  Auto  

ReferenceAlias Property R04Target  Auto  

Quest Property DSilHand_A03PlayerHouse  Auto  

Quest Property DSilHand_A04UnderforgeDivines  Auto  
