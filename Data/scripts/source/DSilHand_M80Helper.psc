Scriptname DSilHand_M80Helper extends Quest  
{Routines helper for quest M80.}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ReferenceAlias Property Kurdak  Auto  

ReferenceAlias Property Athis  Auto  

ReferenceAlias Property Brill  Auto  

ReferenceAlias Property CircleNord01  Auto  

ReferenceAlias Property CompBretFrost  Auto  

ReferenceAlias Property CompImp02  Auto  

ReferenceAlias Property Desk  Auto  

ReferenceAlias Property Eorlund  Auto  

ReferenceAlias Property FakeKodlak  Auto  

ReferenceAlias Property FakeTorvar  Auto  

ReferenceAlias Property FakeVilkas  Auto  

ReferenceAlias Property Frag05  Auto  

ReferenceAlias Property Guard01  Auto  

ReferenceAlias Property Guard02  Auto  

ReferenceAlias Property Guard03  Auto  

ReferenceAlias Property Haknrm  Auto  

ReferenceAlias Property Irronkas  Auto  

ReferenceAlias Property Kodlak  Auto  

ReferenceAlias Property KodlaksJournal  Auto  


ReferenceAlias Property Kylmir  Auto  

ReferenceAlias Property Ria  Auto  

ReferenceAlias Property SENAAR  Auto  

ReferenceAlias Property SilverHand1  Auto  

ReferenceAlias Property SilverHand2  Auto  

ReferenceAlias Property SilverHand3  Auto  

ReferenceAlias Property SilverHand4  Auto  

ReferenceAlias Property Tilma  Auto  

ReferenceAlias Property Torvar  Auto  

ReferenceAlias Property Vignar  Auto  

ReferenceAlias Property Vilkas  Auto  

ReferenceAlias Property fjol  Auto  

ReferenceAlias Property hillara  Auto  

ReferenceAlias Property xMarkerAssault01  Auto  

ReferenceAlias Property xMarkerAssault02  Auto  

ReferenceAlias Property xMarkerAssault03  Auto  

ReferenceAlias Property xMarkerAssault04  Auto  

ReferenceAlias Property xMarkerAssault05  Auto  

ReferenceAlias Property xMarkerAssault06  Auto  

ReferenceAlias Property xMarkerAssault07  Auto  

ReferenceAlias Property xMarkerAssault08  Auto  

ReferenceAlias Property xMarkerAssault09  Auto  

ReferenceAlias Property xMarkerAssault10  Auto  

ReferenceAlias Property xMarkerAssault11  Auto  

ReferenceAlias Property xMarkerAssault12  Auto  

ReferenceAlias Property xMarkerAssaultDst  Auto  

ReferenceAlias Property xMarkerFjol  Auto  

ReferenceAlias Property xMarkerHaknrm  Auto  

ReferenceAlias Property xMarkerHillara  Auto  

ReferenceAlias Property xMarkerIrronkas  Auto  

ReferenceAlias Property xMarkerKurdak  Auto  

ReferenceAlias Property xMarkerKylmir  Auto  

ReferenceAlias Property xMarkerSenaar  Auto  

ReferenceAlias Property xMarkerSkyforge01  Auto  

ReferenceAlias Property xMarkerSkyforge02  Auto  

ReferenceAlias Property xMarkerSkyforge03  Auto  

ReferenceAlias Property xMarkerSkyforge04  Auto  

ReferenceAlias Property xMarkerSkyforge05  Auto  

ReferenceAlias Property xMarkerSkyforge06  Auto  

ReferenceAlias Property xMarkerSkyforge07  Auto  

ReferenceAlias Property xMarkerSkyforge08  Auto  

ReferenceAlias Property xMarkerSkyforge09  Auto  

ReferenceAlias Property xMarkerSkyforge10  Auto  

ReferenceAlias Property xMarkerSkyforgeBlacksmith  Auto  

