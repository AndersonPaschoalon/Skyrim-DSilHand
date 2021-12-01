Scriptname DSilHand_R00Helper extends Quest  
{Script for R00 radiant quest controller.}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; QUEST REFERENCE ALIAS
;

ReferenceAlias Property SilverHand1  Auto  
{Reference Alias to SilverHand1.}

ReferenceAlias Property SilverHand2  Auto  
{Reference Alias to SilverHand2.}

ReferenceAlias Property SilverHand3  Auto  
{Reference Alias to SilverHand3.}

ReferenceAlias Property SilverHand4  Auto  
{Reference Alias to SilverHand4.}

ReferenceAlias Property SENAAR  Auto  
{Reference Alias to SENAAR.}

ReferenceAlias Property hillara  Auto  
{Reference Alias to Hillara.}

ReferenceAlias Property QuestGiverRefAlias  Auto  
{Reference alias to QuestGiver.}

;
; CHILD QUESTS
;

Quest Property DSilHand_R01WolfHunt  Auto  
{Reference to Wolf Hunt radiant quest.}

Quest Property DSilHand_R02BeastExtermination  Auto  
{Reference to Beast Extermination radiant quest.}

Quest Property DSilHand_R03WerewolfLair  Auto  
{Reference to Werewolf Lair radiant quest.}

Quest Property DSilHand_R04WitchHunter  Auto  
{Reference to Witch Hunter  radiant quest.}

;
; WORLD OBJECTS
;

ObjectReference Property XMarker01  Auto  
{Object pointing to the xMarker DSilHand_R00XMarker01 outside gallows rock.}

ObjectReference Property XMarker02  Auto  
{Object pointing to the xMarker DSilHand_R00XMarker02 outside gallows rock.}

ObjectReference Property XMarker03  Auto  
{Object pointing to the xMarker DSilHand_R00XMarker03 outside gallows rock.}

ObjectReference Property XMarker04  Auto  
{Object pointing to the xMarker DSilHand_R00XMarker04 outside gallows rock.}

ObjectReference Property XMarkerMain  Auto  
{Object pointing to the xMarker DSilHand_R00XMarkerMain outside gallows rock.}

GlobalVariable Property DSilHand_accGold  Auto  
{Global variable wich accumulates the player rewards.}

MiscObject Property Gold001  Auto  
{Gold coins.}

;
; EVENTS
;

Keyword Property DSilHand_R01Keyword  Auto  
{Keword to fire the radiant quest R01.}

Keyword Property DSilHand_R02Keyword  Auto  
{Keword to fire the radiant quest R02.}

Keyword Property DSilHand_R03Keyword  Auto  
{Keword to fire the radiant quest R03.}

Keyword Property DSilHand_R04Keyword  Auto  
{Keword to fire the radiant quest R04.}

;
; ACTORS PLACED AT THE WORLD
;

; WEREWOLFS

Actor Property R01Werewolf_BronzeWaterCave  Auto  
{(Location, World Object Name, Script Name) = (BronzeWaterCave, DSilHand_R01WerewolfBossRef, R01Werewolf_BronzeWaterCave)}

; BEASTS

Actor Property R02Beast_TolvaldsCave01  Auto  
{(Location, World Object Name, Script Name)=(TolvaldsCave01, DSilHand_R02BeastBoss02Ref, R02Beast_TolvaldsCave01)}

Actor Property R02Beast_RiversideShackExterior01  Auto  
{(Location, World Object Name, Script Name)=(RiversideShackExterior01, DSilHand_R02BeastBoss02Ref, R02Beast_RiversideShackExterior01)}

; BANDIT BOSS

Actor Property R03BanditBoss  Auto  
{Single bandit boss to be enabled.}

; WITCHES

