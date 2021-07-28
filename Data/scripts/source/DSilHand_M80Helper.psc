Scriptname DSilHand_M80Helper extends Quest  
{Routines helper for quest M80.}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ReferenceAlias Property Kurdak  Auto  
{Reference alias to unique DSilHand actor Kurdak}

ReferenceAlias Property Athis  Auto  
{Reference alias to unique vanilla actor Athis}

ReferenceAlias Property Brill  Auto  
{Reference alias to unique vanilla actor Brill}

ReferenceAlias Property CircleNord01  Auto  
{Reference alias to unique DSiLHand actor Circle Nord}

ReferenceAlias Property CompBretFrost  Auto  
{Reference alias to unique DSilHand  actor Forst battlemage breton}

ReferenceAlias Property CompImp02  Auto  
{Reference alias to unique DSilHand actor Companion Imperial 02}

ReferenceAlias Property Desk  Auto  
{Reference Alias to the Kodlack desk, where the last ax fragment and kodlak journal is located}

ReferenceAlias Property Eorlund  Auto  
{Reference alias to unique vanilla actor Eorlund}

ReferenceAlias Property FakeKodlak  Auto  
{Reference alias to unique actor DSilHand_Kodlak}

ReferenceAlias Property FakeTorvar  Auto  
{Reference alias to unique DSilHand actor Torvar}

ReferenceAlias Property FakeVilkas  Auto  
{Reference alias to unique DSilHand actor DSilHand_Vilkas}

ReferenceAlias Property Frag05  Auto  
{Reference alias to the fragment of ysgramour ax 05}

ReferenceAlias Property Guard01  Auto  
{}

ReferenceAlias Property Guard02  Auto  
{}

ReferenceAlias Property Guard03  Auto  
{}

ReferenceAlias Property Haknrm  Auto  
{Reference alias to unique DSilHand actor Haknrm}

ReferenceAlias Property Irronkas  Auto  
{Reference alias to unique DSilHand actor Irronkas}

ReferenceAlias Property Kodlak  Auto  
{Reference alias to unique vanilla actor Kodlak}

ReferenceAlias Property KodlaksJournal  Auto  
{Reference alias to Kodlack Journal }

ReferenceAlias Property Kylmir  Auto  
{Reference alias to unique actor Kylmir}

ReferenceAlias Property Ria  Auto  
{Reference alias to unique actor Ria}

ReferenceAlias Property SENAAR  Auto  
{Reference alias to unique actor SENAAR}

ReferenceAlias Property SilverHand1  Auto  
{}

ReferenceAlias Property SilverHand2  Auto  
{}

ReferenceAlias Property SilverHand3  Auto  
{}

ReferenceAlias Property SilverHand4  Auto  
{}

ReferenceAlias Property Tilma  Auto  
{Reference alias to unique actor Tilma}

ReferenceAlias Property Torvar  Auto  
{Reference alias to unique actor Torvar}

ReferenceAlias Property Vignar  Auto  
{Reference alias to unique actor Vignar}

ReferenceAlias Property Vilkas  Auto  
{Reference alias to unique actor Vilkas}

ReferenceAlias Property fjol  Auto  
{Reference alias to unique actor fjol}

ReferenceAlias Property hillara  Auto  
{Reference alias to unique actor hillara}

ReferenceAlias Property xMarkerAssault01  Auto  
{}

ReferenceAlias Property xMarkerAssault02  Auto  
{}

ReferenceAlias Property xMarkerAssault03  Auto  
{}

ReferenceAlias Property xMarkerAssault04  Auto  
{}

ReferenceAlias Property xMarkerAssault05  Auto  
{}

ReferenceAlias Property xMarkerAssault06  Auto  
{}

ReferenceAlias Property xMarkerAssault07  Auto  
{}

ReferenceAlias Property xMarkerAssault08  Auto  
{}

ReferenceAlias Property xMarkerAssault09  Auto  
{}

ReferenceAlias Property xMarkerAssault10  Auto  
{}

ReferenceAlias Property xMarkerAssault11  Auto  
{}

ReferenceAlias Property xMarkerAssault12  Auto  
{}

ReferenceAlias Property xMarkerAssaultDst  Auto  
{}

ReferenceAlias Property xMarkerFjol  Auto  
{}