ReferenceAlias Property xMarkerSkyforgeFjolSpeach  Auto  

ReferenceAlias Property xMarkerVignarAthisListen  Auto  

ReferenceAlias Property xMarkerVignarBril  Auto  

ReferenceAlias Property xMarkerVignarFjolListen  Auto  

ReferenceAlias Property xMarkerVignarGuard01  Auto  

ReferenceAlias Property xMarkerVignarGuard02  Auto  

ReferenceAlias Property xMarkerVignarGuard03  Auto  

ReferenceAlias Property xMarkerVignarTilma  Auto  

ReferenceAlias Property xMarkerVignarVignar  Auto  

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
; Enable/Disable the right objects
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function prepareJorrvaskr()
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
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function setAlarmWaitUntilDusk()
    ; on start of Objective 10
    float currentTime =  DSilHand_Utils.GetCurrentHourOfDay() 
    float todayLastingTime = 24 - currentTime
    ; alarms at 6 o'clock
    float timeToAlarm = 18 + todayLastingTime
    ; register alarm
    RegisterForSingleUpdateGameTime(timeToAlarm)
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function moveNpcsToSecretPassage()
    ; Move non-followers NPCS
    DSilHand_Utils.moveSingleNpcRefAlias(Fjol, xMarkerFjol, "Fjol", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(Haknrm, xMarkerHaknrm, "Haknrm", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(Irronkas, xMarkerIrronkas, "Irronkas", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(Kurdak, xMarkerKurdak, "Kurdak", THIS_FILE)
    ; Move Followers
    bool hillaraIsFollower = false
    bool senaarIsFollower = false
    if(!hillaraIsFollower)
        DSilHand_Utils.moveSingleNpcRefAlias(Hillara, xMarkerHillara, "Hillara", THIS_FILE)
    endif
    if(!senaarIsFollower)
        DSilHand_Utils.moveSingleNpcRefAlias(SENAAR, xMarkerSenaar, "Sennar", THIS_FILE)
    endif
    ; Enable random NPCS
    DSilHand_Utils.enableActorAliasRef(SilverHand1, "SilverHand1", THIS_FILE)
    DSilHand_Utils.enableActorAliasRef(SilverHand2, "SilverHand2", THIS_FILE)
    DSilHand_Utils.enableActorAliasRef(SilverHand3, "SilverHand3", THIS_FILE)
    DSilHand_Utils.enableActorAliasRef(SilverHand4, "SilverHand4", THIS_FILE)
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function startSilverhandAssault()
    ; Move NPCs to whiterun
    DSilHand_Utils.moveSingleNpcRefAlias(Fjol, xMarkerAssault01, "Fjol", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(Haknrm, xMarkerAssault02, "Haknrm", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(Irronkas, xMarkerAssault03, "Irronkas", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(Kurdak, xMarkerAssault04, "Kurdak", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(Hillara, xMarkerAssault05, "Hillara", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(SENAAR, xMarkerAssault06, "Sennar", THIS_FILE)
    DSilHand_Utils.moveSingleNpc(Game.GetPlayer(), xMarkerAssault07.GetReference(), "Sennar", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(SilverHand1, xMarkerAssault08, "SilverHand1", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(SilverHand2, xMarkerAssault09, "SilverHand2", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(SilverHand3, xMarkerAssault10, "SilverHand3", THIS_FILE)
    DSilHand_Utils.moveSingleNpcRefAlias(SilverHand4, xMarkerAssault11, "SilverHand4", THIS_FILE)
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnUpdate()
	; completes "Prepare to assault tomorrow at the begining of the dusk near Whiterun"
	SetObjectiveCompleted(STAGE_WAIT_DUSK)
	SetStage(STAGE_MEET_AT_SECRET_PASSAGE)
	; displays "M0eet the men on the secret passage beneth the underforge on Whiterun"
	SetObjectiveDisplayed(STAGE_MEET_AT_SECRET_PASSAGE)
EndEvent













