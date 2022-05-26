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
; CHILD QUESTS, KEYWORDS AND REFERENCES ALIASES
;

Quest Property DSilHand_R01WolfHunt  Auto  
{Reference to Wolf Hunt radiant quest.}

Quest Property DSilHand_R02BeastExtermination  Auto  
{Reference to Beast Extermination radiant quest.}

Quest Property DSilHand_R03WerewolfLair  Auto  
{Reference to Werewolf Lair radiant quest.}

Quest Property DSilHand_R04WitchHunter  Auto  
{Reference to Witch Hunter  radiant quest.}

Keyword Property DSilHand_R01Keyword  Auto  
{Keword to fire the radiant quest R01.}

Keyword Property DSilHand_R02Keyword  Auto  
{Keword to fire the radiant quest R02.}

Keyword Property DSilHand_R03Keyword  Auto  
{Keword to fire the radiant quest R03.}

Keyword Property DSilHand_R04Keyword  Auto  
{Keword to fire the radiant quest R04.}

ReferenceAlias Property R01Target  Auto  
{Sorted target for the radiant quest R01.}

ReferenceAlias Property R02Target  Auto  
{Sorted target for the radiant quest R02.}

ReferenceAlias Property R03Target  Auto  
{Sorted target for the radiant quest R03.}

ReferenceAlias Property R04Target  Auto  
{Sorted target for the radiant quest R04.}

ReferenceAlias Property R01ContractGiver  Auto  
{Contract giver for the rad quest R01}

ReferenceAlias Property R02ContractGiver  Auto  
{Contract giver for the rad quest R02}

ReferenceAlias Property R03ContractGiver  Auto  
{Contract giver for the rad quest R03}

ReferenceAlias Property R04ContractGiver  Auto  
{Contract giver for the rad quest R04}

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
; ACTORS PLACED AT THE WORLD
;

;
; ** WEREWOLFS ** 
; NPC Type, Type Count, Location, World Space, World Object Name, Script Variable Name, Location description
;

Actor Property R01Werewolf_BronzeWaterCave  Auto  
{Werewolf, 01, Bronze Water Cave, BronzeWaterCave, Tamriel, DSilHand_R01BeastBoss01Ref, Cave}