Actor Property R04Witch_AlchemistsShackExterior  Auto  
{(Location, World Object Name, Script Name)=(AlchemistsShackExterior, DSilhand_R04GlenmorilWitch01Ref, R04Witch_AlchemistsShackExterior)}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Member variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Consts
;
String THIS_FILE = "(DSilHand_R00Helper.psc) "
int PROB_R1 = 30
int PROB_R2 = 30
int PROB_R3 = 30
int PROB_R4 = 10
int STAGE_SELECT_R1 = 10
int STAGE_SELECT_R2 = 20
int STAGE_SELECT_R3 = 30
int STAGE_SELECT_R4 = 40
int STAGE_BAND_FOLLOWS = 72
int RADIANT_QUEST_R01 = 1
int RADIANT_QUEST_R02 = 2
int RADIANT_QUEST_R03 = 3
int RADIANT_QUEST_R04 = 4
int OBJECTIVE_TALK_QUESTGIVER = 20
int STAGE_COMPLETE_RADIANT = 30
int STAGE_CONTROLLER_SETUP_ALARMS = 110

;
; SCRIPT STATE
;
; Represents the queest giver. 0: Default(Hillara), 1: Hillara, 2: Sennar
int QuestGiver = 0
; 1:R01, 2:R02, 3:R03, 4:R04
int CurrentRadiantQuest = 0
bool RowbackQuest = false
bool EnableSetGold = false
int GoldReward = 0
bool areTargetsEnabled = false

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Public Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Public Method
; Input: questTarget - RefAlias for the quest target
; Input: quest - Quest referene to for the quest to be completed
; Input: questLabel - string to log the quest name on the logs
; Input: callerScript - script from where this function was called
; Output: bool - true if the quest was finished, false if not.
;
; Helper to complete a given radiant quest in the proper way, so the rotation
; of radiant quests will work as expected.
; Usage:
; DSilhand_R00Helper r00Helper = (DSilHand_R00Controller as DSilhand_R00Helper)
; r00Helper.completesQuestTargedFailed(Alias_Werewolf, DSilHand_R01WolfHunt, "DSilHand_R01WolfHunt", THIS_FILE)
; r00Helper.completesQuestTargedFailed(Alias_Beast, DSilHand_R02BeastExtermination, "DSilHand_R02BeastExtermination", THIS_FILE)
; r00Helper.completesQuestTargedFailed(Alias_BanditBoss, DSilHand_R03WerewolfLair, "DSilHand_R03WerewolfLair", THIS_FILE)
; r00Helper.completesQuestTargedFailed(Alias_Witch, DSilHand_R04WitchHunter, "DSilHand_R04WitchHunter", THIS_FILE)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function completesQuestTargedFailed(ReferenceAlias npc, Quest radQuest, string questLabel, string callerScript) 
    if(npc == None)
        Debug.Trace(THIS_FILE + " **WARNING** completesQuestTargedFailed() - npc is None  in the quest " + questLabel, 1)
        ; complete radiant
        completesGivenRadiantQuest(radQuest, questLabel)
        ; reset controller
        SetStage(STAGE_CONTROLLER_SETUP_ALARMS)
    endif
Endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Public Method
; Input:  void
; Output: void
;
; Enable all radiant targets. This method should run a single time per
; sevegame, since irt will run when the player enables the radiant quest 
; system, when he finish the Silver Hand's main quest. Therefore it is 
; controlled by the flag areTargetsEnabled, wich is set only once.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function enableRadiantTargets()
    Debug.Trace(THIS_FILE + " -- enableRadiantTargets()")
    if (areTargetsEnabled == false)
        Debug.Trace(THIS_FILE + " -- enabling radiant targets")
        ; R01 Targets
        Debug.Trace(THIS_FILE + " * ENABLE WEREWOLFS ")
        enableAndRessurect(R01Werewolf_BronzeWaterCave)
        ; R02 Targest
        Debug.Trace(THIS_FILE + " * ENABLE BEASTS ")
        enableAndRessurect(R02Beast_TolvaldsCave01)
        enableAndRessurect(R02Beast_RiversideShackExterior01)
        ; R03Targes (a single bandit boos)
        Debug.Trace(THIS_FILE + " * ENABLE A BANDIT BOSS ")
        enableAndRessurect(R03BanditBoss)
        ; T04 Targets
        Debug.Trace(THIS_FILE + " * ENABLE GENMORIL WITCHES ")
        enableAndRessurect(R04Witch_AlchemistsShackExterior)
        ; set the flag to execute only once
        areTargetsEnabled = true
    else
        Debug.Trace(THIS_FILE + " -- the targets have already been enabled")
    endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Public Method
