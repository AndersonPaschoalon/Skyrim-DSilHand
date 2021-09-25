;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname QF_DSilHand_A01Troubleshoot_020530E9 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
Debug.MessageBox("DSilHand Troubleshooter: ")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
; This stages completes S02
Debug.MessageBox("DSilHand Troubleshooter: Initializing Quest ***")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; This stages completes M30
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

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; This stages completes M50
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

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; This stages completes M10
Debug.MessageBox("DSilHand Troubleshooter: Silver Hunt")

; Quest Setup
DSilHand_M10SilverHunt.Start()
DSilHand_M10SilverHunt.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; This stages completes M40
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

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; This stages completes M60
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

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; This stages completes M90
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

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; This stages completes M70
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

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; This quest is an invisible quest, used to complete quests and setup the world as if 
; it was actually completed. 
; It can be used to Debug or troubleshoot.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; This stages completes M20
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

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; This stages completes M80
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
