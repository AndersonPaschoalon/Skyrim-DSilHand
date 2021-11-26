Scriptname DSilHand_R00Helper extends Quest  
{Script for R00 radiant quest controller.}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

Quest Property DSilHand_R01WolfHunt  Auto  
{Reference to Wolf Hunt radiant quest.}

Quest Property DSilHand_R02BeastExtermination  Auto  
{Reference to Beast Extermination radiant quest.}

Quest Property DSilHand_R03WerewolfLair  Auto  
{Reference to Werewolf Lair radiant quest.}

Quest Property DSilHand_R04WitchHunter  Auto  
{Reference to Witch Hunter  radiant quest.}

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

Keyword Property DSilHand_R01Keyword  Auto  
{Keword to fire the radiant quest R01.}

Keyword Property DSilHand_R02Keyword  Auto  
{Keword to fire the radiant quest R02.}

Keyword Property DSilHand_R03Keyword  Auto  
{Keword to fire the radiant quest R03.}

Keyword Property DSilHand_R04Keyword  Auto  
{Keword to fire the radiant quest R04.}


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
; Input:  void
; Output: void
;
; Enables the radiant quests targets.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function enableRadiantTargets()
    Debug.Trace(THIS_FILE + " -- enableRadiantTargets()")
    if (areTargetsEnabled == false)
        Debug.Trace(THIS_FILE + " -- enabling radiant targets")
        areTargetsEnabled = true
    else
        Debug.Trace(THIS_FILE + " -- the targets have already been enabled")
    endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
; Input:  void
;
; Randomly select next radiant quest to be played,  following this rule:
; 1. Wolf Hunt - 30% 
; 2. Beast Extermination - 30%
; 3. Werewolf Lair - 30%
; 4. Witch Hunter - 10%
; This also clears the quest giver -- just in case.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
int Function selectNextRadiant()
    Debug.Trace(THIS_FILE + " -- selectNextRadiant()")
    ; clears the quest giver just in case...
    clearQuestGiver()
    ; clear variables
    RowbackQuest = false
    EnableSetGold = false
    GoldReward = 0   
    ; 1. Wolf Hunt - 30%            
    ; 2. Beast Extermination - 30%
    ; 3. Werewolf Lair - 30%
    ; 4. Witch Hunter - 10%
    int limR1 = PROB_R1
    int limR2 = limR1 + PROB_R2
    int limR3 = limR2 + PROB_R3
    ; Get a random number between 0 and 100
    int random = Utility.RandomInt(0, 100)
    ; TEST QUEST M20
    ; random = 40
    Debug.Trace(THIS_FILE + " -- selectNextRadiant() - random = " + random)
    if (random <= limR1)
        Debug.Trace(THIS_FILE + " -- selectNextRadiant() - Wolf Hunt")
        return STAGE_SELECT_R1
    elseif (random <= limR2)
        Debug.Trace(THIS_FILE + " -- selectNextRadiant() - Beast Extermination")
        return STAGE_SELECT_R2
    elseif (random <= limR3)
        Debug.Trace(THIS_FILE + " -- selectNextRadiant() - Werewolf Lair")
        return STAGE_SELECT_R3
    else
        Debug.Trace(THIS_FILE + " -- selectNextRadiant() - Witch Hunter")
        return STAGE_SELECT_R4
    endif
Endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input:  int nextR00Stage - next controller stage to be selected for the 
;           controller quest.
; Input: int questGiver - quest giver Actor number.
;
; Starts the right radiant quest, based on the current stage of the controller
; quest. It sets the child radiant quest in the right stage and objective, 
; and advances the controller quest to the stage based on the input stage 
; provided. This method is called on the dialog view.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function startsRadiantQuest(int nextR00Stage, int questGiverId)
    Debug.Trace(THIS_FILE + " -- startsRadiantQuest():nextR00Stage" + nextR00Stage + ", questGiverId" + questGiverId)
    ; Ensure at least on tasget of each quest is alive, so the radiant will not fail.
    ensureOneTargetAlive()
    ; Initialize radiant quest
    int currentStage = GetStage()
    if (currentStage == STAGE_SELECT_R1)
	    Debug.Trace(THIS_FILE + " -- START DSilHand_R01WolfHunt")
        CurrentRadiantQuest = 1
        DSilHand_R01WolfHunt.Reset()
        DSilHand_R01WolfHunt.Stop()
        DSilHand_R01WolfHunt.Start()
        DSilHand_R01WolfHunt.SetStage(0)      
        DSilHand_R01WolfHunt.SetActive(true)
		; currObj: -1
		; nextObj: 10
		; nextStage: 10
		DSilHand_Utils.advanceQuest(DSilHand_R01WolfHunt, -1, 10, 10, THIS_FILE)
	elseif (currentStage == STAGE_SELECT_R2)
		Debug.Trace(THIS_FILE + " -- START DSilHand_R02BeastExtermination")
        CurrentRadiantQuest = 2
        DSilHand_R02BeastExtermination.Reset()
        DSilHand_R02BeastExtermination.Stop()
        DSilHand_R02BeastExtermination.Start()
        DSilHand_R02BeastExtermination.SetStage(0)      
        DSilHand_R02BeastExtermination.SetActive(true)
		; currObj: -1
		; nextObj: 10
		; nextStage: 10
		DSilHand_Utils.advanceQuest(DSilHand_R02BeastExtermination, -1, 10, 10, THIS_FILE)	
	elseif (currentStage == STAGE_SELECT_R3)
		Debug.Trace(THIS_FILE + " -- START DSilHand_R03WerewolfLair")
        CurrentRadiantQuest = 3
        DSilHand_R03WerewolfLair.Reset()
        DSilHand_R03WerewolfLair.Stop()
        DSilHand_R03WerewolfLair.Start()
        DSilHand_R03WerewolfLair.SetStage(0)      
        DSilHand_R03WerewolfLair.SetActive(true)
		; currObj: -1
		; nextObj: 10
		; nextStage: 10
		DSilHand_Utils.advanceQuest(DSilHand_R03WerewolfLair, -1, 10, 10, THIS_FILE)	
	elseif (currentStage == STAGE_SELECT_R4)
		Debug.Trace(THIS_FILE + " -- START DSilHand_R04WitchHunter")
        CurrentRadiantQuest = 4
        DSilHand_R04WitchHunter.Reset()
        DSilHand_R04WitchHunter.Stop()
        DSilHand_R04WitchHunter.Start()
        DSilHand_R04WitchHunter.SetStage(0)      
        DSilHand_R04WitchHunter.SetActive(true)
		; currObj: -1
		; nextObj: 10
		; nextStage: 10
		DSilHand_Utils.advanceQuest(DSilHand_R04WitchHunter, -1, 10, 10, THIS_FILE)	
	else
		; Default radiant quest
		Debug.Trace(THIS_FILE + " **WARNING** INVALID CURRENT STAGE " + currentStage + ". SELECTING DEFAULT RADIANT QUEST", 1)
	    Debug.Trace(THIS_FILE + " -- START DSilHand_R01WolfHunt")
        CurrentRadiantQuest = 1
        DSilHand_R01Keyword.SendStoryEvent()
		DSilHand_R01WolfHunt.Start()
		; currObj: -1
		; nextObj: 10
		; nextStage: 10
		DSilHand_Utils.advanceQuest(DSilHand_R01WolfHunt, -1, 10, 10, THIS_FILE)		
    endif
    ; Advance controller stage
    Debug.Trace(THIS_FILE + " -- Next Controller Quest: " + nextR00Stage)
    SetStage(nextR00Stage)
    ; sets the quest giver number
    setsQuestGiver(questGiverId)