; Input:  void
; Output: void
;
; Outputs information about the about the quest in the log file.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function dumpDSilHandR00Controller()
    Debug.Trace(THIS_FILE + " ------------------------------------------------------------")
    Debug.Trace(THIS_FILE + " -- dumpDSilHandR00Controller()")
    Debug.Trace(THIS_FILE + " * Current Stage:#" + GetStage())
    Debug.Trace(THIS_FILE + " * SilverHand1(RefAlias):" +  SilverHand1);
    Debug.Trace(THIS_FILE + " * SilverHand2(RefAlias):" + SilverHand2);
    Debug.Trace(THIS_FILE + " * SilverHand3(RefAlias):" + SilverHand3);
    Debug.Trace(THIS_FILE + " * SilverHand4(RefAlias):" + SilverHand4);
    Debug.Trace(THIS_FILE + " * SENAAR(RefAlias):" + SENAAR);
    Debug.Trace(THIS_FILE + " * hillara(RefAlias):" + hillara);
    Debug.Trace(THIS_FILE + " * QuestGiverRefAlias(RefAlias):" + QuestGiverRefAlias);
    Debug.Trace(THIS_FILE + " * SilverHand1(Actor):" +  SilverHand1.GetActorReference());
    Debug.Trace(THIS_FILE + " * SilverHand2(Actor):" + SilverHand2.GetActorReference());
    Debug.Trace(THIS_FILE + " * SilverHand3(Actor):" + SilverHand3.GetActorReference());
    Debug.Trace(THIS_FILE + " * SilverHand4(Actor):" + SilverHand4.GetActorReference());   
    Debug.Trace(THIS_FILE + " * SENAAR(Actor):" + SENAAR.GetActorReference());
    Debug.Trace(THIS_FILE + " * hillara(Actor):" + hillara.GetActorReference());
    Debug.Trace(THIS_FILE + " * QuestGiverRefAlias(Actor:" + QuestGiverRefAlias.GetActorReference());
    Debug.Trace(THIS_FILE + " * DSilHand_accGold:" + DSilHand_accGold.GetValue());
    Debug.Trace(THIS_FILE + " * QuestGiver:" + QuestGiver);
    Debug.Trace(THIS_FILE + " * CurrentRadiantQuest:" + CurrentRadiantQuest);
    Debug.Trace(THIS_FILE + " * RowbackQuest:" + RowbackQuest);
    Debug.Trace(THIS_FILE + " * EnableSetGold:" + EnableSetGold);
    Debug.Trace(THIS_FILE + " * GoldReward:" + GoldReward);
    Debug.Trace(THIS_FILE + " ------------------------------------------------------------")
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Public Method
; Input:  void
; Output: void
;
; Randomly select next radiant quest to be played,  following this rule:
; 1. Wolf Hunt - 30% 
; 2. Beast Extermination - 30%
; 3. Werewolf Lair - 30%
; 4. Witch Hunter - 10%
; This also clears the quest giver -- just in case.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
int Function selectNextRadiantId()
    Debug.Trace(THIS_FILE + " -- selectNextRadiantId()")
    int debugR01 = 10
    int debugR02 = 40
    int debugR03 = 70
    int debugR04 = 100
    ; clears the quest giver just in case...
    clearQuestGiver()
    ; clear variables
    RowbackQuest = false
    EnableSetGold = false
    GoldReward = 0   
    ; 1. Wolf Hunt           - 30%  0:30     
    ; 2. Beast Extermination - 30%  31:60
    ; 3. Werewolf Lair       - 30%  61:90
    ; 4. Witch Hunter        - 10%  91:100
    int limR1 = PROB_R1
    int limR2 = limR1 + PROB_R2
    int limR3 = limR2 + PROB_R3
    ; Get a random number between 0 and 100
    int random = Utility.RandomInt(0, 100)
    Debug.Trace(THIS_FILE + " -- selectNextRadiantId() - random = " + random)
    if (random <= limR1)
        Debug.Trace(THIS_FILE + " -- selectNextRadiantId() - Wolf Hunt")
        return STAGE_SELECT_R1
    elseif (random <= limR2)
        Debug.Trace(THIS_FILE + " -- selectNextRadiantId() - Beast Extermination")
        return STAGE_SELECT_R2
    elseif (random <= limR3)
        Debug.Trace(THIS_FILE + " -- selectNextRadiantId() - Werewolf Lair")
        ; return STAGE_SELECT_R3
        ; DEBUG - DELETE
        return STAGE_SELECT_R4
    else
        Debug.Trace(THIS_FILE + " -- selectNextRadiantId() - Witch Hunter")
        return STAGE_SELECT_R4
    endif
Endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Public Method
; Input:  int nextR00Stage - next controller stage to be selected for the 
;           controller quest.
; Input:  int questGiver - quest giver Actor number.
; Output: void
;
; Starts the right radiant quest, based on the current stage of the controller
; quest. It sets the child radiant quest in the right stage and objective, 
; and advances the controller quest to the stage based on the input stage 
; provided. This method is called on the dialog view.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function startsRadiantQuest(int nextR00Stage, int questGiverId)
    Debug.Trace(THIS_FILE + " -- startsRadiantQuest() nextR00Stage:<" + nextR00Stage + ">, questGiverId:<" + questGiverId + ">")
 
    ; (1) Ensure at least on tasget of each quest is alive, so the radiant will not fail.
    ensureOneTargetAlive()
 
    ; (2) Force QuestGiver id to be set on the controller quest 
    ; so the radiant quest will be populated with the correct quest giver.
    ; sets the quest giver number
    setsQuestGiverId(questGiverId)
    Actor questGiverActObj = getsQuestGiverActor()
    ObjectReference questGiverObj = getsQuestGiverObject()
    Debug.Trace(THIS_FILE + "  * getsQuestGiverActor:<" + questGiverActObj + ">")
    ; DEBUG DELETE 
    Debug.MessageBox("getsQuestGiverActor:<" + questGiverActObj + ">, questGiverObj:" + questGiverObj)
    ; clears and set the quest giver into the controller reference alias.
    QuestGiverRefAlias.Clear()
    QuestGiverRefAlias.ForceRefTo(questGiverObj)
    Debug.Trace(THIS_FILE + "  * QuestGiverRefAlias.GetActorRef():<" + QuestGiverRefAlias.GetActorRef() + ">")
    ; DEBUG DELETE 
    Debug.MessageBox("QuestGiverRefAlias.GetActorRef():<" + QuestGiverRefAlias.GetActorRef() + ">")
    Debug.MessageBox("QuestGiverRefAlias.GetRef():<" + QuestGiverRefAlias.GetRef() + ">")

    ; (3) Initialize right radiant quest
    int currentStage = GetStage()
    if (currentStage == STAGE_SELECT_R1)
	    Debug.Trace(THIS_FILE + " -- START DSilHand_R01WolfHunt")
        CurrentRadiantQuest = 1
        DSilHand_R01WolfHunt.Reset()
        DSilHand_R01WolfHunt.SetActive(true)
        DSilHand_R01WolfHunt.Start()
        DSilHand_R01WolfHunt.SetStage(0)      
        ; currObj: -1
        ; nextObj: 10
        ; nextStage: 10
        DSilHand_Utils.advanceQuest(DSilHand_R01WolfHunt, -1, 10, 10, THIS_FILE)
        ;startsGivenRadiantQuest(DSilHand_R01WolfHunt, "DSilHand_R01WolfHunt")
	elseif (currentStage == STAGE_SELECT_R2)
		Debug.Trace(THIS_FILE + " -- START DSilHand_R02BeastExtermination")
        CurrentRadiantQuest = 2
        startsGivenRadiantQuest(DSilHand_R02BeastExtermination, "DSilHand_R02BeastExtermination")
	elseif (currentStage == STAGE_SELECT_R3)
		Debug.Trace(THIS_FILE + " -- START DSilHand_R03WerewolfLair")
        CurrentRadiantQuest = 3
        startsGivenRadiantQuest(DSilHand_R03WerewolfLair, "DSilHand_R03WerewolfLair")
	elseif (currentStage == STAGE_SELECT_R4)
		Debug.Trace(THIS_FILE + " -- START DSilHand_R04WitchHunter")
        CurrentRadiantQuest = 4
        startsGivenRadiantQuest(DSilHand_R04WitchHunter, "DSilHand_R04WitchHunter")
	else
		; Default radiant quest
		Debug.Trace(THIS_FILE + " **WARNING** INVALID CURRENT STAGE " + currentStage + ". SELECTING DEFAULT RADIANT QUEST", 1)
	    Debug.Trace(THIS_FILE + " -- START DSilHand_R01WolfHunt")
        CurrentRadiantQuest = 1
        startsGivenRadiantQuest(DSilHand_R01WolfHunt, "DSilHand_R01WolfHunt")	
    endif

    ; (4) Advance controller stage
    Debug.Trace(THIS_FILE + " -- Next Controller Quest: " + nextR00Stage)
    SetStage(nextR00Stage)