ReferenceAlias Property xMarkerHaknrm  Auto  
{}

ReferenceAlias Property xMarkerHillara  Auto  
{}

ReferenceAlias Property xMarkerIrronkas  Auto  
{}

ReferenceAlias Property xMarkerKurdak  Auto  
{}

ReferenceAlias Property xMarkerKylmir  Auto  
{}

ReferenceAlias Property xMarkerSenaar  Auto  
{}

ReferenceAlias Property xMarkerSkyforge01  Auto  
{}

ReferenceAlias Property xMarkerSkyforge02  Auto  
{}

ReferenceAlias Property xMarkerSkyforge03  Auto  
{}

ReferenceAlias Property xMarkerSkyforge04  Auto  
{}

ReferenceAlias Property xMarkerSkyforge05  Auto  
{}

ReferenceAlias Property xMarkerSkyforge06  Auto  
{}

ReferenceAlias Property xMarkerSkyforge07  Auto  
{}

ReferenceAlias Property xMarkerSkyforge08  Auto  
{}

ReferenceAlias Property xMarkerSkyforge09  Auto  
{}

ReferenceAlias Property xMarkerSkyforge10  Auto  
{}

ReferenceAlias Property xMarkerSkyforgeBlacksmith  Auto  
{}

ReferenceAlias Property xMarkerSkyforgeFjolSpeach  Auto  
{}

ReferenceAlias Property xMarkerVignarAthisListen  Auto  
{}

ReferenceAlias Property xMarkerVignarBril  Auto  
{}

ReferenceAlias Property xMarkerVignarFjolListen  Auto  
{}

ReferenceAlias Property xMarkerVignarGuard01  Auto  
{}

ReferenceAlias Property xMarkerVignarGuard02  Auto  
{}

ReferenceAlias Property xMarkerVignarGuard03  Auto  
{}

ReferenceAlias Property xMarkerVignarTilma  Auto  
{}

ReferenceAlias Property xMarkerVignarVignar  Auto  
{}

Faction Property PotentialFollowerFaction  Auto  
{}

Faction Property CurrentFollowerFaction  Auto  
{}

Faction Property SilverHandFaction  Auto  
{Silver Hand Faction object}

Faction Property CompanionsFaction  Auto  
{Companions Faction object}

Armor Property ArmorSteelPlateBoots  Auto  
{Steel Plate Boots armor object}

Armor Property ArmorSteelPlateCuirass  Auto  
{Steel Plate Cuirass armor object}

Armor Property ArmorSteelPlateGauntlets  Auto  
{Steel Plate Gauntlets armor object}

WEAPON Property DSilHand_TemperedSilverGreatsword  Auto  
{Tempered Silver Greatsword weapon object}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Member variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
String THIS_FILE = "(DSilHand_M80Helper.psc) "
int STAGE_WAIT_DUSK = 10
int STAGE_MEET_AT_SECRET_PASSAGE = 20
int STAGE_FJOL_SPEACH1 = 30


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Public Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; Enable/Disable the right actors on Jorrvaskr to start the quest.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function prepareJorrvaskr()
    Debug.Trace(THIS_FILE + " -- prepareJorrvaskr()")
    ; Enable NPCs copies
    DSilHand_Utils.enableActorAliasRef(FakeKodlak, "FakeKodlak", THIS_FILE)
    DSilHand_Utils.enableActorAliasRef(FakeTorvar, "FakeTorvar", THIS_FILE)
    DSilHand_Utils.enableActorAliasRef(FakeVilkas, "FakeVilkas", THIS_FILE)
    ; diable originals
    DSilHand_Utils.disableActorRefAlias(Kodlak, "Kodlak", THIS_FILE)
    DSilHand_Utils.disableActorRefAlias(Torvar, "Torvar", THIS_FILE)
    DSilHand_Utils.disableActorRefAlias(Vilkas, "Vilkas", THIS_FILE)
Endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; Creates the alarm to progress the quest after Dusk of the next day. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function setAlarmWaitUntilDusk()
    Debug.Trace(THIS_FILE + " -- setAlarmWaitUntilDusk()")
    ; on start of Objective 10
    float currentTime =  DSilHand_Utils.GetCurrentHourOfDay() 
    float todayLastingTime = 24 - currentTime
    ; alarms at 6 o'clock
    float timeToAlarm = 18 + todayLastingTime
    ; register alarm
    Debug.Trace(THIS_FILE + " -- time remaning to the update:<" + timeToAlarm + ">")
    RegisterForSingleUpdateGameTime(timeToAlarm)
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; Move the  Silver Hands unique actors to the  secret passage on the 
; and spaw the random actors.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function moveNpcsToSecretPassage()
    Debug.Trace(THIS_FILE + "-- moveNpcsToSecretPassage()")
    ; Move non-followers NPCS
    DSilHand_Utils.logActorStatus(Fjol.GetActorReference(), "Fjol", 1, THIS_FILE)
    DSilHand_Utils.logActorStatus(Hillara.GetActorReference(), "Hillara", 1, THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(Fjol, xMarkerFjol, "Fjol", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(Haknrm, xMarkerHaknrm, "Haknrm", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(Irronkas, xMarkerIrronkas, "Irronkas", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(Kurdak, xMarkerKurdak, "Kurdak", THIS_FILE)
    ; Move Followers
    bool hillaraIsFollower = false
    bool senaarIsFollower = false
    hillaraIsFollower = DSilHand_Utils.actorRefAliasIsFollower(Hillara, "Hillara", PotentialFollowerFaction, CurrentFollowerFaction, THIS_FILE) 
    senaarIsFollower = DSilHand_Utils.actorRefAliasIsFollower(SENAAR, "SENAAR", PotentialFollowerFaction, CurrentFollowerFaction, THIS_FILE) 
    if(!hillaraIsFollower)
        Debug.Trace(THIS_FILE + "-- moving Hillara to the scret passage")
        DSilHand_Utils.moveSingleNpcRefAlias(Hillara, xMarkerHillara, "Hillara", THIS_FILE)
    endif
    if(!senaarIsFollower)
        Debug.Trace(THIS_FILE + "-- moving Sennar to the scret passage")
        DSilHand_Utils.moveSingleNpcRefAlias(SENAAR, xMarkerSenaar, "Sennar", THIS_FILE)
    endif
    ; Enable random NPCS
    DSilHand_Utils.enableActorAliasRef(SilverHand1, "SilverHand1", THIS_FILE)
    DSilHand_Utils.enableActorAliasRef(SilverHand2, "SilverHand2", THIS_FILE)
    DSilHand_Utils.enableActorAliasRef(SilverHand3, "SilverHand3", THIS_FILE)
    DSilHand_Utils.enableActorAliasRef(SilverHand4, "SilverHand4", THIS_FILE)
    ; Change equipped items
    equipIrronkasPlateArmor()
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; Move all NPCs and players to whiterun outside of the Underforge.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function startSilverhandAssault()
    Debug.Trace(THIS_FILE + " -- startSilverhandAssault()")
    ; Move NPCs to whiterun
    DSilHand_Utils.moveSingleNpc(Game.GetPlayer(), xMarkerAssault07.GetReference(), "Sennar", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(Fjol, xMarkerAssault01, "Fjol", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(Haknrm, xMarkerAssault02, "Haknrm", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(Irronkas, xMarkerAssault03, "Irronkas", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(Kurdak, xMarkerAssault04, "Kurdak", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(Hillara, xMarkerAssault05, "Hillara", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(SENAAR, xMarkerAssault06, "Sennar", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(SilverHand1, xMarkerAssault08, "SilverHand1", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(SilverHand2, xMarkerAssault09, "SilverHand2", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(SilverHand3, xMarkerAssault10, "SilverHand3", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(SilverHand4, xMarkerAssault11, "SilverHand4", THIS_FILE)
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; End Silver Hand and Companions War. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function endSilverHandCompanionsWar()
    Debug.Trace(THIS_FILE + " -- endSilverHandCompanionsWar()")
    ; make the faction allies
    SilverHandFaction.SetAlly(CompanionsFaction)
    ; stop combat 
    stopAssaultNpcsCombat()
    Utility.Wait(2)
    ; execute once again just in case
    stopAssaultNpcsCombat()
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; End Silver Hand and Companions NPCs combat 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function stopAssaultNpcsCombat()
    Debug.Trace(THIS_FILE + " -- stop companions combat")
    DSilHand_Utils.stopAllCombatRefAlias(Athis, "Athis", THIS_FILE)
    DSilHand_Utils.stopAllCombatRefAlias(Brill, "Brill", THIS_FILE)
    DSilHand_Utils.stopAllCombatRefAlias(CompBretFrost, "CompBretFrost", THIS_FILE) 
    DSilHand_Utils.stopAllCombatRefAlias(CompImp02, "CompImp02", THIS_FILE)
    DSilHand_Utils.stopAllCombatRefAlias(Eorlund, "Eorlund", THIS_FILE) 
    DSilHand_Utils.stopAllCombatRefAlias(FakeTorvar, "FakeTorvar", THIS_FILE)
    DSilHand_Utils.stopAllCombatRefAlias(Ria, "Ria", THIS_FILE) 
    DSilHand_Utils.stopAllCombatRefAlias(Tilma, "Tilma", THIS_FILE)
    DSilHand_Utils.stopAllCombatRefAlias(Vignar, "Vignar", THIS_FILE) 
    Debug.Trace(THIS_FILE + " -- stop silver hand combat")
    DSilHand_Utils.stopAllCombatRefAlias(fjol, "fjol", THIS_FILE) 
    DSilHand_Utils.stopAllCombatRefAlias(hillara, "hillara", THIS_FILE)
    DSilHand_Utils.stopAllCombatRefAlias(SENAAR, "SENAAR", THIS_FILE)
    DSilHand_Utils.stopAllCombatRefAlias(SilverHand1, "SilverHand1", THIS_FILE)
    DSilHand_Utils.stopAllCombatRefAlias(SilverHand2, "SilverHand2", THIS_FILE) 
    DSilHand_Utils.stopAllCombatRefAlias(SilverHand3, "SilverHand3", THIS_FILE)
    DSilHand_Utils.stopAllCombatRefAlias(SilverHand4, "SilverHand4", THIS_FILE) 
    DSilHand_Utils.stopAllCombatRefAlias(Haknrm, "Haknrm", THIS_FILE)
    DSilHand_Utils.stopAllCombatRefAlias(Irronkas, "Irronkas", THIS_FILE) 
    DSilHand_Utils.stopAllCombatRefAlias(Kylmir, "Kylmir", THIS_FILE) 
    DSilHand_Utils.stopAllCombatRefAlias(Kurdak, "Kurdak", THIS_FILE)
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Private Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; This method equip Irronkas with Stell Plate Armor and with a Tempered Silver
; Greatsword.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function equipIrronkasPlateArmor()
    Debug.Trace(THIS_FILE + " --  equipIrronkasPlateArmor()")    
    if(Irronkas != None && Irronkas.GetActorReference() != None)
        Irronkas.GetActorReference().EquipItem(ArmorSteelPlateBoots)
        Irronkas.GetActorReference().EquipItem(ArmorSteelPlateCuirass)
        Irronkas.GetActorReference().EquipItem(ArmorSteelPlateGauntlets)
        Irronkas.GetActorReference().EquipItem(DSilHand_TemperedSilverGreatsword)
    else
        Debug.Trace(THIS_FILE + " **WARNING** Irronkas Alias is EMPTY!", 1)
    endif
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; This events is activate after the stage 10 from the quest M80, when the 
; alarm is activated. When the alarm is fired, quest M80 stage and objective 
; is advanced.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnUpdateGameTime()
    Debug.Trace(THIS_FILE + " --  OnUpdateGameTime()")
    ;if(GetState() == STAGE_WAIT_DUSK)
        Debug.Trace(THIS_FILE + " --  OnUpdate(): Stage:" + GetState() + " => advance quest stage to " + STAGE_MEET_AT_SECRET_PASSAGE)
        ; completes "Prepare to assault tomorrow at the begining of the dusk near Whiterun"
        SetObjectiveCompleted(STAGE_WAIT_DUSK)
        SetStage(STAGE_MEET_AT_SECRET_PASSAGE)
        ; displays "Meet the men on the secret passage beneth the underforge on Whiterun"
        SetObjectiveDisplayed(STAGE_MEET_AT_SECRET_PASSAGE)
    ;endif
EndEvent














