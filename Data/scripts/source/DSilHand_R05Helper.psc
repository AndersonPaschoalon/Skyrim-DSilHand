Scriptname DSilHand_R05Helper extends Quest  
{Script helper for the quest R05.}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

MiscObject Property Gold001  Auto  
{}

Book Property SpellTomeDetectLife  Auto  
{}

Book Property SpellTomeThunderbolt  Auto  
{}

Armor Property ArmorSteelPlateHelmet  Auto  
{}

Armor Property ArmorDragonplateHelmet  Auto  
{}

Armor Property EnchArmorSteelPlateHelmetAlchemy04  Auto  
{}

Armor Property ArmorBanditHelmet  Auto  
{}

WEAPON Property DSilHand_LunarSilverSword  Auto  
{}

WEAPON Property dunSilentMoonsEnchIronSword03  Auto  
{}

WEAPON Property dunSilentMoonsEnchIronWarAxe03  Auto  
{}

WEAPON Property dunSilentMoonsEnchIronMace03  Auto  
{}

WEAPON Property EnchDraugrBattleAxeHonedFrost03  Auto  
{}

Quest Property DSilHand_iR05Trigger  Auto  
{Trigger quest of R05}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Member variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Consts
;
String THIS_FILE = "(DSilHand_R05Helper.psc) "
int MIN_WAIT_TIME = 4 ; 4 DAYS
int MAX_WAIT_TIME = 8 ; 8 DAYS
int N_ITEMS = 12
int STAGE_INIT_QUEST = 0
int STAGE_START_QUEST = 5
bool DEBUG_FLAG = false
;
; Quest State
;
bool firstTimeExecuted = false


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Public Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Public Method
; Input:  void
; Output: void
;
; Select a reward for the player, and create an alarm to restart the quest
; after some days.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function finalizeQuest()
    Debug.Trace(THIS_FILE + " -- finalizeQuest()")
    pickReward()
    createAlarmRowbackQuest(MIN_WAIT_TIME, MAX_WAIT_TIME)
    CompleteQuest()
    Debug.Trace(THIS_FILE + " -- quest completed!")
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Private Method
; Input: int min_days - minumum amount of days to wait before rowback
; Input: int max_days - maximum amount of days o wait before rowback
; Input: int firstTimeExe - indicates if the quest is executed for the first time or not.
; Output: void
;
; Creates an alar to row back the quest to its start. Enables the flag and 
; calls register for single update game time.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function createAlarmRowbackQuest(int min_days = 4, int max_days = 8, bool firstTimeExe  = false)
    Debug.Trace(THIS_FILE + " -- createAlarmRowbackQuest()")
    ; set execution flag
    firstTimeExecuted = firstTimeExe
    ; Create alarm to row back the quest. Default: from 5 to 10 days.
    int timeToRowback = daysToRowBack(min_days, max_days)
    ; register the event
    Debug.Trace(THIS_FILE + " -- RegisterForSingleUpdateGameTime(): " + timeToRowback + " hours.")
    RegisterForSingleUpdateGameTime(timeToRowback)
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Private Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Private Method
; Input: int min_days - minumum amount of days to wait before rowback
; Input: int max_days - maximum amount of days o wait before rowback
; Output: int timeToRowBack - random amount of hours calculated to rowback.
;
; Calculate a random time to rowback.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
int Function daysToRowBack(int min_days = 10, int max_days = 20)
    if(DEBUG_FLAG == true)
        ; INIT - DELETE - DEBUG
        Debug.Trace(THIS_FILE + " DEBUG: ONLY ONE HOUR")
        return 1
    else
        int timeToRowback = 0
        Debug.Trace(THIS_FILE + " -- calcTimeToRowback()") 
        ; Create alarm to row back the quest - from 10 to 20 days.
        int daysToRowBack = Utility.RandomInt(min_days, max_days)
        Debug.Trace(THIS_FILE + "    * daysToRowBack: " + daysToRowBack)
        timeToRowback = daysToRowBack*24   
        Debug.Trace(THIS_FILE + "    * timeToRowback:" + timeToRowback) 
        return timeToRowback
    endif
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Private Method
; Input: void
; Output: void
;
; Select a random reward to the player.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function pickReward()
    Debug.Trace(THIS_FILE + " -- pickReward()")
    int item = Utility.RandomInt(1, N_ITEMS)
    if item == 1
        Debug.Trace(THIS_FILE + "    * item: Gold001")
        Game.GetPlayer().AddItem(Gold001, 50)
    elseif item == 2
        Debug.Trace(THIS_FILE + "    * item: SpellTomeDetectLife")
        Game.GetPlayer().AddItem(SpellTomeDetectLife)
    elseif item == 3
        Debug.Trace(THIS_FILE + "    * item: SpellTomeThunderbolt")
        Game.GetPlayer().AddItem(SpellTomeThunderbolt)
    elseif item == 4
        Debug.Trace(THIS_FILE + "    * item: ArmorSteelPlateHelmet")
        Game.GetPlayer().AddItem(ArmorSteelPlateHelmet)
    elseif item == 5
        Debug.Trace(THIS_FILE + "    * item: ArmorDragonplateHelmet")
        Game.GetPlayer().AddItem(ArmorDragonplateHelmet)
    elseif item == 6
        Debug.Trace(THIS_FILE + "    * item: EnchArmorSteelPlateHelmetAlchemy04")
        Game.GetPlayer().AddItem(EnchArmorSteelPlateHelmetAlchemy04)
    elseif item == 7
        Debug.Trace(THIS_FILE + "    * item: ArmorBanditHelmet")
        Game.GetPlayer().AddItem(ArmorBanditHelmet)
    elseif item == 8
        Debug.Trace(THIS_FILE + "    * item: DSilHand_LunarSilverSword")
        Game.GetPlayer().AddItem(DSilHand_LunarSilverSword)
    elseif item == 9
        Debug.Trace(THIS_FILE + "    * item: dunSilentMoonsEnchIronSword03")
        Game.GetPlayer().AddItem(dunSilentMoonsEnchIronSword03)
    elseif item == 10
        Debug.Trace(THIS_FILE + "    * item: dunSilentMoonsEnchIronWarAxe03")
        Game.GetPlayer().AddItem(dunSilentMoonsEnchIronWarAxe03)
    elseif item == 11
        Debug.Trace(THIS_FILE + "    * item: dunSilentMoonsEnchIronMace03")
        Game.GetPlayer().AddItem(dunSilentMoonsEnchIronMace03)
    elseif item == 12
        Debug.Trace(THIS_FILE + "    * item: EnchDraugrBattleAxeHonedFrost03")
        Game.GetPlayer().AddItem(EnchDraugrBattleAxeHonedFrost03)
    else
        Debug.Trace(THIS_FILE + "    * item: ERROR <" + item + ">")
        Game.GetPlayer().AddItem(Gold001, 50)
    endif
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; This Event is used to restar the quest after some days it has been completed.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnUpdateGameTime()
    Debug.Trace(THIS_FILE +" -- Rowback Quest!!")
    if firstTimeExecuted == false
        Debug.Trace(THIS_FILE + "    * firstTimeExecuted: false")
        Stop()
    endif
    DSilHand_iR05Trigger.Start()
    DSilHand_iR05Trigger.SetStage(10)
EndEvent