EndFunction 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Public Method
; Input: void
; Output: void
;
; Prepare the Silver hand band to follow you until the quest is completed.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function prepareSilverHandBand()
    ; teleport the band and the quest giver to the rights markers outside Gallows
    teleportBand()
    ; Wait a small time
    Utility.Wait(1)
    ; advance the quest to the stage the band will follow the Dragonborn.
    SetStage(STAGE_BAND_FOLLOWS)
    ; Evaluate all the AI packages
    evalueateBandAIPackages()
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Public Method
; Input: void
; Output: quest giver Actor object
;
; Returns the right Actor object of the current quest giver.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Actor Function getsQuestGiverActor()
    Debug.Trace(THIS_FILE + " -- getsQuestGiverActor()")
    Actor hillaraNpc = hillara.GetActorReference()
    Actor senaarNpc = SENAAR.GetActorReference()
    if(QuestGiver == 1)
        Debug.Trace(THIS_FILE + " -- QUEST GIVER IS HILLARA")
        return hillaraNpc
    elseif(QuestGiver == 2)
        Debug.Trace(THIS_FILE + " -- QUEST GIVER IS SENAAR")
        return senaarNpc
    else
        Debug.Trace(THIS_FILE + " **WARNING** INVALID QUEST GIVER. Returning default Actor Hillara", 1)
        return hillaraNpc
    endif   
EndFunction

ObjectReference Function getsQuestGiverObject()
    Debug.Trace(THIS_FILE + " -- getsQuestGiverObject()")
    ObjectReference hillaraNpc = hillara.GetReference()
    ObjectReference senaarNpc = SENAAR.GetReference()
    if(QuestGiver == 1)
        Debug.Trace(THIS_FILE + " -- QUEST GIVER IS HILLARA")
        return hillaraNpc
    elseif(QuestGiver == 2)
        Debug.Trace(THIS_FILE + " -- QUEST GIVER IS SENAAR")
        return senaarNpc
    else
        Debug.Trace(THIS_FILE + " **WARNING** INVALID QUEST GIVER. Returning default Actor Hillara", 1)
        return hillaraNpc
    endif   
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Public Method
; Input: void
; Output: void
;
; Reset the quest giver state.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function clearQuestGiver()
    QuestGiver = 0
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Public Method
; Input: void
; Output: void
;
; Creates an alar to row back the quest to its start. Enables the flag and 
; calls register for single update game time.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function createAlarmRowbackQuest()
    Debug.Trace(THIS_FILE + " -- createAlarmRowbackQuest()")
    ; Create alarm to row back the quest - from 5 to 10 days.
    int timeToRowback = calcTimeToRowback()
    ; flag as rowback
    RowbackQuest = true
    ; register the event
    RegisterForSingleUpdateGameTime(timeToRowback)
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Public Method
; Input: void
; Output: void
;
; Calculate a random time to rowback.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
int Function calcTimeToRowback()
    ; INIT - DELETE - DEBUG
    Debug.Trace(THIS_FILE + "DEBUG: ONLY ONE HOUR")
    ; INIT - DELETE - DEBUG
    return 1
    ; Debug.Trace(THIS_FILE + " -- calcTimeToRowback()") 
    ; ; Create alarm to row back the quest - from 5 to 10 days.
    ; int daysToRowBack = Utility.RandomInt(5, 10)
    ; Debug.Trace(THIS_FILE + "    * daysToRowBack: " + daysToRowBack)
    ; timeToRowback = daysToRowBack*24   
    ; Debug.Trace(THIS_FILE + "    * timeToRowback:" + timeToRowback) 
    ; return timeToRowback
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Public Method
; Input: void
; Output: void
; 
; Create an alarm to set up the reward for the player.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function creatAlarmReward()
    Debug.Trace(THIS_FILE + " -- creatAlarmReward()")
    ; Create alarm of onw day
    EnableSetGold = true
    ; Reward: 500 + PlayerLevel*10
    if (CurrentRadiantQuest == RADIANT_QUEST_R01 || CurrentRadiantQuest == RADIANT_QUEST_R02 || CurrentRadiantQuest == RADIANT_QUEST_R04)
        GoldReward = 500 + Game.GetPlayer().GetLevel()*10
    elseif (CurrentRadiantQuest == RADIANT_QUEST_R03)
        GoldReward = 500 + Game.GetPlayer().GetLevel()*20
    endif
    ; register for update
    RegisterForSingleUpdateGameTime(24)
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Public Method
; Input: void
; Output: void
; 
; This method updates the global variable DSilHand_accGold, wich stores the
; amount of gold the player has collected on the radiant quests. This method
; is called one day after the player has completed a radiant quest (using a 
; RegisterForSingleUpdateGameTime, called in the creatAlarmReward method).
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function updateRadiantAccGold()
    int accGold =  (DSilHand_accGold.GetValue() as int)
    accGold = accGold + GoldReward
    DSilHand_accGold.SetValue(accGold as float)
Endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Public Method
; Input: void
; Output: void
;
; This method is used to give a reward to the player, as a result of success 
; on the radiant quests.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function giveRewardToPlayer()
    Debug.Trace(THIS_FILE + " -- giveRewardToPlayer()")
    ; give the player the reward
    int accGold = (DSilHand_accGold.GetValue() as int)
    Debug.Trace(THIS_FILE + " -- accGold:" + accGold)
    Game.Getplayer().AddItem(Gold001, accGold)
    ; reset gold on the global variable
    DSilHand_accGold.SetValue(0)
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Public Method
; Input: void
; Output: void
;
; This method can be used to complete the Child radiant quest at the right
; momment, after the player talks to the questgiver.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function completeRadiantQuest()
    Debug.Trace(THIS_FILE + " -- completeRadiantQuest()")
    int currRadQuest = getCurrentRadiantQuest()
    if (currRadQuest == RADIANT_QUEST_R01)
        ; Complete R01 Wolf Hunt
        Debug.Trace(THIS_FILE + " -- completeRadiantQuest:DSilHand_R01WolfHunt")
        completesGivenRadiantQuest(DSilHand_R01WolfHunt, "DSilHand_R01WolfHunt")
    elseif (currRadQuest == RADIANT_QUEST_R02)
        ; Complete R02 Beast Extermination
        Debug.Trace(THIS_FILE + " -- completeRadiantQuest:DSilHand_R02BeastExtermination")
        completesGivenRadiantQuest(DSilHand_R02BeastExtermination, "DSilHand_R02BeastExtermination")
    elseif (currRadQuest == RADIANT_QUEST_R03)
        ; Complete R03 Werewolf Lair
        Debug.Trace(THIS_FILE + " -- completeRadiantQuest:DSilHand_R03WerewolfLair")
        completesGivenRadiantQuest(DSilHand_R03WerewolfLair, "DSilHand_R03WerewolfLair")
    elseif (currRadQuest == RADIANT_QUEST_R04)
        ; Complete R04 Witch Hunter
        Debug.Trace(THIS_FILE + " -- completeRadiantQuest:DSilHand_R04WitchHunter")
        completesGivenRadiantQuest(DSilHand_R04WitchHunter, "DSilHand_R04WitchHunter")
    else
        Debug.Trace(THIS_FILE + " **ERROR** completeRadiantQuest() - ERROR: Unknown Radiant Quest")
    endif
    ; Now, advances the stage of the controller quest, so the alarms can be set
    SetStage(STAGE_CONTROLLER_SETUP_ALARMS)
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Private Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Private Method
; Input:  void
; Output: void 
;
; Re-evaluate all the actors AIs from the current controller quest.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function evalueateBandAIPackages()
    Debug.Trace(THIS_FILE + " -- evalueateBandAIPackages()")
    ; SilverHand1
    if (SilverHand1 != None)
        Debug.Trace(THIS_FILE + " -- Evaluate Package for SilverHand1")
        SilverHand1.GetActorReference().EvaluatePackage()
    else
        Debug.Trace(THIS_FILE + " **WARNING** SilverHand1 is None", 1)
    endif
    ; SilverHand2
    if (SilverHand2 != None)
        Debug.Trace(THIS_FILE + " -- Evaluate Package for SilverHand2")
        SilverHand2.GetActorReference().EvaluatePackage()
    else
        Debug.Trace(THIS_FILE + " **WARNING** SilverHand2 is None", 1)
    endif
    ; SilverHand3
    if (SilverHand3 != None)
        Debug.Trace(THIS_FILE + " -- Evaluate Package for SilverHand3")
        SilverHand3.GetActorReference().EvaluatePackage()	
    else
        Debug.Trace(THIS_FILE + " **WARNING** SilverHand3 is None", 1)
    endif
    ; SilverHand4
    if (SilverHand4 != None)
        Debug.Trace(THIS_FILE + " -- Evaluate Package for SilverHand4")
        SilverHand4.GetActorReference().EvaluatePackage()	
    else
        Debug.Trace(THIS_FILE + " **WARNING** SilverHand4 is None", 1)
    endif
    ; SENAAR
    if (SENAAR != None)
        Debug.Trace(THIS_FILE + " -- Evaluate Package for SENAAR")
        SENAAR.GetActorReference().EvaluatePackage()
    else
        Debug.Trace(THIS_FILE + " **WARNING** SENAAR is None", 1)
    endif
    ; hillara
    if (hillara != None)
        Debug.Trace(THIS_FILE + " -- Evaluate Package for hillara")
        hillara.GetActorReference().EvaluatePackage()
    else
        Debug.Trace(THIS_FILE + " **WARNING** hillara is None", 1)
    endif
Endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Private Method
; Input: void
; Output: void 
;
; Sets the quest giver state.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function setsQuestGiverId(int questGiverId)
    if(questGiverId < 0)
        Debug.Trace(THIS_FILE + " **WARNING** setsQuestGiverId() - Invalid quest giver id < 0. Setting to 1", 1)
        questGiverId = 1
    elseif(questGiverId > 2) 
        Debug.Trace(THIS_FILE + " **WARNING** setsQuestGiverId() - Invalid quest giver id > 2. Setting to 2", 1)
        questGiverId = 2
    endif
    QuestGiver = questGiverId
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Private Method
; Input:  void
; Output: void 
;
; Teleports all the band to the right xMarkers outside gallows rock.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function teleportBand()
    Debug.Trace(THIS_FILE + " -- teleportBand()")
    ; Teleport random Silver Hand NPC to the xMarker outside gallows rock.
    DSilHand_Utils.moveSingleNpcRefAlias2(SilverHand1, XMarker01, "SilverHand1", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias2(SilverHand2, XMarker02, "SilverHand2", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias2(SilverHand3, XMarker03, "SilverHand3", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias2(SilverHand4, XMarker04, "SilverHand4", THIS_FILE)
    ; Teleport the questgiver to xMarker outside gallows rock.
    Actor questGiverActor = getsQuestGiverActor()
    DSilHand_Utils.moveSingleNpc(questGiverActor, XMarkerMain, "questGiverActor", THIS_FILE)
Endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Private Method
; Input:  void
; Output: void 
;
; Return the number of the current quest being executed.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
int Function getCurrentRadiantQuest()
    Debug.Trace(THIS_FILE + " -- getCurrentRadiantQuest() -> CurrentRadiantQuest:" + CurrentRadiantQuest)
    if (CurrentRadiantQuest < 0)
        Debug.Trace(THIS_FILE + " **WARNING** getCurrentRadiantQuest() - CurrentRadiantQuest < 0. Setting to 0", 1)
        CurrentRadiantQuest = 0
    endif
    if (CurrentRadiantQuest > 4)
        Debug.Trace(THIS_FILE + " **WARNING** getCurrentRadiantQuest() - CurrentRadiantQuest > 4. Setting to 4", 1)
        CurrentRadiantQuest = 4
    endif
    return CurrentRadiantQuest
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Private Method
; Input:  void
; Output: bool - true if the quest was started, false if not.
; 
; Helper to starts a given radiant quest in the proper way, que Alias values 
; will be recalculated, and the quest will be displayed as expected to the 
; user.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function startsGivenRadiantQuest(Quest radQuest, string radQuestLabel)
    Debug.Trace(THIS_FILE + " -- startsGivenRadiantQuest() => " + radQuestLabel)
    Debug.MessageBox("STOP " + radQuestLabel)
    radQuest.Stop()
    Debug.MessageBox("RESET " + radQuestLabel)
    radQuest.Reset()
    Debug.MessageBox("START " + radQuestLabel)
    radQuest.SetActive(true)
    radQuest.Start()
    Debug.MessageBox("SETSTAGE 0  " + radQuestLabel)
    radQuest.SetStage(0)      
    ; currObj: -1
    ; nextObj: 10
    ; nextStage: 10
    Debug.MessageBox("ADVANCE TO " + radQuestLabel)
    bool retVal = DSilHand_Utils.advanceQuest(radQuest, -1, 10, 10, THIS_FILE)
    Debug.MessageBox("** radQuest.GetStage():" + radQuest.GetStage())
    return retVal
Endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Private Method
; Input:  void
; Output: bool - true if the quest was finished, false if not.
;
; Helper to complete a given radiant quest in the proper way, so the rotation
; of radiant quests will work as expected.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function completesGivenRadiantQuest(Quest radQuest, string radQuestLabel)
    Debug.Trace(THIS_FILE + " -- completeRadiantQuest() => " + radQuestLabel)
    radQuest.SetObjectiveCompleted(OBJECTIVE_TALK_QUESTGIVER)
    bool retVal = radQuest.SetStage(STAGE_COMPLETE_RADIANT)
    radQuest.CompleteQuest()
    radQuest.Stop()
    return retVal
Endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Private Method
; Input:  void
; Output: void 
;
; Ensure at least on of each targets are alive and enabled before the radiant
; quests starts. This is a safeness method, to avoid the radiant quest sistem 
; fails and stop to work. As I noticed during the development, the alias may 
; not be filled if the targed is dead, and WILL NOT if it is disabled. So,
; I run this method everytime before starting a radiant queest, so the game
; engine will find at least a single valid instance if the objects it is
; searching for. Ideally, this should not be really necessary, since there 
; will be many valid actors available in the game, and they should have 
; respawned when there is no more available options. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function ensureOneTargetAlive()
    Debug.Trace(THIS_FILE + " -- ensureOneTargetAlive()")
    ; at least one werewolf
    DSilHand_Utils.enableActor(R01Werewolf_BronzeWaterCave, "R01Werewolf_BronzeWaterCave", THIS_FILE)
    ; At least one beast
    DSilHand_Utils.enableActor(R02Beast_TolvaldsCave01, "R02Beast_TolvaldsCave01", THIS_FILE)
    ; at least one witch
    DSilHand_Utils.enableActor(R04Witch_AlchemistsShackExterior, "R04Witch_AlchemistsShackExterior", THIS_FILE)  
Endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Private Method
; Input:  void
; Output: void 
;
; A not-null safe helper method, only ment to be used here, to enable and 
; ressurect the radiant quest targets.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function enableAndRessurect(Actor npc)
    Debug.Trace(THIS_FILE + " -- enableAndRessurect()")
    npc.Enable()
    npc.Resurrect()
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; This event is used to update the reward global variable, and to rowback the
; quest, so the player may play again some time later.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnUpdateGameTime()
    Debug.Trace(THIS_FILE + " -- OnUpdateGameTime()")
    ; set reward or Row back current quest
    ; if EnableSetGold flag is active, execute updateRadiantAccGold() routine
    if (EnableSetGold == true )
        ; disable flag
        EnableSetGold = false 
        ; update accumated gold the player has to receive
        updateRadiantAccGold()
        ; create an alarm to rowback the quest in some days
        createAlarmRowbackQuest()
    elseif (RowbackQuest == true )
        ; if RowbackQuest is activated, rowback the quest to its beginning        
        Debug.MessageBox("Rowback Quest!!")
        RowbackQuest = false
        Reset()
        Stop()
        Start()
        SetStage(5)
    endif
EndEvent


