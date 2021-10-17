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
{Reference alias to the fragment of ysgramour axe 05}

ReferenceAlias Property Guard01  Auto  
{Reference alias to the 1st guard on Vignar scene}

ReferenceAlias Property Guard02  Auto  
{Reference alias to the 2nd guard on Vignar scene}

ReferenceAlias Property Guard03  Auto  
{Reference alias to the 3rd guard on Vignar scene}

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
{Reference alias to the 1st random silver hand attacker}

ReferenceAlias Property SilverHand2  Auto  
{Reference alias to the 2nd random silver hand attacker}

ReferenceAlias Property SilverHand3  Auto  
{Reference alias to the 3rd random silver hand attacker}

ReferenceAlias Property SilverHand4  Auto  
{Reference alias to the 4th random silver hand attacker}

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
{xMarker for the place where the 01st Silver hand will start to run on Jorrvaskar, inside Whiterun}

ReferenceAlias Property xMarkerAssault02  Auto  
{xMarker for the place where the 2nd Silver hand will start to run on Jorrvaskar, inside Whiterun}

ReferenceAlias Property xMarkerAssault03  Auto  
{xMarker for the place where the 03rd Silver hand will start to run on Jorrvaskar, inside Whiterun}

ReferenceAlias Property xMarkerAssault04  Auto  
{xMarker for the place where the 04th Silver hand will start to run on Jorrvaskar, inside Whiterun}

ReferenceAlias Property xMarkerAssault05  Auto  
{xMarker for the place where the 05th Silver hand will start to run on Jorrvaskar, inside Whiterun}

ReferenceAlias Property xMarkerAssault06  Auto  
{xMarker for the place where the 06th Silver hand will start to run on Jorrvaskar, inside Whiterun}

ReferenceAlias Property xMarkerAssault07  Auto  
{xMarker for the place where the 07th Silver hand will start to run on Jorrvaskar, inside Whiterun}

ReferenceAlias Property xMarkerAssault08  Auto  
{xMarker for the place where the 08th Silver hand will start to run on Jorrvaskar, inside Whiterun}

ReferenceAlias Property xMarkerAssault09  Auto  
{xMarker for the place where the 09th Silver hand will start to run on Jorrvaskar, inside Whiterun}

ReferenceAlias Property xMarkerAssault10  Auto  
{xMarker for the place where the 10th Silver hand will start to run on Jorrvaskar, inside Whiterun}

ReferenceAlias Property xMarkerAssault11  Auto  
{xMarker for the place where the 11th Silver hand will start to run on Jorrvaskar, inside Whiterun}

ReferenceAlias Property xMarkerAssaultDst  Auto  
{xMarker for the place where all the Silver Hands soldiers will run inside Jorrvaskar to fight the Compaions}

ReferenceAlias Property xMarkerFjol  Auto  
{xMarker for the place where Fjol will starn outside Whiterun, before the Battle}

ReferenceAlias Property xMarkerHaknrm  Auto  
{xMarker for the place where Haknrm will starn outside Whiterun, before the Battle}

ReferenceAlias Property xMarkerHillara  Auto  
{xMarker for the place where Hillara will starn outside Whiterun, before the Battle}

ReferenceAlias Property xMarkerIrronkas  Auto  
{xMarker for the place where Irronkas will starn outside Whiterun, before the Battle}

ReferenceAlias Property xMarkerKurdak  Auto  
{xMarker for the place where Kurdak will starn outside Whiterun, before the Battle}

ReferenceAlias Property xMarkerKylmir  Auto  
{xMarker for the place where Kylmir will starn outside Whiterun, before the Battle}

ReferenceAlias Property xMarkerSenaar  Auto  
{xMarker for the place where Senar will starn outside Whiterun, before the Battle}

ReferenceAlias Property xMarkerVignarStarting  Auto  
{Reference to the xMarker outside of Jorrvaskr, where the NPCs are transported to the Scene after the battle and before the Armistice Scene starts}

Faction Property PotentialFollowerFaction  Auto  
{Reference to the PotentialFollowerFaction, to tell of the actor is a follower or not}