EndFunction 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
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
; Input: void
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; Reset the quest giver state.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function clearQuestGiver()
    QuestGiver = 0
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
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
; Input: void
;
; Calculate a random time to rowback.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
int Function calcTimeToRowback()
    ; INIT - DELETE - DEBUG
    Debug.Trace(THIS_FILE + "DEBUG: ONLY ONE DAY")
    ; INIT - DELETE - DEBUG
    return 24
    ; Debug.Trace(THIS_FILE + " -- calcTimeToRowback()") 
    ; ; Create alarm to row back the quest - from 5 to 10 days.
    ; int daysToRowBack = Utility.RandomInt(5, 10)
    ; Debug.Trace(THIS_FILE + "    * daysToRowBack: " + daysToRowBack)
    ; timeToRowback = daysToRowBack*24   
    ; Debug.Trace(THIS_FILE + "    * timeToRowback:" + timeToRowback) 
    ; return timeToRowback
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
        DSilHand_R01WolfHunt.SetObjectiveCompleted(OBJECTIVE_TALK_QUESTGIVER)
        DSilHand_R01WolfHunt.SetStage(STAGE_COMPLETE_RADIANT)
        DSilHand_R01WolfHunt.CompleteQuest()
    elseif (currRadQuest == RADIANT_QUEST_R02)
        ; Complete R02 Beast Extermination
        Debug.Trace(THIS_FILE + " -- completeRadiantQuest:DSilHand_R02BeastExtermination")
        DSilHand_R02BeastExtermination.SetObjectiveCompleted(OBJECTIVE_TALK_QUESTGIVER)
        DSilHand_R02BeastExtermination.SetStage(STAGE_COMPLETE_RADIANT)
        DSilHand_R02BeastExtermination.CompleteAllObjectives()
        ;DSilHand_R02BeastExtermination.CompleteQuest()
    elseif (currRadQuest == RADIANT_QUEST_R03)
        ; Complete R03 Werewolf Lair
        Debug.Trace(THIS_FILE + " -- completeRadiantQuest:DSilHand_R03WerewolfLair")
        DSilHand_R03WerewolfLair.SetObjectiveCompleted(OBJECTIVE_TALK_QUESTGIVER)
        DSilHand_R03WerewolfLair.SetStage(STAGE_COMPLETE_RADIANT)
        DSilHand_R03WerewolfLair.CompleteQuest()
    elseif (currRadQuest == RADIANT_QUEST_R04)
        ; Complete R04 Witch Hunter
        Debug.Trace(THIS_FILE + " -- completeRadiantQuest:DSilHand_R04WitchHunter")
        DSilHand_R04WitchHunter.SetObjectiveCompleted(OBJECTIVE_TALK_QUESTGIVER)
        DSilHand_R04WitchHunter.SetStage(STAGE_COMPLETE_RADIANT)
        DSilHand_R04WitchHunter.CompleteQuest()
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
; Input:  void
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
; Input: void
;
; Sets the quest giver state.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function setsQuestGiver(int questGiverId)
    if(questGiverId < 0)
        Debug.Trace(THIS_FILE + " **WARNING** setsQuestGiver() - Invalid quest giver id < 0. Setting to 1", 1)
        questGiverId = 1
    elseif(questGiverId > 2) 
        Debug.Trace(THIS_FILE + " **WARNING** setsQuestGiver() - Invalid quest giver id > 2. Setting to 2", 1)
        questGiverId = 2
    endif
    QuestGiver = questGiverId
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input:  void
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
; Input:  void
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
; Input:  void
;
; Ensure at least on of each targets are alive and enabled before the radiant
; quests starts.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function ensureOneTargetAlive()
    Debug.Trace(THIS_FILE + " -- ensureOneTargetAlive()")
Endfunction

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