Actor Property R01Werewolf_TolvaldsCave01  Auto  
{Werewolf, 02, Tolvald's Cave, TolvaldsCave01, Tamriel, DSilHand_R01BeastBoss02Ref, Cave}

Actor Property R01Werewolf_RiversideShackExterior01  Auto  
{Werewolf, 03, Riverside Shack, RiversideShackExterior01, Tamriel, DSilHand_R01BeastBoss03Ref, Abandoned Hut}

Actor Property R01Werewolf_CrystaldriftCave01  Auto  
{Werewolf, 04, Crystaldrift Cave, CrystaldriftCave01, Interiors, DSilHand_R01BeastBoss04Ref, Cave}

;Actor Property R01Werewolf_Avanchnzel01  Auto  
;{Werewolf, 05, Avanchnzel, AvanchnzelExterior Avanchnzel01, Interiors??, DSilHand_R01BeastBoss05Ref, Dwammer Ruin}

Actor Property R01Werewolf_Darkshade01  Auto  
{Werewolf, 06, Darkshade, Darkshade01, Interiors, DSilHand_R01BeastBoss06Ref, Cave}

Actor Property R01Werewolf_GreywaterGrotto01  Auto  
{Werewolf, 07, Greywater Grotto, GreywaterGrotto01, Interiors, DSilHand_R01BeastBoss07Ref, Cave}

Actor Property R01Werewolf_EvergreenGroveExterior  Auto  
{Werewolf, 08, Evergreen Grove, EvergreenGroveExterior, Tamriel, DSilHand_R01BeastBoss08Ref, Wildness}

Actor Property R01Werewolf_GreenSpringHollowExterior01  Auto  
{Werewolf, 09, Greenspring Hollows, GreenSpringHollowExterior01, Tamriel, DSilHand_R01BeastBoss09Ref, Wildness}

Actor Property R01Werewolf_BroodCavern01  Auto  
{Werewolf, 10, Brood Cavern, BroodCavern01, Interions, DSilHand_R01BeastBoss10Ref, Cave}

Actor Property R01Werewolf_BrinewaterGrottoStart  Auto  
{Werewolf, 11, Brinewater Grotto, BrinewaterGrottoStart, BrubewaterGrottoWorld, DSilHand_R01BeastBoss11Ref, Cave}

Actor Property R01Werewolf_WindwardRuinsExterior  Auto  
{Werewolf, 12, Windward Ruins, WindwardRuinsExterior, Tamriel, DSilHand_R01BeastBoss12Ref, Ancient Ruin}

Actor Property R01Werewolf_RoadsideRuinsExterior  Auto  
{Werewolf, 13, Roadside Ruins, RoadsideRuinsExterior, Tamriel, DSilHand_R01BeastBoss13Ref, Ancient Ruin}

Actor Property R01Werewolf_HoneystrandGrove01  Auto  
{Werewolf, 14, Honeystrand Cave, HoneystrandGrove01, Interions, DSilHand_R01BeastBoss14Ref, Cave}

Actor Property R01Werewolf_PinefrostTowerExterior01  Auto  
{Werewolf, 15, Pinefrost Tower, PinefrostTowerExterior01, Tamriel, DSilHand_R01BeastBoss15Ref, Tower Ruin}

ObjectReference Property DSilHand_R01xMarker01  Auto  
{Enabler for R01}

ObjectReference Property DSilHand_R01xMarker02  Auto  
{Enabler for R01}

ObjectReference Property DSilHand_R01xMarker03  Auto  
{Enabler for R01}

ObjectReference Property DSilHand_R01xMarker04  Auto  
{Enabler for R01}

;ObjectReference Property DSilHand_R01xMarker05  Auto  
;{Enabler for R01}

ObjectReference Property DSilHand_R01xMarker06  Auto  
{Enabler for R01}

ObjectReference Property DSilHand_R01xMarker07  Auto  
{Enabler for R01}

ObjectReference Property DSilHand_R01xMarker08  Auto  
{Enabler for R01}

ObjectReference Property DSilHand_R01xMarker09  Auto  
{Enabler for R01}

ObjectReference Property DSilHand_R01xMarker10  Auto  
{Enabler for R01}

ObjectReference Property DSilHand_R01xMarker11  Auto  
{Enabler for R01}

ObjectReference Property DSilHand_R01xMarker12  Auto  
{Enabler for R01}

ObjectReference Property DSilHand_R01xMarker13  Auto  
{Enabler for R01}

ObjectReference Property DSilHand_R01xMarker14  Auto  
{Enabler for R01}

ObjectReference Property DSilHand_R01xMarker15  Auto  
{Enabler for R01}

; 
; ** BEASTS ** 
; NPC Type, Type Count, Location, World Space, World Object Name, Script Variable Name, Location description
;

Actor Property R02Beast_BronzeWaterCave  Auto  
{Beast, 01, Bronze Water Cave, BronzeWaterCave, Tamriel, DSilHand_R02BeastBoss01Ref, Cave}

Actor Property R02Beast_TolvaldsCave01  Auto  
{Beast, 02, Tolvald's Cave, TolvaldsCave01, Tamriel, DSilHand_R02BeastBoss02Ref, Cave}

Actor Property R02Beast_RiversideShackExterior01  Auto  
{Beast, 03, Riverside Shack, RiversideShackExterior01, Tamriel, DSilHand_R02BeastBoss03Ref, Abandoned Hut}

Actor Property R02Beast_CrystaldriftCave01  Auto  
{Beast, 04, Crystaldrift Cave, CrystaldriftCave01, Interiors, DSilHand_R02BeastBoss04Ref, Cave}

;Actor Property R02Beast_Avanchnzel01  Auto  
;{Beast, 05, Avanchnzel, Avanchnzel01, Interiors, DSilHand_R02BeastBoss05Ref, Dwammer Ruin}

Actor Property R02Beast_Darkshade01  Auto  
{Beast, 06, Darkshade, Darkshade01, Interiors, DSilHand_R02BeastBoss06Ref, Cave}

Actor Property R02Beast_GreywaterGrotto01  Auto  
{Beast, 07, Greywater Grotto, GreywaterGrotto01, Interiors, DSilHand_R02BeastBoss07Ref, Cave}

Actor Property R02Beast_EvergreenGroveExterior  Auto  
{Beast, 08, Evergreen Grove, EvergreenGroveExterior, Tamriel, DSilHand_R02BeastBoss08Ref, Wildness}

Actor Property R02Beast_GreenSpringHollowExterior01  Auto  
{Beast, 09, Greenspring Hollows, GreenSpringHollowExterior01, Tamriel, DSilHand_R02BeastBoss09Ref, Wildness}

Actor Property R02Beast_BroodCavern01  Auto  
{Beast, 10, Brood Cavern, BroodCavern01, Interions, DSilHand_R02BeastBoss10Ref, Cave}

Actor Property R02Beast_BrinewaterGrottoStart  Auto  
{Beast, 11, Brinewater Grotto, BrinewaterGrottoStart, BrubewaterGrottoWorld, DSilHand_R02BeastBoss11Ref, Cave}

Actor Property R02Beast_WindwardRuinsExterior  Auto  
{Beast, 12, Windward Ruins, WindwardRuinsExterior, Tamriel, DSilHand_R02BeastBoss12Ref, Ancient Ruin}

Actor Property R02Beast_RoadsideRuinsExterior  Auto  
{Beast, 13, Roadside Ruins, RoadsideRuinsExterior, Tamriel, DSilHand_R02BeastBoss13Ref, Ancient Ruin}

Actor Property R02Beast_HoneystrandGrove01  Auto  
{Beast, 14, Honeystrand Cave, HoneystrandGrove01, Interions, DSilHand_R02BeastBoss14Ref, Cave}

Actor Property R02Beast_PinefrostTowerExterior01  Auto  
{Beast, 15, Pinefrost Tower, PinefrostTowerExterior01, Tamriel, DSilHand_R02BeastBoss15Ref, Tower Ruin}

ObjectReference Property DSilHand_R02xMarker01  Auto  
{Enabler for R02}

ObjectReference Property DSilHand_R02xMarker02  Auto  
{Enabler for R02}

ObjectReference Property DSilHand_R02xMarker03  Auto  
{Enabler for R02}

ObjectReference Property DSilHand_R02xMarker04  Auto  
{Enabler for R02}

;ObjectReference Property DSilHand_R02xMarker05  Auto  
;{Enabler for R02}

ObjectReference Property DSilHand_R02xMarker06  Auto  
{Enabler for R02}

ObjectReference Property DSilHand_R02xMarker07  Auto  
{Enabler for R02}

ObjectReference Property DSilHand_R02xMarker08  Auto  
{Enabler for R02}

ObjectReference Property DSilHand_R02xMarker09  Auto  
{Enabler for R02}

ObjectReference Property DSilHand_R02xMarker10  Auto  
{Enabler for R02}

ObjectReference Property DSilHand_R02xMarker11  Auto  
{Enabler for R02}

ObjectReference Property DSilHand_R02xMarker12  Auto  
{Enabler for R02}

ObjectReference Property DSilHand_R02xMarker13  Auto  
{Enabler for R02}

ObjectReference Property DSilHand_R02xMarker14  Auto  
{Enabler for R02}

ObjectReference Property DSilHand_R02xMarker15  Auto  
{Enabler for R02}


;
; ** BANDIT BOSS **
; NPC Type, Type Count, Location, World Space, World Object Name, Script Variable Name, Location description
;

Actor Property R03BanditBoss  Auto  
{Single bandit boss to be enabled.}

;
; ** WITCHES **
; NPC Type, Type Count, Location, World Space, World Object Name, Script Variable Name, Location description
;

Actor Property R04Witch_AlchemistsShackExterior  Auto  
{Witch, 01, Alchemists Shack, AlchemistsShackExterior, Tamriel, DSilhand_R04GlenmorilWitch01Ref, Sourcery Place}

Actor Property R04Witch_WitchmistGroveExterior  Auto  
{Witch, 02, Witchmist Grove, WitchmistGroveExterior, Tamriel, DSilhand_R04GlenmorilWitch02Ref, Sourcery Place}

Actor Property R04Witch_DoomstoneFallForest01  Auto  
{Witch, 03, The Shadow Stone, DoomstoneFallForest01, Tamriel, DSilhand_R04GlenmorilWitch03Ref, Doomstone}

Actor Property R04Witch_DoomstoneTundra01  Auto  
{Witch, 04, The Ritual Stone, DoomstoneTundra01, Tamriel, DSilhand_R04GlenmorilWitch04Ref, Doomstone}

Actor Property R04Witch_SunderstoneGeorge01  Auto  
{Witch, 05, Sunderstone George, SunderstoneGeorge01, Interiors, DSilHand_R04GlenmorilWitch05Ref, Necomancer Dungeon}

;; Actor Property R04Witch_SwindlersDen01  Auto  
;; {Witch, 06, Swindler's Den, SwindlersDen01, Interiors, DSilHand_R04GlenmorilWitch06Ref, Bandit Camp}

;; Actor Property R04Witch_WolfskullCave01  Auto  
;; {Witch, 07, Wolfskull Cave, WolfskullCave01, Interiors, DSilHand_R04GlenmorilWitch07Ref, Necomancer Dungeon}

Actor Property R04Witch_KjenstagRuinsExterior  Auto  
{Witch, 08, Kjenstag Ruins, KjenstagRuinsExterior, Tamriel, DSilHand_R04GlenmorilWitch08Ref, Sourcery Place}

Actor Property R04Witch_HalldirsCairn01  Auto  
{Witch, 09, Halldirs Cairn, HalldirsCairn01, Interiors, DSilHand_R04GlenmorilWitch09Ref, Nordic Ruins}

;; Actor Property R04Witch_POIPineForest24  Auto  
;; {Witch, 10, Falkreath Hold, POIPineForest24, Tamriel, DSilHand_R04GlenmorilWitch10Ref, Sourcery Place}

Actor Property R04Witch_DoomstonePineForest01  Auto  
{Witch, 11, The Lady Stone, DoomstonePineForest01, Tamriel, DSilHand_R04GlenmorilWitch11Ref, Doomstone }

;; Actor Property R04Witch_IlinaltasDeep01  Auto  
;; {Witch, 12, Ilinalta's Deep, IlinaltasDeep01, Interiors, DSilHand_R04GlenmorilWitch12Ref, Necomancer Dungeon}

Actor Property R04Witch_BrittleshinPass01  Auto  
{Witch, 13, South Brittleshin Pass, BrittleshinPass01, Interiors, DSilHand_R04GlenmorilWitch13Ref, Necomancer Dungeon}

Actor Property R04Witch_BoulderfallCave01  Auto  
{Witch, 14, Boulderfall Cave, BoulderfallCave01, Interiors, DSilHand_R04GlenmorilWitch14Ref, Necomancer Dungeon}

Actor Property R04Witch_AnsilvundExterior  Auto  
{Witch, 15, Ansilvund, AnsilvundExterior, Tamriel, DSilHand_R04GlenmorilWitch15Ref, Necomancer Dungeon}

Actor Property R04Witch_FalkreathWatchtowerExterior  Auto  
{Witch, 16, Falkreath Watchtower, FalkreathWatchtowerExterior, Tamriel, DSilHand_R04GlenmorilWitch16Ref, Necomancer Dungeon}

Actor Property R04Witch_HobsFallCave01  Auto  
{Witch, 17, Hob's Fall Cave, HobsFallCave01, Interiors, DSilHand_R04GlenmorilWitch17Ref, Necomancer Dungeon}

Actor Property R04Witch_Morvunskar01  Auto  
{Witch, 18, Morvunskar, Morvunskar01, Interiors, DSilHand_R04GlenmorilWitch18Ref, Necomancer Dungeon}

ObjectReference Property DSilHand_R04xMarker01  Auto  
{Enabler for R04}

ObjectReference Property DSilHand_R04xMarker02  Auto  
{Enabler for R04}

ObjectReference Property DSilHand_R04xMarker03  Auto  
{Enabler for R04}

ObjectReference Property DSilHand_R04xMarker04  Auto  
{Enabler for R04}

ObjectReference Property DSilHand_R04xMarker05  Auto  
{Enabler for R04}

ObjectReference Property DSilHand_R04xMarker08  Auto  
{Enabler for R04}

ObjectReference Property DSilHand_R04xMarker09  Auto  
{Enabler for R04}

ObjectReference Property DSilHand_R04xMarker11  Auto  
{Enabler for R04}

ObjectReference Property DSilHand_R04xMarker13  Auto  
{Enabler for R04}

ObjectReference Property DSilHand_R04xMarker14  Auto  
{Enabler for R04}

ObjectReference Property DSilHand_R04xMarker15  Auto  
{Enabler for R04}

ObjectReference Property DSilHand_R04xMarker16  Auto  
{Enabler for R04}

ObjectReference Property DSilHand_R04xMarker17  Auto  
{Enabler for R04}

ObjectReference Property DSilHand_R04xMarker18  Auto  
{Enabler for R04}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Member variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Consts
;
String THIS_FILE = "(DSilHand_R00Helper.psc) "
; probability of each radiant. The sum MUST be 100
;int PROB_R1 = 25 ? 15
;int PROB_R2 = 25 ? 25
;int PROB_R3 = 30 ? 40
;int PROB_R4 = 20 ? 20
int PROB_R1 = 5
int PROB_R2 = 5
int PROB_R3 = 85
int PROB_R4 = 5
; stage of radiant selection
int STAGE_SELECT_RESET = 0
int STAGE_SELECT_R1 = 10
int STAGE_SELECT_R2 = 20
int STAGE_SELECT_R3 = 30
int STAGE_SELECT_R4 = 40
; controller helper stages
int STAGE_RADIANT_SETUP = 5
int STAGE_BAND_FOLLOWS = 72
int STAGE_CONTROLLER_SETUP_ALARMS = 110
; radiant stages/objectives
int STAGE_START_RADIANT = 10
int STAGE_COMPLETE_RADIANT = 30
int OBJECTIVE_TALK_QUESTGIVER = 20
; radiant quests IDs
int RADIANT_QUEST_ALL = 0
int RADIANT_QUEST_R01 = 1
int RADIANT_QUEST_R02 = 2
int RADIANT_QUEST_R03 = 3
int RADIANT_QUEST_R04 = 4
; Misc
int ENABLE_DELAY = 2
; DEBUG 
bool DEBUG_FLAG = true

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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Public Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; QUEST FLOW METHODS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Public Method
; Input:  void
; Output: void
;
; Randomly select next radiant quest to be played. It tries to start the
; the radiant quest, and retuns its ID (R01 returns 10, R02 returns 20, 
; R03 returns 30, R04 returns 40)  following this rule:
; 1. Wolf Hunt - 25% 
; 2. Beast Extermination - 25%
; 3. Werewolf Lair - 30%
; 4. Witch Hunter - 20%
; This also clears the quest giver -- just in case.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
int Function selectNextRadiantStage()
    Debug.Trace(THIS_FILE + " -- selectNextRadiantStage()")

    ; (1) Initialization
    ; just for debug
    int radQuestNextStage = STAGE_SELECT_RESET
    ; clears controller state(event flags) before starting the next quest
    restControllerState()
    ; 1. Wolf Hunt           - 25%  0:25     
    ; 2. Beast Extermination - 25%  26:50
    ; 3. Werewolf Lair       - 30%  51:80
    ; 4. Witch Hunter        - 20%  81:100
    int limR1 = PROB_R1
    int limR2 = limR1 + PROB_R2
    int limR3 = limR2 + PROB_R3

    ; (2) Select the first quest to start
    ; Get a random number between 0 and 100
    int random = Utility.RandomInt(0, 100)
    Debug.Trace(THIS_FILE + " -- selectNextRadiantStage() - RANDOM NUMBER PICKED = " + random)
    if (random <= limR1)
        Debug.Trace(THIS_FILE + " -- selectNextRadiantStage() - Wolf Hunt")
        radQuestNextStage = STAGE_SELECT_R1
    elseif (random <= limR2)
        Debug.Trace(THIS_FILE + " -- selectNextRadiantStage() - Beast Extermination")
        radQuestNextStage = STAGE_SELECT_R2
    elseif (random <= limR3)
        Debug.Trace(THIS_FILE + " -- selectNextRadiantStage() - Werewolf Lair")
        radQuestNextStage = STAGE_SELECT_R3
    else
        Debug.Trace(THIS_FILE + " -- selectNextRadiantStage() - Witch Hunter")
        radQuestNextStage = STAGE_SELECT_R4
    endif

    ;; (3) Enable all quest targets, so the quest should not fail to start
    enableAllTartgets()

    ; (4) Tries to start a radiant quest, and stores the ID on radQuestNextStage
    ; Tries first the randomly selected quest. It it fails, it will trie the others,
    ; one after another. If all fail, it will execute the RESET procedure and try again 
    ; later.  It will try R01, R02, R04, R03, and RESET in that order.
    bool hasQuestStarted = startRadQuestStoryManager(radQuestNextStage)
    if(hasQuestStarted == false)
        Debug.Trace(THIS_FILE + " **WARNING** COULD NOT START  RADQUEST " + radQuestNextStage)
        radQuestNextStage = STAGE_SELECT_R1
        hasQuestStarted = startRadQuestStoryManager(radQuestNextStage)
    endIf
    if(hasQuestStarted == false)
        Debug.Trace(THIS_FILE + " **WARNING** COULD NOT START  RADQUEST " + radQuestNextStage)
        radQuestNextStage = STAGE_SELECT_R2
        hasQuestStarted = startRadQuestStoryManager(radQuestNextStage)
    endIf
    if(hasQuestStarted == false)
        Debug.Trace(THIS_FILE + " **WARNING** COULD NOT START  RADQUEST " + radQuestNextStage)
        radQuestNextStage = STAGE_SELECT_R4
        hasQuestStarted = startRadQuestStoryManager(radQuestNextStage)
    endIf    
    if(hasQuestStarted == false)
        Debug.Trace(THIS_FILE + " **WARNING** COULD NOT START  RADQUEST " + radQuestNextStage)
        radQuestNextStage = STAGE_SELECT_R3
        hasQuestStarted = startRadQuestStoryManager(radQuestNextStage)
    endIf      
    if(hasQuestStarted == false)
        Debug.Trace(THIS_FILE + " **WARNING** COULD NOT START  RADQUEST " + radQuestNextStage)
        radQuestNextStage = STAGE_SELECT_RESET
        startRadQuestStoryManager(radQuestNextStage)
    endIf

    ; (5) The targets not used to start the quest will be disabled again
    disableAllTargetsExcept(getRadiantQuestTarget())

    return radQuestNextStage
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
; In fact, this methods does not initialize the radiant quest, but runs 
; Start()(inside the quest script), the it will be visible for the player.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function startsRadiantQuest(int nextR00Stage, int questGiverId)
    Debug.Trace(THIS_FILE + " -- startsRadiantQuest() nextR00Stage:<" + nextR00Stage + ">, questGiverId:<" + questGiverId + ">")

    ; (1) Force QuestGiver id to be set on the controller quest 
    ; so the radiant quest will be populated with the correct quest giver.
    ; sets the quest giver number
    setsQuestGiverId(questGiverId)
    ObjectReference questGiverObj = getsQuestGiverObject()
    ; DEBUG DELETE 
    Debug.Trace("BEFORE QuestGiverRefAlias.GetActorRef():<" + QuestGiverRefAlias.GetActorRef() + ">")   
    ; clears and set the quest giver into the controller reference alias.
    QuestGiverRefAlias.Clear()
    QuestGiverRefAlias.ForceRefTo(questGiverObj)
    Debug.Trace(THIS_FILE + "  * QuestGiverRefAlias.GetActorRef():<" + QuestGiverRefAlias.GetActorRef() + ">")
    ; DEBUG DELETE 
    Debug.Trace("AFTER QuestGiverRefAlias.GetActorRef():<" + QuestGiverRefAlias.GetActorRef() + ">")

    ; (2) Initialize rigth radiant quest
    bool questStartRetVal = false
    int currentStage = GetStage()
    if (currentStage == STAGE_SELECT_R1)
	    Debug.Trace(THIS_FILE + " -- START DSilHand_R01WolfHunt")
        questStartRetVal = forceSetStage(DSilHand_R01WolfHunt, 10)
        R01ContractGiver.Clear()
        R01ContractGiver.ForceRefTo(questGiverObj)
	elseif (currentStage == STAGE_SELECT_R2)
		Debug.Trace(THIS_FILE + " -- START DSilHand_R02BeastExtermination")
        questStartRetVal = forceSetStage(DSilHand_R02BeastExtermination, 10)
        R02ContractGiver.Clear()
        R03ContractGiver.ForceRefTo(questGiverObj)
	elseif (currentStage == STAGE_SELECT_R3)
		Debug.Trace(THIS_FILE + " -- START DSilHand_R03WerewolfLair")
        questStartRetVal = forceSetStage(DSilHand_R03WerewolfLair, 10)
        R03ContractGiver.Clear()
        R03ContractGiver.ForceRefTo(questGiverObj)
	elseif (currentStage == STAGE_SELECT_R4)
		Debug.Trace(THIS_FILE + " -- START DSilHand_R04WitchHunter")
        questStartRetVal = forceSetStage(DSilHand_R04WitchHunter, 10)
        R04ContractGiver.Clear()
        R04ContractGiver.ForceRefTo(questGiverObj)
	else
		; Default radiant quest
		Debug.Trace(THIS_FILE + " **WARNING** INVALID CURRENT STAGE " + currentStage + ". SELECTING DEFAULT RADIANT QUEST", 1)
	    Debug.Trace(THIS_FILE + " -- START DSilHand_R01WolfHunt")
        questStartRetVal = forceSetStage(DSilHand_R01WolfHunt, 10)
        R01ContractGiver.Clear()
        R01ContractGiver.ForceRefTo(questGiverObj)
    endif

    ; (3) Advance controller stage
    Debug.Trace(THIS_FILE + " -- Next Controller Quest: " + nextR00Stage)
    SetStage(nextR00Stage)

    ; (4) Safenet in case the radiant quest fail to properly initialize
    completRadQuestIfFailed(questStartRetVal, currentStage) 
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
    int currRadQuest = getCurrentRadiantQuest()
    ; Create alarm of one day
    EnableSetGold = true
    ; Reward: 500 + PlayerLevel*10
    if (currRadQuest == RADIANT_QUEST_R01 || currRadQuest == RADIANT_QUEST_R02 || currRadQuest == RADIANT_QUEST_R04)
        GoldReward = 500 + Game.GetPlayer().GetLevel()*10
    elseif (currRadQuest == RADIANT_QUEST_R03)
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

; CONTROLLER STATE'S GETTERS AND SETTERS

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Public Method
; Input: void
; Output: quest giver Actor object
;
; Returns the right Actor (as a ObjectReference object) of the current quest 
; giver.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
; Input: int radQuestNumber - the number of the radiant quest (1 for R01, 2
;        for R02, 3 for R03, 4 for R04)
; Output: Actor npc - the npc set as target for a given radiant quest.
;
; This method returns the actor set as target for the current radiant quest 
; being executed. This method reads the ReferenceAlias of the target to be 
; killed of a given radiant quest, cast it to an Actor object, and returns 
; the object. If the radiant quest is not initialized, or the target alias 
; is not filled, it will return a null objet (None).
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Actor Function getRadiantQuestTarget()
    int radQuestNumber = getCurrentRadiantQuest()
    Debug.Trace(THIS_FILE + " -- getRadiantQuestTarget() radQuestNumber:" + radQuestNumber)

    Actor targetActor
    if (radQuestNumber == RADIANT_QUEST_R01)
        targetActor = R01Target.GetActorReference()
    elseif (radQuestNumber == RADIANT_QUEST_R02)
        targetActor = R02Target.GetActorReference()
    elseif(radQuestNumber == RADIANT_QUEST_R03)
        targetActor = R03Target.GetActorReference()
    elseif(radQuestNumber == RADIANT_QUEST_R04)
        targetActor = R04Target.GetActorReference()
    else ; returns target from RADIANT_QUEST_R01 as default
        targetActor = R01Target.GetActorReference()
    endif
    Debug.Trace(THIS_FILE + " targetActor:" + targetActor)
    return targetActor
EndFunction

; NPC'S ACTIONS AND BEHAVIOUR

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Public Method
; Input:  void
; Output: void
;
; Outputs information about the about the quest in the log file.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function dumpDSilHandR00Controller()
    if (DEBUG_FLAG == 1)
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
        Debug.Trace(THIS_FILE + " * CurrentRadiantQuest:" + getCurrentRadiantQuest());
        Debug.Trace(THIS_FILE + " * RowbackQuest:" + RowbackQuest);
        Debug.Trace(THIS_FILE + " * EnableSetGold:" + EnableSetGold);
        Debug.Trace(THIS_FILE + " * GoldReward:" + GoldReward);
        Debug.Trace(THIS_FILE + " ------------------------------------------------------------")        
    endif
EndFunction

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
;; Private Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Getters and Setters
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Private Method
; Input: void
; Output: void 
;
; Sets the quest giver state.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function setsQuestGiverId(int questGiverId)
    if(questGiverId <= 0)
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
; Input: void
; Output: void
;
; Clear the state variables: RowbackQuest, EnableSetGold, GoldReward and 
; QuestGiver
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function restControllerState()
    RowbackQuest = false    ; disable rowback flag
    EnableSetGold = false   ; disable gold update flag
    GoldReward = 0          ; clears gold reward
	QuestGiver = 0
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
; Input:  int radQuestId - current radiant quest it to be set.
; Output: void 
;
; Return the number of the current quest being executed.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function setCurrentRadiantQuest(int radQuestId)
    Debug.Trace(THIS_FILE + " -- setCurrentRadiantQuest() -> radQuestId:" + radQuestId)
    if (radQuestId < 0)
        Debug.Trace(THIS_FILE + " **WARNING** radQuestId < 0. Setting to 0", 1)
        CurrentRadiantQuest = 0
    endif
    if (radQuestId > 4)
        Debug.Trace(THIS_FILE + " **WARNING** radQuestId > 4. Setting to 4", 1)
        CurrentRadiantQuest = 4
    endif
    CurrentRadiantQuest = radQuestId
EndFunction

;
; Helper Methods (avoid repeated code and make the code more readable)
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Private Method
; Input: void
; Output: void
;
; Calculate a random time to rowback.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
int Function calcTimeToRowback()
    if(DEBUG_FLAG == true)
        ; INIT - DELETE - DEBUG
        Debug.Trace(THIS_FILE + "DEBUG: ONLY ONE HOUR")
        return 1
    else
        int timeToRowback = 0
        Debug.Trace(THIS_FILE + " -- calcTimeToRowback()") 
        ; Create alarm to row back the quest - from 5 to 10 days.
        int daysToRowBack = Utility.RandomInt(5, 10)
        Debug.Trace(THIS_FILE + "    * daysToRowBack: " + daysToRowBack)
        timeToRowback = daysToRowBack*24   
        Debug.Trace(THIS_FILE + "    * timeToRowback:" + timeToRowback) 
        return timeToRowback
    endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Private Method
; Input:  Actor npc - actor to be enabled.
; Input:  ObjectReference xmarkerNpc - enable parent object
; Output: void 
;
; Helper method to enable and ressurect the radiant quest targets.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function enableAndRessurect(Actor npc, ObjectReference xmarkerNpc)
    if(xmarkerNpc != None)
        if (xmarkerNpc.IsEnabled() == false)
            xmarkerNpc.Enable()
        endif
    endif  
    if(npc != None)
        if (npc.IsEnabled() == false)
            npc.Enable()
        endif
        if (npc.IsDead() == true)
            npc.Resurrect()
        endif      
    endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Private Method
; Input:  ObjectReference xmarkerNpc - enable parent object
; Output: void
; 
; Helper method to disable the radiant quest targets.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function disableHelper(ObjectReference xmarkerNpc)
    if(xmarkerNpc != None)
        xmarkerNpc.Disable()
    endif
EndFunction

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
    radQuest.CompleteAllObjectives()
    ; radQuest.SetObjectiveCompleted(OBJECTIVE_TALK_QUESTGIVER)
    bool retVal = radQuest.SetStage(STAGE_COMPLETE_RADIANT)
    radQuest.CompleteQuest()
    radQuest.Stop()
    return retVal
Endfunction

;; TEST >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;; TENTAR RESOLVER O PROBLEMA DE QUANDO A QUEST FALHA AO SE INICIALIZAR
;; TENTAR RESETAR E STARTAR A QUEST 50X ANTES DE DESISTIR
;; 

bool Function restartQuestHelper(Quest questObj, int questRadStage)
    ; complete objectives
    questObj.CompleteAllObjectives()
	; re-initializes
	questObj.Reset()
	if startRadQuestStoryManager(questRadStage) == false
        Debug.Trace(THIS_FILE + "**ERROR** COULD NOT INITIALIZE RADIANT QUEST " + questRadStage + " USING THE STORY MANAGER.", 2)
		return false
	endif
    Utility.Wait(0.1)
	ObjectReference questGiverObj = getsQuestGiverObject()
    if (questGiverObj == None)
        Debug.Trace(THIS_FILE + "**ERROR** COULD NOT RETRIVE AN VALID ACTOR TARGET FROM RADIANT QUEST " + questRadStage, 2)
        return false
    endif
	if (questRadStage == STAGE_SELECT_R1)
	    R01ContractGiver.Clear()
        R01ContractGiver.ForceRefTo(questGiverObj)
	elseif (questRadStage == STAGE_SELECT_R2)
	    R02ContractGiver.Clear()
        R02ContractGiver.ForceRefTo(questGiverObj)	
	elseif (questRadStage == STAGE_SELECT_R3)
	    R03ContractGiver.Clear()
        R03ContractGiver.ForceRefTo(questGiverObj)	
	elseif (questRadStage == STAGE_SELECT_R4)
	    R04ContractGiver.Clear()
        R04ContractGiver.ForceRefTo(questGiverObj)	
	else
		Debug.Trace(THIS_FILE + "**ERROR** INVALID STAGE_SELECT VALUE " + questRadStage, 2)
		return false
	endif
    Utility.Wait(5.0)
    if (forceSetStage(questObj, STAGE_START_RADIANT) == false)
        Debug.Trace(THIS_FILE + "**ERROR** CANNOT ADVANCE QUEST STAGE " + questRadStage, 2)
        return false
    endif
	return true
EndFunction


bool Function  restartQuest(int questRadStage)
	bool questStartRetVal = false 
	int i = 0
	while (i < 15)
		; try to restart the quest
		if (questRadStage == STAGE_SELECT_R1)
			questStartRetVal = restartQuestHelper(DSilHand_R01WolfHunt, STAGE_SELECT_R1)
		elseif (questRadStage == STAGE_SELECT_R2)
			questStartRetVal = restartQuestHelper(DSilHand_R02BeastExtermination, STAGE_SELECT_R2)
		elseif (questRadStage == STAGE_SELECT_R3)
			questStartRetVal = restartQuestHelper(DSilHand_R03WerewolfLair, STAGE_SELECT_R3)
		elseif (questRadStage == STAGE_SELECT_R4)
			questStartRetVal = restartQuestHelper(DSilHand_R04WitchHunter, STAGE_SELECT_R4)
		else
			Debug.Trace(THIS_FILE + "**ERROR** INVALID STAGE_SELECT VALUE " + questRadStage, 2)
			return false
		endif	
        if (questStartRetVal == true)
            Debug.Trace(THIS_FILE + "**SUCCESS** RESTARTED QUEST " + questRadStage)
            return true
        endif
		; Wait and try again
		Utility.Wait(0.2)
		i += 1
	endWhile
	return false
EndFunction



;; TEST <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

;
; Private Game Modifiers and Actions (actions that are not going to be applied alone)
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Private Method
; Input: void
; Output: void
;
; Call it after the radiant quest has been started. Basically it is a safety 
; net to prevent the radiant quest system to be stucked if some error ocurred
; after the quest was started. If the target is not alive, enabled or set 
; as rerefencealias just after objective 10 is set, the quest will be locked
; for ever and will never be completed. Since this SHOULD never happen,
; It will show a message box telling that a error has ocorred, and the quest
; will be completed. Another quests can be started later normally, and the 
; player will receive the reward anyway.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function completRadQuestIfFailed(bool questStartResult=true, int questSelectStage)
    Debug.Trace(THIS_FILE + "#############################################################################")
    Debug.Trace(THIS_FILE + "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
    Debug.Trace(THIS_FILE + " -- completRadQuestIfFailed()")
    Actor target = getRadiantQuestTarget()
    Debug.Trace(THIS_FILE + " -- completRadQuestIfFailed() target:" + target + ", questStartResult:" + questStartResult)
    if(target == None || questStartResult == false)
        Debug.Trace(THIS_FILE + " **WARNING** completRadQuestIfFailed() - target is None  in the quest " + CurrentRadiantQuest, 1)
        Debug.Trace(THIS_FILE + " try to restart radiant quest") 
        bool start = restartQuest(questSelectStage)
        if (start == true)
            Debug.Trace(THIS_FILE + "QUEST RESTARTED SUCCESSFULLY")
            return
        endif 
        ; Show a message to the player, since it is a error
        String errorMessagePopup = "*ERROR* An error ocurred while trying to start the quest. The quest will be completed. Contact the Mod developer to fix this issue. Sorry for the inconvenience."
        Debug.Trace(THIS_FILE + errorMessagePopup, 2)
        Debug.MessageBox(errorMessagePopup)
        ; complete radiant
        completeRadiantQuest()
        ; reset controller
        SetStage(STAGE_CONTROLLER_SETUP_ALARMS)
    endif
Endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Public Method
; Input: void
; Output: void
;
; Enables and ressurect all the targes for all the radiant quests (R01, R02, 
; R03 and R04).
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function enableAllTartgets(int questId=0)
    Debug.Trace("enableAllTartgets() questId:" + questId)
    ;
    ; R01 Targets
    ;    
    if (questId == RADIANT_QUEST_R01 || questId == 0)
        Debug.Trace(THIS_FILE + " -- Enabling targetes for quest R01")        
        Debug.Trace(THIS_FILE + " * ENABLE Werewolf, 01, Bronze Water Cave")
        enableAndRessurect(R01Werewolf_BronzeWaterCave, DSilHand_R01xMarker01)
        Debug.Trace(THIS_FILE + " * ENABLE Werewolf, 02, Tolvald's Cave")
        enableAndRessurect(R01Werewolf_TolvaldsCave01, DSilHand_R01xMarker02)
        Debug.Trace(THIS_FILE + " * ENABLE Werewolf, 03, Riverside Shack")
        enableAndRessurect(R01Werewolf_RiversideShackExterior01, DSilHand_R01xMarker03)
        Debug.Trace(THIS_FILE + " * ENABLE Werewolf, 04, Crystaldrift Cave")
        enableAndRessurect(R01Werewolf_CrystaldriftCave01, DSilHand_R01xMarker04)
        ;Debug.Trace(THIS_FILE + " * ENABLE Werewolf, 05, Avanchnzel")
        ;enableAndRessurect(R01Werewolf_Avanchnzel01, DSilHand_R01xMarker05)
        Debug.Trace(THIS_FILE + " * ENABLE Werewolf, 06, Darkshade")
        enableAndRessurect(R01Werewolf_Darkshade01, DSilHand_R01xMarker06)
        Debug.Trace(THIS_FILE + " * ENABLE Werewolf, 07, Greywater Grotto")
        enableAndRessurect(R01Werewolf_GreywaterGrotto01, DSilHand_R01xMarker07)
        Debug.Trace(THIS_FILE + " * ENABLE Werewolf, 08, Evergreen Grove")
        enableAndRessurect(R01Werewolf_EvergreenGroveExterior, DSilHand_R01xMarker08)
        Debug.Trace(THIS_FILE + " * ENABLE Werewolf, 09, Greenspring Hollows")
        enableAndRessurect(R01Werewolf_GreenSpringHollowExterior01, DSilHand_R01xMarker09)
        Debug.Trace(THIS_FILE + " * ENABLE Werewolf, 10, Brood Cavern")
        enableAndRessurect(R01Werewolf_BroodCavern01, DSilHand_R01xMarker10)
        Debug.Trace(THIS_FILE + " * ENABLE Werewolf, 11, Brinewater Grotto")
        enableAndRessurect(R01Werewolf_BrinewaterGrottoStart, DSilHand_R01xMarker11)
        Debug.Trace(THIS_FILE + " * ENABLE Werewolf, 12, Windward Ruins")
        enableAndRessurect(R01Werewolf_WindwardRuinsExterior, DSilHand_R01xMarker12)
        Debug.Trace(THIS_FILE + " * ENABLE Werewolf, 13, Roadside Ruins")
        enableAndRessurect(R01Werewolf_RoadsideRuinsExterior, DSilHand_R01xMarker13)
        Debug.Trace(THIS_FILE + " * ENABLE Werewolf, 14, Honeystrand Cave")
        enableAndRessurect(R01Werewolf_HoneystrandGrove01, DSilHand_R01xMarker14)
        Debug.Trace(THIS_FILE + " * ENABLE Werewolf, 15, Pinefrost Tower")
        enableAndRessurect(R01Werewolf_PinefrostTowerExterior01, DSilHand_R01xMarker15)        
    endif
    ;
    ; R02 Targets
    ;    
    if (questId == RADIANT_QUEST_R02 || questId == 0)
        Debug.Trace(THIS_FILE + " -- Enabling targetes for quest R02")        
        Debug.Trace(THIS_FILE + " * ENABLE Beast, 01, Bronze Water Cave")
        enableAndRessurect(R02Beast_BronzeWaterCave, DSilHand_R02xMarker01)
        Debug.Trace(THIS_FILE + " * ENABLE Beast, 02, Tolvald's Cave")
        enableAndRessurect(R02Beast_TolvaldsCave01, DSilHand_R02xMarker02)
        Debug.Trace(THIS_FILE + " * ENABLE Beast, 03, Riverside Shack")
        enableAndRessurect(R02Beast_RiversideShackExterior01, DSilHand_R02xMarker03)
        Debug.Trace(THIS_FILE + " * ENABLE Beast, 04, Crystaldrift Cave")
        enableAndRessurect(R02Beast_CrystaldriftCave01, DSilHand_R02xMarker04)
        ;Debug.Trace(THIS_FILE + " * ENABLE Beast, 05, Avanchnzel")
        ;enableAndRessurect(R02Beast_Avanchnzel01, DSilHand_R02xMarker05)
        Debug.Trace(THIS_FILE + " * ENABLE Beast, 06, Darkshade")
        enableAndRessurect(R02Beast_Darkshade01, DSilHand_R02xMarker06)
        Debug.Trace(THIS_FILE + " * ENABLE Beast, 07, Greywater Grotto")
        enableAndRessurect(R02Beast_GreywaterGrotto01, DSilHand_R02xMarker07)
        Debug.Trace(THIS_FILE + " * ENABLE Beast, 08, Evergreen Grove")
        enableAndRessurect(R02Beast_EvergreenGroveExterior, DSilHand_R02xMarker08)
        Debug.Trace(THIS_FILE + " * ENABLE Beast, 09, Greenspring Hollows")
        enableAndRessurect(R02Beast_GreenSpringHollowExterior01, DSilHand_R02xMarker09)
        Debug.Trace(THIS_FILE + " * ENABLE Beast, 10, Brood Cavern")
        enableAndRessurect(R02Beast_BroodCavern01, DSilHand_R02xMarker10)
        Debug.Trace(THIS_FILE + " * ENABLE Beast, 11, Brinewater Grotto")
        enableAndRessurect(R02Beast_BrinewaterGrottoStart, DSilHand_R02xMarker11)
        Debug.Trace(THIS_FILE + " * ENABLE Beast, 12, Windward Ruins")
        enableAndRessurect(R02Beast_WindwardRuinsExterior, DSilHand_R02xMarker12)
        Debug.Trace(THIS_FILE + " * ENABLE Beast, 13, Roadside Ruins")
        enableAndRessurect(R02Beast_RoadsideRuinsExterior, DSilHand_R02xMarker13)
        Debug.Trace(THIS_FILE + " * ENABLE Beast, 14, Honeystrand Cave")
        enableAndRessurect(R02Beast_HoneystrandGrove01, DSilHand_R02xMarker14)
        Debug.Trace(THIS_FILE + " * ENABLE Beast, 15, Pinefrost Tower")
        enableAndRessurect(R02Beast_PinefrostTowerExterior01, DSilHand_R02xMarker15)
    endif
    ;
    ; R03 Targets
    ;    
    if(questId == RADIANT_QUEST_R03 || questId == 0)
        Debug.Trace(THIS_FILE + " -- No target to enable for quest R03")
    endif
    ;
    ; R04 Targets
    ;    
    if (questId == RADIANT_QUEST_R04 || questId == 0)
        Debug.Trace(THIS_FILE + " -- Enabling targetes for quest R04")
        Debug.Trace(THIS_FILE + " * ENABLE Witch, 01, Alchemists Shack")
        enableAndRessurect(R04Witch_AlchemistsShackExterior, DSilHand_R04xMarker01)
        Debug.Trace(THIS_FILE + " * ENABLE Witch, 02, Witchmist Grove")
        enableAndRessurect(R04Witch_WitchmistGroveExterior, DSilHand_R04xMarker02)
        Debug.Trace(THIS_FILE + " * ENABLE Witch, 03, The Shadow Stone")
        enableAndRessurect(R04Witch_DoomstoneFallForest01, DSilHand_R04xMarker03)
        Debug.Trace(THIS_FILE + " * ENABLE Witch, 04, The Ritual Stone")
        enableAndRessurect(R04Witch_DoomstoneTundra01, DSilHand_R04xMarker04)
        Debug.Trace(THIS_FILE + " * ENABLE Witch, 05, Sunderstone George")    
        enableAndRessurect(R04Witch_SunderstoneGeorge01, DSilHand_R04xMarker05)
        ;; Debug.Trace(THIS_FILE + " * ENABLE Witch, 06, Swindler's Den")    
        ;; enableAndRessurect(R04Witch_SwindlersDen01, DSilHand_R04xMarker06)
        ;; Debug.Trace(THIS_FILE + " * ENABLE Witch, 07, Wolfskull Cave")    
        ;; enableAndRessurect(R04Witch_WolfskullCave01, DSilHand_R04xMarker07)
        Debug.Trace(THIS_FILE + " * ENABLE Witch, 08, Kjenstag Ruins")    
        enableAndRessurect(R04Witch_KjenstagRuinsExterior, DSilHand_R04xMarker08)
        Debug.Trace(THIS_FILE + " * ENABLE Witch, 09, Halldirs Cairn")    
        enableAndRessurect(R04Witch_HalldirsCairn01, DSilHand_R04xMarker09)
        ;; Debug.Trace(THIS_FILE + " * ENABLE Witch, 10, Falkreath Hold")    
        ;; enableAndRessurect(R04Witch_POIPineForest24, DSilHand_R04xMarker10)
        Debug.Trace(THIS_FILE + " * ENABLE 11, The Lady Stone")    
        enableAndRessurect(R04Witch_DoomstonePineForest01, DSilHand_R04xMarker11)
        ;; Debug.Trace(THIS_FILE + " * ENABLE Witch, 12, Ilinalta's Deep")    
        ;; enableAndRessurect(R04Witch_IlinaltasDeep01, DSilHand_R04xMarker12)
        Debug.Trace(THIS_FILE + " * ENABLE Witch, 13, South Brittleshin")    
        enableAndRessurect(R04Witch_BrittleshinPass01, DSilHand_R04xMarker13)
        Debug.Trace(THIS_FILE + " * ENABLE Witch, 14, Boulderfall Cave")    
        enableAndRessurect(R04Witch_BoulderfallCave01, DSilHand_R04xMarker14)
        Debug.Trace(THIS_FILE + " * ENABLE Witch, 15, Ansilvund")    
        enableAndRessurect(R04Witch_AnsilvundExterior, DSilHand_R04xMarker15)
        Debug.Trace(THIS_FILE + " * ENABLE Witch, 16, Falkreath Watchtower")        
        enableAndRessurect(R04Witch_FalkreathWatchtowerExterior, DSilHand_R04xMarker16)
        Debug.Trace(THIS_FILE + " * ENABLE Witch, 17, Hob's Fall Cave")    
        enableAndRessurect(R04Witch_HobsFallCave01, DSilHand_R04xMarker17)
        Debug.Trace(THIS_FILE + " * ENABLE Witch, 18, Morvunskar")    
        enableAndRessurect(R04Witch_Morvunskar01, DSilHand_R04xMarker18)
    endif        
    ; 
    ; Wait a small time before startin the quest
    ; 
    Utility.Wait(ENABLE_DELAY)
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Private Method
; Input: Actor target - actor to not be disables.
; Output: void
;
; Disable all the targets for all the radiant quests (R01, R02, R03 and R04) 
; except the actor passed as parameter. If None is passed as parameter, all
; the targets will be disabled.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function disableAllTargetsExcept(Actor target, int questId=0)
    Debug.Trace("disableAllTargetsExcept(){" + target + "}")
    Debug.Trace(THIS_FILE + " -- disableAllTargetsExcept() Actor:" + target)
    ;
    ; R01 Targets
    ;
    if (questId == RADIANT_QUEST_R01 || questId == 0)
        ; 01 - Bronze Water Cave   
        if(target != R01Werewolf_BronzeWaterCave)
            Debug.Trace(THIS_FILE + " * DISABLE target R01 01: R01Werewolf_BronzeWaterCave")
            disableHelper(DSilHand_R01xMarker01)
        endif
        ; 02 - Tolvald's Cave 
        if(target != R01Werewolf_TolvaldsCave01)
            Debug.Trace(THIS_FILE + " * DISABLE target R01 02: R01Werewolf_TolvaldsCave01")
            disableHelper(DSilHand_R01xMarker02)
        endif
        ; 03 - Riverside Shack 
        if(target != R01Werewolf_RiversideShackExterior01)
            Debug.Trace(THIS_FILE + " * DISABLE target R01 03: R01Werewolf_RiversideShackExterior01")
            disableHelper(DSilHand_R01xMarker03)
        endif
        ; 04 - Crystaldrift Cave 	
        if(target != R01Werewolf_CrystaldriftCave01)
            Debug.Trace(THIS_FILE + " * DISABLE target R01 04: R01Werewolf_CrystaldriftCave01")
            disableHelper(DSilHand_R01xMarker04)
        endif
        ;; 05 - Avanchnzel 
        ;if(target != R01Werewolf_Avanchnzel01)
        ;    Debug.Trace(THIS_FILE + " * DISABLE target R01 05: R01Werewolf_Avanchnzel01")
        ;    disableHelper(DSilHand_R01xMarker05)
        ;endif
        ; 06 - Darkshade
        if(target != R01Werewolf_Darkshade01)
            Debug.Trace(THIS_FILE + " * DISABLE target R01 06: R01Werewolf_Darkshade01")
            disableHelper(DSilHand_R01xMarker06)
        endif
        ; 07 - Greywater Grotto 	
        if(target != R01Werewolf_GreywaterGrotto01)
            Debug.Trace(THIS_FILE + " * DISABLE target R01 07: R01Werewolf_GreywaterGrotto01")
            disableHelper(DSilHand_R01xMarker07)
        endif
        ; 08 - Evergreen Grove 
        if(target != R01Werewolf_EvergreenGroveExterior)
            Debug.Trace(THIS_FILE + " * DISABLE target R01 08: R01Werewolf_EvergreenGroveExterior")
            disableHelper(DSilHand_R01xMarker08)
        endif
        ; 09 - Greenspring Hollows 
        if(target != R01Werewolf_GreenSpringHollowExterior01)
            Debug.Trace(THIS_FILE + " * DISABLE target R01 09: R01Werewolf_GreenSpringHollowExterior01")
            disableHelper(DSilHand_R01xMarker09)
        endif
        ; 10 - Brood Cavern 	
        if(target != R01Werewolf_BroodCavern01)
            Debug.Trace(THIS_FILE + " * DISABLE target R01 10: R01Werewolf_BroodCavern01")
            disableHelper(DSilHand_R01xMarker10)
        endif
        ; 11 - Brinewater Grotto  
        if(target != R01Werewolf_BrinewaterGrottoStart)
            Debug.Trace(THIS_FILE + " * DISABLE target R01 11: R01Werewolf_BrinewaterGrottoStart")
            disableHelper(DSilHand_R01xMarker11)
        endif
        ; 12 - Windward Ruins
        if(target != R01Werewolf_WindwardRuinsExterior)
            Debug.Trace(THIS_FILE + " * DISABLE target R01 12: R01Werewolf_WindwardRuinsExterior")
            disableHelper(DSilHand_R01xMarker12)
        endif
        ; 13 - Roadside Ruins 
        if(target != R01Werewolf_RoadsideRuinsExterior)
            Debug.Trace(THIS_FILE + " * DISABLE target R01 13: R01Werewolf_RoadsideRuinsExterior")
            disableHelper(DSilHand_R01xMarker13)
        endif
        ; 14 - Honeystrand Cave 
        if(target != R01Werewolf_HoneystrandGrove01)
            Debug.Trace(THIS_FILE + " * DISABLE target R01 14: R01Werewolf_HoneystrandGrove01")
            disableHelper(DSilHand_R01xMarker14)
        endif
        ; 15 - Pinefrost Tower  	
        if(target != R01Werewolf_PinefrostTowerExterior01)
            Debug.Trace(THIS_FILE + " * DISABLE target R01 15: R01Werewolf_PinefrostTowerExterior01")
            disableHelper(DSilHand_R01xMarker15)
        endif
    endif
    ;
    ; R02 Targets
    ; 
    if (questId == RADIANT_QUEST_R02 || questId == 0)
        ; 01 - Bronze Water Cave  
        if(target != R02Beast_BronzeWaterCave)
            Debug.Trace(THIS_FILE + " * DISABLE target R02 : R02Beast_BronzeWaterCave")
            disableHelper(DSilHand_R02xMarker01)
        endif
        ; 02 - Tolvald's Cave 
        if(target != R02Beast_TolvaldsCave01)
            Debug.Trace(THIS_FILE + " * DISABLE target R02 : R02Beast_TolvaldsCave01")
            disableHelper(DSilHand_R02xMarker02)
        endif
        ; 03 - Riverside Shack 
        if(target != R02Beast_RiversideShackExterior01)
            Debug.Trace(THIS_FILE + " * DISABLE target R02 : R02Beast_RiversideShackExterior01")
            disableHelper(DSilHand_R02xMarker03)
        endif
        ; 04 - Crystaldrift Cave 	
        if(target != R02Beast_CrystaldriftCave01)
            Debug.Trace(THIS_FILE + " * DISABLE target R02 : R02Beast_CrystaldriftCave01")
            disableHelper(DSilHand_R02xMarker04)
        endif
        ; 05 - Avanchnzel 
        ;if(target != R02Beast_Avanchnzel01)
        ;    Debug.Trace(THIS_FILE + " * DISABLE target R02 : R02Beast_Avanchnzel01")
        ;    disableHelper(DSilHand_R02xMarker05)
        ;endif
        ; 06 - Darkshade
        if(target != R02Beast_Darkshade01)
            Debug.Trace(THIS_FILE + " * DISABLE target R02 : R02Beast_Darkshade01")
            disableHelper(DSilHand_R02xMarker06)
        endif
        ; 07 - Greywater Grotto 	
        if(target != R02Beast_GreywaterGrotto01)
            Debug.Trace(THIS_FILE + " * DISABLE target R02 : R02Beast_GreywaterGrotto01")
            disableHelper(DSilHand_R02xMarker07)
        endif
        ; 08 - Evergreen Grove 
        if(target != R02Beast_EvergreenGroveExterior)
            Debug.Trace(THIS_FILE + " * DISABLE target R02 : R02Beast_EvergreenGroveExterior")
            disableHelper(DSilHand_R02xMarker08)
        endif
        ; 09 - Greenspring Hollows 
        if(target != R02Beast_GreenSpringHollowExterior01)
            Debug.Trace(THIS_FILE + " * DISABLE target R02 : R02Beast_GreenSpringHollowExterior01")
            disableHelper(DSilHand_R02xMarker09)
        endif
        ; 10 - Brood Cavern 	
        if(target != R02Beast_BroodCavern01)
            Debug.Trace(THIS_FILE + " * DISABLE target R02 : R02Beast_BroodCavern01")
            disableHelper(DSilHand_R02xMarker10)
        endif
        ; 11 - Brinewater Grotto  
        if(target != R02Beast_BrinewaterGrottoStart)
            Debug.Trace(THIS_FILE + " * DISABLE target R02 : R02Beast_BrinewaterGrottoStart")
            disableHelper(DSilHand_R02xMarker11)
        endif
        ; 12 - Windward Ruins
        if(target != R02Beast_WindwardRuinsExterior)
            Debug.Trace(THIS_FILE + " * DISABLE target R02 : R02Beast_WindwardRuinsExterior")
            disableHelper(DSilHand_R02xMarker12)
        endif
        ; 13 - Roadside Ruins 
        if(target != R02Beast_RoadsideRuinsExterior)
            Debug.Trace(THIS_FILE + " * DISABLE target R02 : R02Beast_RoadsideRuinsExterior")
            disableHelper(DSilHand_R02xMarker13)
        endif
        ; 14 - Honeystrand Cave 
        if(target != R02Beast_HoneystrandGrove01)
            Debug.Trace(THIS_FILE + " * DISABLE target R02 : R02Beast_HoneystrandGrove01")
            disableHelper(DSilHand_R02xMarker14)
        endif
        ; 15 - Pinefrost Tower  	
        if(target != R02Beast_PinefrostTowerExterior01)
            Debug.Trace(THIS_FILE + " * DISABLE target R02 : R02Beast_PinefrostTowerExterior01")
            disableHelper(DSilHand_R02xMarker15)
        endif
    endif  
    ;
    ; R03 Targets
    ;
    ; nothing to do ...
    ; 
    ; R04 Targets
    ;    
    if (questId == RADIANT_QUEST_R04 || questId == 0)
        ; 01 - Alchemist Shack
        if(target != R04Witch_AlchemistsShackExterior)
            Debug.Trace(THIS_FILE + " * DISABLE target R04 01: R04Witch_AlchemistsShackExterior")
            disableHelper(DSilHand_R04xMarker01)
        endif
        ; 02 - Witchmist Grove
        if(target != R04Witch_WitchmistGroveExterior)
            Debug.Trace(THIS_FILE + " * DISABLE target R04 02: R04Witch_WitchmistGroveExterior")
            disableHelper(DSilHand_R04xMarker02)
        endif
        ; 03 - Doomstone FallForest01
        if(target != R04Witch_DoomstoneFallForest01)
            Debug.Trace(THIS_FILE + " * DISABLE target R04 03: R04Witch_DoomstoneFallForest01")
            disableHelper(DSilHand_R04xMarker03)
        endif
        ; 04 - Doomstone Tundra01
        if(target != R04Witch_DoomstoneTundra01)
            Debug.Trace(THIS_FILE + " * DISABLE target R04 04: R04Witch_DoomstoneTundra01")
            disableHelper(DSilHand_R04xMarker04)
        endif
        ; 05 - Sunderstone George01
        if(target != R04Witch_SunderstoneGeorge01 )
            Debug.Trace(THIS_FILE + " * DISABLE target R04 05: R04Witch_SunderstoneGeorge01 ")
            disableHelper(DSilHand_R04xMarker05)
        endif  
        ;; 06 - Swindle's Den
        ;if(target != R04Witch_SwindlersDen01)
        ;    Debug.Trace(THIS_FILE + " * DISABLE target R04 06: R04Witch_SwindlersDen01")
        ;    disableHelper(DSilHand_R04xMarker06)
        ;endif
        ;; 07 - Wolfskull Cave
        ;if(target != R04Witch_WolfskullCave01)
        ;    Debug.Trace(THIS_FILE + " * DISABLE target R04 07: R04Witch_WolfskullCave01")
        ;    disableHelper(DSilHand_R04xMarker07)
        ;endif
        ; 08 - Kjenstag Ruins
        if(target != R04Witch_KjenstagRuinsExterior)
            Debug.Trace(THIS_FILE + " * DISABLE target R04 08: R04Witch_KjenstagRuinsExterior")
            disableHelper(DSilHand_R04xMarker08)
        endif
        ; 09 - Halldir's Carin
        if(target != R04Witch_HalldirsCairn01)
            Debug.Trace(THIS_FILE + " * DISABLE target R04 09: R04Witch_HalldirsCairn01")
            disableHelper(DSilHand_R04xMarker09)
        endif
        ;; 10 - POIPineForest24
        ;if(target != R04Witch_POIPineForest24)
        ;    Debug.Trace(THIS_FILE + " * DISABLE target R04 10: R04Witch_POIPineForest24")
        ;    disableHelper(DSilHand_R04xMarker10)
        ;endif
        ; 11 - Doomstone Pine Forest01
        if(target != R04Witch_DoomstonePineForest01)
            Debug.Trace(THIS_FILE + " * DISABLE target R04 11: R04Witch_DoomstonePineForest01")
            disableHelper(DSilHand_R04xMarker11)
        endif
        ;; 12 - Ilinalta's Deep
        ;if(target != R04Witch_IlinaltasDeep01)
        ;    Debug.Trace(THIS_FILE + " * DISABLE target R04 12: R04Witch_IlinaltasDeep01")
        ;    disableHelper(DSilHand_R04xMarker12)
        ;endif
        ; 13 - South Brittleshin
        if(target != R04Witch_BrittleshinPass01)
            Debug.Trace(THIS_FILE + " * DISABLE target R04 13: R04Witch_BrittleshinPass01")
            disableHelper(DSilHand_R04xMarker13)
        endif
        ; 14 - Boulderfall Cave
        if(target != R04Witch_BoulderfallCave01)
            Debug.Trace(THIS_FILE + " * DISABLE target R04 14: R04Witch_BoulderfallCave01")
            disableHelper(DSilHand_R04xMarker14)
        endif
        ; 15 - Ansilvund
        if(target != R04Witch_AnsilvundExterior)
            Debug.Trace(THIS_FILE + " * DISABLE target R04 15: R04Witch_AnsilvundExterior")
            disableHelper(DSilHand_R04xMarker15)
        endif
        ; 16 - Falkreath Watchtower
        if(target != R04Witch_FalkreathWatchtowerExterior)
            Debug.Trace(THIS_FILE + " * DISABLE target R04 16: R04Witch_FalkreathWatchtowerExterior")
            disableHelper(DSilHand_R04xMarker16)
        endif
        ; 17 - Hob's Fall Cave
        if(target != R04Witch_HobsFallCave01)
            Debug.Trace(THIS_FILE + " * DISABLE target R04 17: R04Witch_HobsFallCave01")
            disableHelper(DSilHand_R04xMarker17)
        endif
        ; 18 - Morvunskar
        if(target != R04Witch_Morvunskar01)
            Debug.Trace(THIS_FILE + " * DISABLE target R04 18: R04Witch_Morvunskar01")
            disableHelper(DSilHand_R04xMarker18)
        endif        
    endif  
EndFunction


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
; Input:  int questRadStage - controller stage of the radiant quest to be 
;         started: STAGE_SELECT_R1, STAGE_SELECT_R2, STAGE_SELECT_R3,
;         STAGE_SELECT_R4 or STAGE_SELECT_RESET.
; Output: bool - true if the quest was started, false if not.
; 
; Starts a giver radiant quest using the story manager. If the selected 
; radiant quest id STAGE_SELECT_RESET (0), instead of starting a radiant quest, 
; it will reset the radiant quest controller (R00), and rowback it to stage 0, 
; and create and alarm to advance it back to stage 5 within 24 hours. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function startRadQuestStoryManager(int questRadStage)
    bool hasStarted = false
    Debug.Trace(THIS_FILE + " -- startRadQuestStoryManager(): questRadStage = " + questRadStage)
    ; starts the selected quest
    if (questRadStage == STAGE_SELECT_R1)
        if (DSilHand_R01Keyword.SendStoryEventAndWait())
            Debug.Trace(THIS_FILE +" R01 Quest started!")
            hasStarted = true
        else
            Debug.Trace(THIS_FILE + " **ERROR** R01 No quest started", 2)
        endIf
    elseif (questRadStage == STAGE_SELECT_R2)
        if (DSilHand_R02Keyword.SendStoryEventAndWait())
            Debug.Trace(THIS_FILE +" R02 Quest started!")
            hasStarted = true
        else
            Debug.Trace(THIS_FILE + " **ERROR** R02 No quest started", 2)
        endIf     
    elseif (questRadStage == STAGE_SELECT_R3)
        if (DSilHand_R03Keyword.SendStoryEventAndWait())
            Debug.Trace(THIS_FILE +" R03 Quest started!")
            hasStarted = true
        else
            Debug.Trace(THIS_FILE + " **ERROR** R03 No quest started", 2)
        endIf      
    elseif (questRadStage == STAGE_SELECT_R4)
        if (DSilHand_R04Keyword.SendStoryEventAndWait())
            Debug.Trace(THIS_FILE +" R04 Quest started!")
            hasStarted = true
        else
            Debug.Trace(THIS_FILE + " **ERROR**  R04 No quest started", 2)
        endIf
    elseif (questRadStage == STAGE_SELECT_RESET)
        Debug.Trace(THIS_FILE + " **WARNING** RESETING CONTROLLER QUEST!", 1)
        ; ressurect one npc for each radiant quest, so the next time it should not
        ; fail to start
        ensureOneTargetAlive()
        ; creates alarm for quest rowback in 24 hours 
        RegisterForSingleUpdateGameTime(24)
        RowbackQuest = true
        ; rowback current quest (controller)
        SetStage(0)
    else
        Debug.Trace(THIS_FILE + " **WARNING** startRadQuestStoryManager(): ERROR - invalid questRadStage:" + questRadStage, 1)
        Debug.Trace(THIS_FILE + " **WARNING** STARTING QUEST R01", 1)
        if (DSilHand_R01Keyword.SendStoryEventAndWait())
            Debug.Trace(THIS_FILE +" R01 Quest started!")
            hasStarted = true
        else
            Debug.Trace(THIS_FILE + " **ERROR**  R01 No quest started", 2)
        endIf
    endif
     ; Register the initialized quest on the controller, if the quest was properly initialized
    if (hasStarted == true)
		if (questRadStage == STAGE_SELECT_R1)
			Debug.Trace(THIS_FILE + " -- SET DSilHand_R01WolfHunt on the R00Controller")
			setCurrentRadiantQuest(RADIANT_QUEST_R01)
		elseif (questRadStage == STAGE_SELECT_R2)
			Debug.Trace(THIS_FILE + " -- SET DSilHand_R02BeastExtermination on the R00Controller")
			setCurrentRadiantQuest(RADIANT_QUEST_R02)
		elseif (questRadStage == STAGE_SELECT_R3)
			Debug.Trace(THIS_FILE + " -- SET DSilHand_R03WerewolfLair on the R00Controller")
			setCurrentRadiantQuest(RADIANT_QUEST_R03)
		elseif (questRadStage == STAGE_SELECT_R4)
			Debug.Trace(THIS_FILE + " -- SET DSilHand_R04WitchHunter on the R00Controller")
			setCurrentRadiantQuest(RADIANT_QUEST_R04)
		else
			; Default radiant quest
			Debug.Trace(THIS_FILE + " **WARNING** INVALID CURRENT STAGE " + questRadStage + ". SELECTING DEFAULT RADIANT QUEST", 1)
			Debug.Trace(THIS_FILE + " -- SET DSilHand_R01WolfHunt  on the R00Controller")
			setCurrentRadiantQuest(RADIANT_QUEST_R01)
		endif
	endif	
    return hasStarted
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

;
; Alarms and event helpers
; 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Private Method
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
; Private Method
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
    GoldReward = 0
Endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Private Method
; Input: Quest qst - quest where the stage will be set
; Input: int stage - stage to set
; Output: bool - true if the stage was set, false otherwise 
;
; Sets the stage of the quest to the given stage.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function forceSetStage(Quest qst, int stage)
    Debug.Trace(THIS_FILE + " -- forceSetStage()")
    ; vars
    bool stopFlag = false
    bool retVal = false
    int tryCount = 1
    int maxTries = 50
    ; force start quest
    retVal = qst.SetStage(stage)
    stopFlag = retVal
    while(stopFlag == false)
        Debug.Trace(THIS_FILE + " -- forceSetStage() - ERROR - Failed to set stage:" + stage, 2)
        Utility.Wait(0.01)
        tryCount = tryCount + 1
        Debug.Trace(THIS_FILE + " TRY AGAIN " + tryCount, 1)
        retVal = qst.SetStage(stage)
        stopFlag = retVal
        if (stopFlag == false) && (tryCount > maxTries)
            string errMsg = "ERROR STARTING QUEST. Contact the Mod developer to fix this issue. Sorry for the inconvenience."
            Debug.Trace(THIS_FILE + " **ERROR** " + errMsg, 2)
            Debug.MessageBox(errMsg)
            stopFlag = true
        endif
    endWhile
    return retVal
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
        Debug.Trace("Rowback Quest!!")
        RowbackQuest = false
        Reset()
        Stop()
        Start()
        SetStage(STAGE_RADIANT_SETUP)
    endif
EndEvent