Faction Property CurrentFollowerFaction  Auto  
{Reference to the CurrentFollowerFaction, to tell of the actor is a follower or not}

Faction Property SilverHandFaction  Auto  
{Silver Hand Faction object}

Faction Property CompanionsFaction  Auto  
{Companions Faction object}

Faction Property GuardFactionWhiterun  Auto  
{Guard Faction object}

Armor Property ArmorSteelPlateBoots  Auto  
{Steel Plate Boots armor object}

Armor Property ArmorSteelPlateCuirass  Auto  
{Steel Plate Cuirass armor object}

Armor Property ArmorSteelPlateGauntlets  Auto  
{Steel Plate Gauntlets armor object}

WEAPON Property DSilHand_TemperedSilverGreatsword  Auto  
{Tempered Silver Greatsword weapon object}

ReferenceAlias Property VignarSceneTrigger  Auto  
{Reference to the Trigger on the entrance of Jorrvaskar, where the trigger for the scene after the battle is fired}

ReferenceAlias Property FakeAthis  Auto  
{Reference to Athis copy}

ReferenceAlias Property FakeRia  Auto  
{Reference to Ria Copy}

ReferenceAlias Property FakeVignar  Auto  
{Reference to the copy of Vignar}

ReferenceAlias Property FakeTilma2  Auto  
{Reference to the copy of Tilma Actor}

ReferenceAlias Property FakeBrill  Auto  
{Reference to Brill Copy}

ReferenceAlias Property FakeEorlund  Auto  
{Reference to Eorlund Copy}

Faction Property IsGuardFaction  Auto  
{Object referece to Guard Faction}

Faction Property CrimeFactionWhiterun  Auto  
{Whiterun crime faction}

Faction Property DragonsreachBasementGuards  Auto  
{Dragonsreach Basement Guards faction}

ObjectReference Property WallFrag01  Auto  
{Object referece to the Wuulthrad fragment in the wall of Jorrvaskar}

ObjectReference Property WallFrag02  Auto  
{Object referece to the Wuulthrad fragment in the wall of Jorrvaskar}

ObjectReference Property WallFrag03  Auto  
{Object referece to the Wuulthrad fragment in the wall of Jorrvaskar}

ObjectReference Property WallFrag04  Auto  
{Object referece to the Wuulthrad fragment in the wall of Jorrvaskar}

ObjectReference Property WallFrag05  Auto  
{Object referece to the Wuulthrad fragment in the wall of Jorrvaskar}

ObjectReference Property WallFrag06  Auto  
{Object referece to the Wuulthrad fragment in the wall of Jorrvaskar}

ObjectReference Property WallFrag07  Auto  
{Object referece to the Wuulthrad fragment in the wall of Jorrvaskar}

ObjectReference Property WallFrag08  Auto  
{Object referece to the Wuulthrad fragment in the wall of Jorrvaskar}

ObjectReference Property WallFrag09  Auto  
{Object referece to the Wuulthrad fragment in the wall of Jorrvaskar}

ObjectReference Property WallFrag10  Auto  
{Object referece to the Wuulthrad fragment in the wall of Jorrvaskar}

ObjectReference Property WallFrag11  Auto  
{Object referece to the Wuulthrad fragment in the wall of Jorrvaskar}

ObjectReference Property WallFrag12  Auto  
{Object referece to the Wuulthrad fragment in the wall of Jorrvaskar}

Potion Property RestoreHealth05  Auto  
{Healing potion for the silver hands for the battle!!}

ObjectReference Property xHeadingFjolListenVignar  Auto  
{xHeading where Fjol is placed to listen to Vignar in the armistice scene}

Scene Property DSilHand_M80_SceneArmisticeCall  Auto  
{Object of the scene where Fjol calls all the Silver hand to stop the Combat. It is much light and faster than the main armistice scene, wich was causing an odd delay.}



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Member variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; constants
string THIS_FILE = "(DSilHand_M80Helper.psc) "
int STAGE_WAIT_DUSK = 10
int STAGE_MEET_AT_SECRET_PASSAGE = 20
int STAGE_FJOL_SPEACH1 = 30
; state
bool Action2_Fjol_M80SceneTravelArmisticeSpeech_Completed = false 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Public Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


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
    ; -- QUEST PRODUCTION
    RegisterForSingleUpdateGameTime(timeToAlarm)
    ; -- QUEST DEBUG
    ;float testAlarm = 1
    ;Debug.Trace(THIS_FILE + "**WARNING** WRONG ALARM", 1)
    ;RegisterForSingleUpdateGameTime(testAlarm)
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; Enable/Disable the right actors on Jorrvaskr so the quest may start and 
; work properly
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function prepareJorrvaskr()
    Debug.Trace(THIS_FILE + " -- prepareJorrvaskr()")
    Debug.Trace(THIS_FILE + " -- disable original actors / enable copies and new npcs")
    ; Enable NPCs copies
    DSilHand_Utils.enableActorRefAlias(FakeKodlak, "FakeKodlak", THIS_FILE)
    DSilHand_Utils.enableActorRefAlias(FakeTorvar, "FakeTorvar", THIS_FILE)
    DSilHand_Utils.enableActorRefAlias(FakeVilkas, "FakeVilkas", THIS_FILE)
    DSilHand_Utils.enableActorRefAlias(FakeRia, "FakeRia", THIS_FILE)
    DSilHand_Utils.enableActorRefAlias(FakeAthis, "FakeAthis", THIS_FILE)
    ; Enable new NPCs
    DSilHand_Utils.enableActorRefAlias(CircleNord01, "CircleNord01", THIS_FILE)
    DSilHand_Utils.enableActorRefAlias(CompImp02, "CompImp02", THIS_FILE)
    DSilHand_Utils.enableActorRefAlias(CompBretFrost, "CompBretFrost", THIS_FILE)
    ; diable originals
    DSilHand_Utils.disableActorRefAlias(Kodlak, "Kodlak", THIS_FILE)
    DSilHand_Utils.disableActorRefAlias(Torvar, "Torvar", THIS_FILE)
    DSilHand_Utils.disableActorRefAlias(Vilkas, "Vilkas", THIS_FILE)
    DSilHand_Utils.disableActorRefAlias(Ria, "Ria", THIS_FILE)
    DSilHand_Utils.disableActorRefAlias(Athis, "Athis", THIS_FILE)
    ; disable other actors temprally, so they will not interfere in the scenes
    Debug.Trace(THIS_FILE + " -- disable other actors temprally, so they will not interfere in the scenes")
    DSilHand_Utils.disableActorRefAlias(Vignar, "Vignar", THIS_FILE)
    DSilHand_Utils.disableActorRefAlias(Eorlund, "Eorlund", THIS_FILE)
    DSilHand_Utils.disableActorRefAlias(Brill, "Brill", THIS_FILE)
    DSilHand_Utils.disableActorRefAlias(Tilma, "Tilma", THIS_FILE)
    ; Move actors to Jorrvaskr
    Debug.Trace(THIS_FILE + " -- move actors to Jorrvaskr")
    DSilHand_Utils.moveSingleNpcRefAlias(FakeKodlak, xMarkerAssaultDst, "FakeKodlak", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(FakeTorvar, xMarkerAssaultDst, "FakeTorvar", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(FakeVilkas, xMarkerAssaultDst, "FakeVilkas", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(CircleNord01, xMarkerAssaultDst, "CircleNord01", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(CompImp02, xMarkerAssaultDst, "CompImp02", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(CompBretFrost, xMarkerAssaultDst, "CompBretFrost", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(FakeRia, xMarkerAssaultDst, "FakeRia", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(FakeAthis, xMarkerAssaultDst, "FakeAthis", THIS_FILE)
    ; show/hide the right fragments
    prepareWulltradWallBeforeBattle()
Endfunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; Move the  Silver Hands unique actors to the  secret passage on the 
; and spaw the random actors. It also give Irronkas a plate armor.
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
    DSilHand_Utils.moveSingleNpcRefAlias(Kylmir, xMarkerKylmir, "Kylmir", THIS_FILE)
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
    DSilHand_Utils.enableActorRefAlias(SilverHand1, "SilverHand1", THIS_FILE)
    DSilHand_Utils.enableActorRefAlias(SilverHand2, "SilverHand2", THIS_FILE)
    DSilHand_Utils.enableActorRefAlias(SilverHand3, "SilverHand3", THIS_FILE)
    DSilHand_Utils.enableActorRefAlias(SilverHand4, "SilverHand4", THIS_FILE)
    ; Change equipped items
    equipIrronkasPlateArmor()
    ; prepare the people
    givePotionsForSilverhands()
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; Move all NPCs and players to whiterun outside of the Underforge.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function startSilverhandAssault()
    Debug.Trace(THIS_FILE + " -- startSilverhandAssault()")
    ; Move NPCs to whiterun
    DSilHand_Utils.moveSingleNpc(Game.GetPlayer(), xMarkerAssault07.GetReference(), "Dragonborn(Player)", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(Fjol, xMarkerAssault01, "Fjol", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(Haknrm, xMarkerAssault02, "Haknrm", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(Irronkas, xMarkerAssault03, "Irronkas", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(Kurdak, xMarkerAssault04, "Kurdak", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(Hillara, xMarkerAssault05, "Hillara", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(SENAAR, xMarkerAssault06, "Sennar", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(Kylmir, xMarkerAssault07, "Kylmir", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(SilverHand1, xMarkerAssault08, "SilverHand1", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(SilverHand2, xMarkerAssault09, "SilverHand2", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(SilverHand3, xMarkerAssault10, "SilverHand3", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(SilverHand4, xMarkerAssault11, "SilverHand4", THIS_FILE)
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; Prepare to the Scene of peace. This method will enable all actor that will 
; participate on the scene of peace, and place them outside Jarrvaskar. 
; In the Stage 60 of the quest M80, all of them should use an AI package to 
; go to their positions for the Scene DSilHand_M80_SceneArmistice.
; This will disable temporaly its AI as well, 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function prepareScenePeace()
    Debug.Trace(THIS_FILE + " -- prepareScenePeace()")
    Debug.Trace(THIS_FILE + " -- Force AI package reevaluation for Silver Hand")
    DSilHand_Utils.enableActorRefAlias(FakeVignar, "FakeVignar", THIS_FILE)
    DSilHand_Utils.enableActorRefAlias(FakeEorlund, "Eorlund", THIS_FILE)
    DSilHand_Utils.enableActorRefAlias(FakeBrill, "FakeBrill", THIS_FILE)
    DSilHand_Utils.enableActorRefAlias(FakeTilma2, "FakeTilma2", THIS_FILE)
    ; Move actors outside Jorrvaskr, so they may run to their positions
    Debug.Trace(THIS_FILE + " -- move actors outside Jorrvaskr")
    DSilHand_Utils.moveSingleNpcRefAlias(FakeVignar, xMarkerVignarStarting, "FakeVignar2", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(FakeBrill, xMarkerVignarStarting, "FakeBrill", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(FakeTilma2, xMarkerVignarStarting, "FakeTilma2", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(FakeEorlund, xMarkerVignarStarting, "FakeEorlund", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(Guard01, xMarkerVignarStarting, "Guard01", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(Guard02, xMarkerVignarStarting, "Guard02", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(Guard03, xMarkerVignarStarting, "Guard03", THIS_FILE)
    ; Move actors outside Jorrvaskr, so they may run to their positions
    Debug.Trace(THIS_FILE + " -- disable actors AI")
    FakeVignar.GetActorReference().EnableAI(false)
    FakeBrill.GetActorReference().EnableAI(false)
    FakeTilma2.GetActorReference().EnableAI(false)
    FakeEorlund.GetActorReference().EnableAI(false)
    Guard01.GetActorReference().EnableAI(false)
    Guard02.GetActorReference().EnableAI(false)
    Guard03.GetActorReference().EnableAI(false)
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; Do the preparations for the Armistice scene so it will occour as expected. 
; (1) Ensure Fjol is at the right position
; (2) Enable all Fake actors
; (3) Move all of them outside Jorrvaskar so they may enter insede.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function prepareSceneVignarArmstice()
    Debug.Trace(THIS_FILE + " -- prepareSceneVignarArmstice()")
    ; ensure Fjol is at the right position
    ensureFjolIsAtTheArmisticeDiscoursePosition()
    ; Enable actors AI before moving
    FakeVignar.GetActorReference().EnableAI(true)
    FakeBrill.GetActorReference().EnableAI(true)
    FakeTilma2.GetActorReference().EnableAI(true)
    FakeEorlund.GetActorReference().EnableAI(true)
    Guard01.GetActorReference().EnableAI(true)
    Guard02.GetActorReference().EnableAI(true)
    Guard03.GetActorReference().EnableAI(true)
    ; Move actors outside Jorrvaskr, so they may run to their positions
    DSilHand_Utils.moveSingleNpcRefAlias(FakeVignar, xMarkerVignarStarting, "FakeVignar", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(FakeBrill, xMarkerVignarStarting, "FakeBrill", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(FakeTilma2, xMarkerVignarStarting, "FakeTilma2", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(Guard01, xMarkerVignarStarting, "Guard01", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(Guard02, xMarkerVignarStarting, "Guard02", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(Guard03, xMarkerVignarStarting, "Guard03", THIS_FILE) 
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; End Silver Hand and Companions War. Form here and on, the Silver Hands and
; the Companions will be allies, and the GUards of Whiterun will do no 
; harm on the Silver Hands.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function endSilverHandCompanionsWar()
    Debug.Trace(THIS_FILE + " -- endSilverHandCompanionsWar()")
    ; Short scene where Fjoll calls the end of war
    DSilHand_M80_SceneArmisticeCall.ForceStart()
    ; stop combat 
    stopAssaultNpcsCombat() 
    ; make the faction allies
    SilverHandFaction.SetAlly(CompanionsFaction)
    SilverHandFaction.SetAlly(GuardFactionWhiterun)
    SilverHandFaction.SetAlly(IsGuardFaction)
    SilverHandFaction.SetAlly(DragonsreachBasementGuards)
    ; stop combat -- just in case
    stopAssaultNpcsCombat() 
    evaluateAllPackages()
    ; bugfix: make the player do not be persecured on whiterun
    freePlayerFromCrime()
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; This function is used change the Wuultrad Wall, so that the framents Fjol
; collected disapear. It happens when the player collect the last frament.
; This function clean up all the dead bodies as well. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function collectFragmentsAndClean()
    Debug.Trace(THIS_FILE + " --  collectFragmentsAndClean()")  
    prepareWulltradWallAfterBattle()
    cleanBattleCorpses()
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; End Silver Hand and Companions NPCs combat  Force the Playes to kill each
; other. The same result are going to happen using the function 
; endSilverHandCompanionsWar() but it may take a while untill all the AI get
; recalculated, wich may lead to weird results. This function forces the 
; combat to stop imediatelly, so when the AI are recalculated, the two fations
; are already ally. BUT  endSilverHandCompanionsWar() MUST be called. If it
; is not, they will continue to kill each other some seconds later.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function stopAssaultNpcsCombat()
    Debug.Trace(THIS_FILE + " -- stop companions combat")
    DSilHand_Utils.stopAllCombatRefAlias(FakeAthis, "FakeAthis", THIS_FILE)
    DSilHand_Utils.stopAllCombatRefAlias(CompBretFrost, "CompBretFrost", THIS_FILE) 
    DSilHand_Utils.stopAllCombatRefAlias(CompImp02, "CompImp02", THIS_FILE)
    DSilHand_Utils.stopAllCombatRefAlias(FakeTorvar, "FakeTorvar", THIS_FILE)
    DSilHand_Utils.stopAllCombatRefAlias(FakeRia, "FakeRia", THIS_FILE) 
    DSilHand_Utils.stopAllCombatRefAlias(FakeVignar, "FakeVignar", THIS_FILE) 
    DSilHand_Utils.stopAllCombatRefAlias(FakeEorlund, "FakeEorlund", THIS_FILE) 
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
    Debug.Trace(THIS_FILE + " -- stop other people combat")
    DSilHand_Utils.stopAllCombatRefAlias(FakeTilma2, "FakeTilma2", THIS_FILE)
    DSilHand_Utils.stopAllCombatRefAlias(FakeBrill, "FakeBrill", THIS_FILE)
    DSilHand_Utils.stopAllCombatRefAlias(Guard01, "Guard01", THIS_FILE)
    DSilHand_Utils.stopAllCombatRefAlias(Guard02, "Guard02", THIS_FILE)
    DSilHand_Utils.stopAllCombatRefAlias(Guard03, "Guard03", THIS_FILE)
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; This routine is used to rightly prepare Kodlak Journal, so Dragonborn can 
; catch it.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function prepareKodlakJournal()
    Debug.Trace(THIS_FILE + " -- prepareKodlakJournal()")
    Debug.Trace(THIS_FILE + "    * KodlaksJournal.GetReference():" + KodlaksJournal.GetReference())
    Debug.Trace(THIS_FILE + "    * Desk.GetReference():" + Desk.GetReference())
    KodlaksJournal.GetReference().Enable()
    Desk.GetReference().AddItem(KodlaksJournal.GetReference())
    Desk.GetReference().SetActorOwner(Game.GetPlayer().GetActorBase())    
Endfunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; After the quest is done, this function must be called to disable all the 
; actor's copies and enable all originals.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function enableOriginals()
    ; Vignar
    DSilHand_Utils.enableActorRefAlias(Vignar, "Vignar", THIS_FILE)
    DSilHand_Utils.disableActorRefAlias(FakeVignar, "FakeVignar", THIS_FILE)
    ; Eorlund 
    DSilHand_Utils.enableActorRefAlias(Eorlund, "Eorlund", THIS_FILE)
    DSilHand_Utils.enableActorRefAlias(FakeEorlund, "FakeEorlund", THIS_FILE)
    ; Brill
    DSilHand_Utils.enableActorRefAlias(Brill, "Brill", THIS_FILE)
    DSilHand_Utils.disableActorRefAlias(FakeBrill, "FakeBrill", THIS_FILE)
    ; Ria
    ;DSilHand_Utils.enableActorRefAlias(Ria, "Ria", THIS_FILE)
    ;DSilHand_Utils.disableActorRefAlias(FakeRia, "FakeRia", THIS_FILE)
    ; Athis
    ;DSilHand_Utils.enableActorRefAlias(Athis, "Athis", THIS_FILE)
    ;DSilHand_Utils.disableActorRefAlias(FakeAthis, "FakeAthis", THIS_FILE)
    ; Tilma     
    ;DSilHand_Utils.enableActorRefAlias(Tilma, "Tilma", THIS_FILE)
    ;DSilHand_Utils.disableActorRefAlias(FakeTilma2, "FakeTilma2", THIS_FILE)
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; **BUGFIX** After the Action DSilHand_M80SceneTravelArmisticeSpeech from the 
; scene DSilHand_M80_SceneArmistice2 is completed, this flag must be set.  
; This method is required because when the dialog DSilHand_M80SA_Topic02
; finishes, it is necessary that the action  
; DSilHand_M80SceneTravelArmisticeSpeech is completed too. 
; If this flag is alread set as true, Fjol does not need to be moved
; via code to the right location. It is necessary because sometimes Fjol may 
; get stucked. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function completeActionSceneTravelArmisticeSpeech()
    Debug.Trace(THIS_FILE + " -- completeActionSceneTravelArmisticeSpeech()") 
    Action2_Fjol_M80SceneTravelArmisticeSpeech_Completed = true
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; **BUGFIX** Ensure Fjol is at the right position when he finishes his 
; dialog. It is rare, but he may get stucked sometimes.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function ensureFjolIsAtTheArmisticeDiscoursePosition()
    if(Action2_Fjol_M80SceneTravelArmisticeSpeech_Completed == false)
        ; force move Fjol
        DSilHand_Utils.moveSingleNpcRefAlias2(fjol, xHeadingFjolListenVignar, "Fjol", THIS_FILE) 
        ; wait 1s just in case
        Utility.Wait(1)
    endif
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Evaluate AI packages of all actors in this quest.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function evaluateAllPackages()
    Debug.Trace(THIS_FILE + " --  evaluateAllPackages()")  
    ; Silver Hands
    Fjol.GetActorReference().EvaluatePackage()
    SENAAR.GetActorReference().EvaluatePackage()
    Hillara.GetActorReference().EvaluatePackage()
    Irronkas.GetActorReference().EvaluatePackage()
    Kurdak.GetActorReference().EvaluatePackage()
    Kylmir.GetActorReference().EvaluatePackage()
    Haknrm.GetActorReference().EvaluatePackage()
    SilverHand1.GetActorReference().EvaluatePackage()
    SilverHand2.GetActorReference().EvaluatePackage()
    SilverHand3.GetActorReference().EvaluatePackage()
    SilverHand4.GetActorReference().EvaluatePackage()
    ; Companions
    CompImp02.GetActorReference().EvaluatePackage()
    CompBretFrost.GetActorReference().EvaluatePackage()
    FakeAthis.GetActorReference().EvaluatePackage()
    FakeRia.GetActorReference().EvaluatePackage()
    FakeTorvar.GetActorReference().EvaluatePackage()
    FakeVignar.GetActorReference().EvaluatePackage()
    FakeEorlund.GetActorReference().EvaluatePackage()
    ; Others
    FakeBrill.GetActorReference().EvaluatePackage()
    FakeTilma2.GetActorReference().EvaluatePackage()
    Guard01.GetActorReference().EvaluatePackage()
    Guard02.GetActorReference().EvaluatePackage()
    Guard03.GetActorReference().EvaluatePackage()
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
        Irronkas.GetActorReference().EquipItem(ArmorSteelPlateBoots, true)
        Irronkas.GetActorReference().EquipItem(ArmorSteelPlateCuirass, true)
        Irronkas.GetActorReference().EquipItem(ArmorSteelPlateGauntlets, true)
        Irronkas.GetActorReference().EquipItem(DSilHand_TemperedSilverGreatsword, true)
    else
        Debug.Trace(THIS_FILE + " **WARNING** Irronkas Alias is EMPTY! -- CANNOT EQUIP PLATE ARMOR", 1)
    endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; This method equip Irronkas with Stell Plate Armor and with a Tempered Silver
; Greatsword.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function givePotionsForSilverhands()
    Debug.Trace(THIS_FILE + " --  givePotionsForSilverhands()")
    Irronkas.GetActorReference().AddItem(RestoreHealth05, 2)
    SENAAR.GetActorReference().AddItem(RestoreHealth05, 3)
    Kylmir.GetActorReference().AddItem(RestoreHealth05, 2)
    Haknrm.GetActorReference().AddItem(RestoreHealth05, 2)
    Kurdak.GetActorReference().AddItem(RestoreHealth05, 2)
    hillara.GetActorReference().AddItem(RestoreHealth05, 3)
    fjol.GetActorReference().AddItem(RestoreHealth05, 3)
    SilverHand1.GetActorReference().AddItem(RestoreHealth05, 2)
    SilverHand2.GetActorReference().AddItem(RestoreHealth05, 2)
    SilverHand3.GetActorReference().AddItem(RestoreHealth05, 2)
    SilverHand4.GetActorReference().AddItem(RestoreHealth05, 2)
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Show and hide the right fragments according to the story.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function prepareWulltradWallBeforeBattle()
    Debug.Trace(THIS_FILE + " --  prepareWulltradWallBeforeBattle()")  
    ; disable WallFrag05, wich is kept by Kodlack
    DSilHand_Utils.disableObject(WallFrag05, "WallFrag05", THIS_FILE)
    ; enable the 3 fragments that should appear -- just in case
    DSilHand_Utils.enableObject(WallFrag02, "WallFrag02", THIS_FILE)
    DSilHand_Utils.enableObject(WallFrag06, "WallFrag06", THIS_FILE)
    DSilHand_Utils.enableObject(WallFrag11, "WallFrag11", THIS_FILE)
    ; disable all the other fragments -- just in case
    DSilHand_Utils.disableObject(WallFrag01, "WallFrag01", THIS_FILE)
    DSilHand_Utils.disableObject(WallFrag03, "WallFrag03", THIS_FILE)
    DSilHand_Utils.disableObject(WallFrag04, "WallFrag04", THIS_FILE)
    DSilHand_Utils.disableObject(WallFrag07, "WallFrag07", THIS_FILE)
    DSilHand_Utils.disableObject(WallFrag08, "WallFrag08", THIS_FILE)
    DSilHand_Utils.disableObject(WallFrag09, "WallFrag09", THIS_FILE)
    DSilHand_Utils.disableObject(WallFrag10, "WallFrag10", THIS_FILE)
    DSilHand_Utils.disableObject(WallFrag12, "WallFrag12", THIS_FILE)      
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Show and hide the right fragments according to the story after the 
; searched for the last fagment on Kodlack desk.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function prepareWulltradWallAfterBattle()
    Debug.Trace(THIS_FILE + " --  prepareWulltradWallAfterBattle()")  
    ; disable the fragments that were enabled  
    DSilHand_Utils.disableObject(WallFrag02, "WallFrag02", THIS_FILE)
    DSilHand_Utils.disableObject(WallFrag06, "WallFrag06", THIS_FILE)
    DSilHand_Utils.disableObject(WallFrag11, "WallFrag11", THIS_FILE)    
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Remove all the dead corpuses form the main hall.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function cleanBattleCorpses()
    Debug.Trace(THIS_FILE + " --  cleanBattleCorpses()")  
    DSilHand_Utils.disableActorRefAliasIfDead(FakeKodlak,    "FakeKodlak",    THIS_FILE)
    DSilHand_Utils.disableActorRefAliasIfDead(FakeTorvar,    "FakeTorvar",    THIS_FILE)
    DSilHand_Utils.disableActorRefAliasIfDead(FakeVilkas,    "FakeVilkas",    THIS_FILE)
    DSilHand_Utils.disableActorRefAliasIfDead(CircleNord01,  "CircleNord01",  THIS_FILE)
    DSilHand_Utils.disableActorRefAliasIfDead(CompImp02,     "CompImp02",     THIS_FILE)
    DSilHand_Utils.disableActorRefAliasIfDead(CompBretFrost, "CompBretFrost", THIS_FILE)
    DSilHand_Utils.disableActorRefAliasIfDead(SilverHand1,   "SilverHand1",   THIS_FILE)
    DSilHand_Utils.disableActorRefAliasIfDead(SilverHand2,   "SilverHand2",   THIS_FILE)
    DSilHand_Utils.disableActorRefAliasIfDead(SilverHand3,   "SilverHand3",   THIS_FILE)
    DSilHand_Utils.disableActorRefAliasIfDead(SilverHand4,   "SilverHand4",   THIS_FILE)
    kodlackAftherDeathCare()
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; This function prepares the body of Kodlack for his funeral.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function kodlackAftherDeathCare()
    Debug.Trace(THIS_FILE + " -- kodlackAftherDeathCare()")
    ; TODO <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    Debug.Trace(THIS_FILE + " -- TODO")
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; **BUGFIX** This is a bugfix function. It must to the stuff necessary to make 
; Whiterun/Skyrim/Tamriel NPCs finendly to the player after the battle ended.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function freePlayerFromCrime()
    Debug.Trace(THIS_FILE + " -- freePlayerFromCrime()")
    CrimeFactionWhiterun.PlayerPayCrimeGold(false, false)
    Game.GetPlayer().StopCombat()
    Game.GetPlayer().StopCombatAlarm()    
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
    Debug.Trace(THIS_FILE + " --  OnUpdateGameTime(): Stage:" + GetState() + " => advance quest stage to " + STAGE_MEET_AT_SECRET_PASSAGE)
    ; completes "Prepare to assault tomorrow at the begining of the dusk near Whiterun"
    SetObjectiveCompleted(STAGE_WAIT_DUSK)
    SetStage(STAGE_MEET_AT_SECRET_PASSAGE)
    ; displays "Meet the men on the secret passage beneth the underforge on Whiterun"
    SetObjectiveDisplayed(STAGE_MEET_AT_SECRET_PASSAGE)
EndEvent


