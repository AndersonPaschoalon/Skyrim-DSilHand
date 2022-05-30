Scriptname DSilHand_M40Helper extends Quest  


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Main actors reference aliases
;

ReferenceAlias Property FarkasOriginal  Auto  
{Original reference to Farkas NPC, will be disabled}

ReferenceAlias Property Farkas  Auto  
{Copy of Farkas, will be used on the quest}

ReferenceAlias Property Nord01  Auto  
{Shild Brother of Farkas}

ReferenceAlias Property xMarkerCompStartPoint  Auto  
{where the companions are moved on the start of the quest}

ReferenceAlias Property Fjol  Auto  
{Silver Hand soldier reference}

;
; Farkas Shield Brother "Fake Dragonborn"
;

Actor Property DSilHand_CompanionShieldMAltmer  Auto  
{Male Altmer version of Farkas's Shield brother.}

Actor Property DSilHand_CompanionShieldMArgonian  Auto  
{Male Argonian version of Farkas's Shield brother.}

Actor Property DSilHand_CompanionShieldMBosmer  Auto  
{Male Bosmer version of Farkas's Shield brother.}

Actor Property DSilHand_CompanionShieldMBreton  Auto  
{Male Breton version of Farkas's Shield brother.}

Actor Property DSilHand_CompanionShieldMDunmer  Auto  
{Male Dunmer version of Farkas's Shield brother.}

Actor Property DSilHand_CompanionShieldMImperial  Auto  
{Male Imperial version of Farkas's Shield brother.}

Actor Property DSilHand_CompanionShieldMKhajiit  Auto  
{Male Khajiit version of Farkas's Shield brother.}

Actor Property DSilHand_CompanionShieldMNord  Auto  
{Male Nord version of Farkas's Shield brother.}

Actor Property DSilHand_CompanionShieldMOrsimer  Auto  
{Male Orsimer version of Farkas's Shield brother.}

Actor Property DSilHand_CompanionShieldMRedguard  Auto  
{Male Redguard version of Farkas's Shield brother.}

Actor Property DSilHand_CompanionShieldFAltmer  Auto  
{Famale Altmer version of Farkas's Shield brother.}

Actor Property DSilHand_CompanionShieldFArgonians  Auto  
{Famale Argonians version of Farkas's Shield brother.}

Actor Property DSilHand_CompanionShieldFBosmer  Auto  
{Famale Bosmer version of Farkas's Shield brother.}

Actor Property DSilHand_CompanionShieldFBreton  Auto  
{Famale Breton version of Farkas's Shield brother.}

Actor Property DSilHand_CompanionShieldFDunmer  Auto  
{Famale Dunmer version of Farkas's Shield brother.}

Actor Property DSilHand_CompanionShieldFImperial  Auto  
{Famale Imperial version of Farkas's Shield brother.}

Actor Property DSilHand_CompanionShieldFKhajiit  Auto  
{Famale Khajiit version of Farkas's Shield brother.}

Actor Property DSilHand_CompanionShieldFNord  Auto  
{Famale Nord version of Farkas's Shield brother.}

Actor Property DSilHand_CompanionShieldFOrsimer  Auto  
{Famale Orsimer version of Farkas's Shield brother.}

Actor Property DSilHand_CompanionShieldFRedguard  Auto  
{Famale Redguard version of Farkas's Shield brother.}

;
; Silver Hands actors and xMarkers
;

ReferenceAlias Property Silver01  Auto  
{Silver Hand soldier reference}

ReferenceAlias Property Silver02  Auto  
{Silver Hand soldier reference}

ReferenceAlias Property Silver03  Auto  
{Silver Hand soldier reference}

ReferenceAlias Property Silver04  Auto  
{Silver Hand soldier reference}

ReferenceAlias Property Silver05  Auto  
{Silver Hand soldier reference}

ReferenceAlias Property Silver06  Auto  
{Silver Hand soldier reference}

ReferenceAlias Property Silver07  Auto  
{Silver Hand soldier reference}

ReferenceAlias Property Silver08  Auto  
{Silver Hand soldier reference}

ReferenceAlias Property Silver09  Auto  
{Silver Hand soldier reference}

ReferenceAlias Property Silver10  Auto  
{Silver Hand soldier reference}

ReferenceAlias Property Silver11  Auto  
{Silver Hand soldier reference}

ReferenceAlias Property Silver12  Auto  
{Silver Hand soldier reference}

ReferenceAlias Property SilverH01  Auto  
{Silver Hand soldier reference}

ReferenceAlias Property SilverH02  Auto  
{Silver Hand soldier reference}

ReferenceAlias Property SilverH03  Auto  
{Silver Hand soldier reference}

ReferenceAlias Property SilverH04  Auto  
{Silver Hand soldier reference}

ReferenceAlias Property xMarkerFjol  Auto  
{Reference of a xMarker on Driftshade Refugee, where the actor will be placed at the end of the quest}

ReferenceAlias Property xMarkerS01  Auto  
{Reference of a xMarker on Driftshade Refugee, where the actor will be placed at the end of the quest}

ReferenceAlias Property xMarkerS02  Auto  
{Reference of a xMarker on Driftshade Refugee, where the actor will be placed at the end of the quest}

ReferenceAlias Property xMarkerS03  Auto  
{Reference of a xMarker on Driftshade Refugee, where the actor will be placed at the end of the quest}

ReferenceAlias Property xMarkerS04  Auto  
{Reference of a xMarker on Driftshade Refugee, where the actor will be placed at the end of the quest}

ReferenceAlias Property xMarkerS05  Auto  
{Reference of a xMarker on Driftshade Refugee, where the actor will be placed at the end of the quest}

ReferenceAlias Property xMarkerS06  Auto  
{Reference of a xMarker on Driftshade Refugee, where the actor will be placed at the end of the quest}

ReferenceAlias Property xMarkerS07  Auto  
{Reference of a xMarker on Driftshade Refugee, where the actor will be placed at the end of the quest}

ReferenceAlias Property xMarkerS08  Auto  
{Reference of a xMarker on Driftshade Refugee, where the actor will be placed at the end of the quest}

ReferenceAlias Property xMarkerS09  Auto  
{Reference of a xMarker on Driftshade Refugee, where the actor will be placed at the end of the quest}

ReferenceAlias Property xMarkerS10  Auto  
{Reference of a xMarker on Driftshade Refugee, where the actor will be placed at the end of the quest}

ReferenceAlias Property xMarkerS11  Auto  
{Reference of a xMarker on Driftshade Refugee, where the actor will be placed at the end of the quest}

ReferenceAlias Property xMarkerS12  Auto  
{Reference of a xMarker on Driftshade Refugee, where the actor will be placed at the end of the quest}

ReferenceAlias Property xMarkerS13  Auto  
{Reference of a xMarker on Driftshade Refugee, where the actor will be placed at the end of the quest}

ReferenceAlias Property xMarkerS14  Auto  
{Reference of a xMarker on Driftshade Refugee, where the actor will be placed at the end of the quest}

ReferenceAlias Property xMarkerS15  Auto  
{Reference of a xMarker on Driftshade Refugee, where the actor will be placed at the end of the quest}

ReferenceAlias Property xMarkerS16  Auto  
{Reference of a xMarker on Driftshade Refugee, where the actor will be placed at the end of the quest}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

String THIS_FILE = "(DSilHand_M40Helper.psc) "
int    OBJECTIVE_EXPLORE_DUSTMANS_CAIRN = 20
int    OBJECTIVE_KILL_FARKAS = 30
int    STAGE_KILL_FARKAS = 30
int    ACTOR_FEMALE = 1
int    ACTOR_MALE = 0
int    ACTOR_NO_GENDER = -1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  PUBLIC FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Input: delay time this function will take to complete the objective
; 
; Setup the enviroment of the companions atack:
; 1 . Move Farkas and Nor01 to the starting point and disable original farkas
; 2.  Wait the Delay time, to complete the objective "Explore dustmans cairn"
; 3.  Complete the objective "Explore dustmans cairn" and setup "Kill Farkas"
; 4.  Make them start to run to the player
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function companionsAttack(int delayTime)
    Debug.Trace(THIS_FILE + "-- companionsAttack()")
    ; 1 . Move Farkas and Nor01 to the starting point and disable original farkas
    Debug.Trace(THIS_FILE + " -- 1 . Move Farkas and Nor01 to the starting point and disable original farkas")
    Actor farkasOriginalObj = FarkasOriginal.GetActorRef() as Actor
    Actor farkasObj = Farkas.GetActorRef() as Actor
    Actor nord01Obj = Nord01.GetActorRef() as Actor
    ObjectReference markStart = xMarkerCompStartPoint.GetReference() as ObjectReference
    if(farkasObj == None || nord01Obj == None|| markStart == None)
        String msgBox1 = "**ERROR** SOME ALIASES FROM QUEST M40 ARE EMPTY!. Please contact and send the game logs from MyGames to the mod developer"
        Debug.MessageBox(msgBox1)
        Debug.Trace(THIS_FILE + msgBox1)
        if(farkasObj == None)
            Debug.Trace(THIS_FILE + "**ERROR** farkasObj is NULL", 2)
        endif
        if(nord01Obj == None)
            Debug.Trace(THIS_FILE + "**ERROR** nord01Obj is NULL", 2) 
        endif
        if(markStart == None)
            Debug.Trace(THIS_FILE + "**ERROR** markStart is NULL", 2) 
        endif 
        Debug.Trace(THIS_FILE + "**ERROR** farkasObj:<" + farkasObj + ">", 2) 
        Debug.Trace(THIS_FILE + "**ERROR** Farkas:<" + Farkas + ">", 2) 
        Debug.Trace(THIS_FILE + "**ERROR** markStart:<" + markStart + ">", 2) 
        Debug.Trace(THIS_FILE + "**ERROR** xMarkerCompStartPoint:<" + xMarkerCompStartPoint + ">", 2) 
        Debug.Trace(THIS_FILE + "**ERROR** Nord01:<" + Nord01 + ">", 2) 
        Debug.Trace(THIS_FILE + "**ERROR** nord01Obj:<" + nord01Obj + ">", 2)                        
        return false
    endif
    if (farkasOriginalObj != None)
        farkasOriginalObj.Disable()
    else 
        String msgBox2 = "**ERROR** ALIAS FARKAS IS NULL.  Please contact and send the game logs from MyGames to the mod developer"
        Debug.MessageBox(msgBox2)
        Debug.Trace(THIS_FILE + msgBox2)
        Debug.Trace(THIS_FILE + "**ERROR** farkasOriginalObj:<" + farkasOriginalObj + ">", 2) 
        Debug.Trace(THIS_FILE + "**ERROR** FarkasOriginal:<" + FarkasOriginal + ">", 2)         
        return false
    endif
    ;moveSingleNpc(farkasObj, markStart, "Farkas -> markStart")
    DSilHand_Utils.moveSingleNpc(farkasObj, markStart, "FakeFarkas", THIS_FILE)
    ;moveSingleNpc(nord01Obj, markStart, "Nord01 -> markStart")
    DSilHand_Utils.moveSingleNpc(nord01Obj, markStart, "Nord01 (FakeFarkas Shield Brother)", THIS_FILE)
    ; 2.  Wait the Delay time, to complete the objective "Explore dustmans cairn"
    Debug.Trace(THIS_FILE + " -- Wait the Delay time, to complete the objective Explore dustmans cairn")
    if (delayTime > 0)
        Utility.Wait(delayTime) 
    endif
    ; 3.  Complete the objective "Explore dustmans cairn" and setup "Kill Farkas"
    ; complete objective
    Debug.Trace(THIS_FILE + " -- 5.  Complete the objective Explore dustmans cairn and setup Kill Farkas")
    Debug.Trace(THIS_FILE + " -- Set Objective Completed/Displayed OBJECTIVE_EXPLORE_DUSTMANS_CAIRN/OBJECTIVE_KILL_FARKAS"); 
    SetObjectiveCompleted(OBJECTIVE_EXPLORE_DUSTMANS_CAIRN)
    ; advance quest
    Debug.Trace(THIS_FILE + " -- Set Stage STAGE_KILL_FARKAS");
    SetStage(STAGE_KILL_FARKAS)
    SetObjectiveDisplayed(OBJECTIVE_KILL_FARKAS)
    ; 4.  Make them start to run to the player
    Debug.Trace(THIS_FILE + " -- 2.  Make them start to run to the player")
    farkasObj.EvaluatePackage()
    nord01Obj.EvaluatePackage()
    bool farkasObjRet = farkasObj.PathToReference(Game.GetPlayer(), 1)
    bool nord01ObjRet = nord01Obj.PathToReference(Game.GetPlayer(), 1)
    return true   
endfunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: none
; 
; Move all survivors silver hand to Driftshade, after completing the quest.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function moveSilverToDriftshade()
    Debug.Trace(THIS_FILE + "-- moveSilverToDriftshade()")
    ; Moving Fjol
    DSilHand_Utils.moveSingleNpcRefAlias(Fjol, xMarkerFjol, "Fjol", THIS_FILE) 
    ; Moving Silver hand soldiers
    DSilHand_Utils.moveNpcRefAliasIfAlive(Silver01, xMarkerS01, "Silver01", THIS_FILE) 
    DSilHand_Utils.moveNpcRefAliasIfAlive(Silver02, xMarkerS02, "Silver02", THIS_FILE) 
    DSilHand_Utils.moveNpcRefAliasIfAlive(Silver03, xMarkerS03, "Silver03", THIS_FILE) 
    DSilHand_Utils.moveNpcRefAliasIfAlive(Silver04, xMarkerS04, "Silver04", THIS_FILE) 
    DSilHand_Utils.moveNpcRefAliasIfAlive(Silver05, xMarkerS05, "Silver05", THIS_FILE) 
    DSilHand_Utils.moveNpcRefAliasIfAlive(Silver06, xMarkerS06, "Silver06", THIS_FILE) 
    DSilHand_Utils.moveNpcRefAliasIfAlive(Silver07, xMarkerS07, "Silver07", THIS_FILE) 
    DSilHand_Utils.moveNpcRefAliasIfAlive(Silver08, xMarkerS08, "Silver08", THIS_FILE) 
    DSilHand_Utils.moveNpcRefAliasIfAlive(Silver09, xMarkerS09, "Silver09", THIS_FILE) 
    DSilHand_Utils.moveNpcRefAliasIfAlive(Silver10, xMarkerS10, "Silver10", THIS_FILE) 
    DSilHand_Utils.moveNpcRefAliasIfAlive(Silver11, xMarkerS11, "Silver11", THIS_FILE) 
    DSilHand_Utils.moveNpcRefAliasIfAlive(Silver12, xMarkerS12, "Silver12", THIS_FILE) 
    DSilHand_Utils.moveNpcRefAliasIfAlive(SilverH01, xMarkerS13, "SilverH01", THIS_FILE) 
    DSilHand_Utils.moveNpcRefAliasIfAlive(SilverH02, xMarkerS14, "SilverH02", THIS_FILE) 
    DSilHand_Utils.moveNpcRefAliasIfAlive(SilverH03, xMarkerS15, "SilverH03", THIS_FILE) 
    DSilHand_Utils.moveNpcRefAliasIfAlive(SilverH04, xMarkerS16, "SilverH04", THIS_FILE)  
endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: none
; 
; Setup Farkas Shield brother to match Dragonborn sex and race.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function setupQuestAliases()
    Debug.Trace(THIS_FILE + "-- setupQuestAliases()")
    ; Is the player male?
    ActorBase PlayerBase = Game.GetPlayer().GetActorBase()
    Debug.Trace(THIS_FILE + "-- PlayerBase.GetSex():" + PlayerBase.GetSex())
    if (PlayerBase.GetSex() == ACTOR_MALE)
        Debug.Trace(THIS_FILE + "-- Player is MALE")
        ; Change reference alias reference for male player.
        if (Game.GetPlayer().GetRace() == DSilHand_CompanionShieldMAltmer.GetRace())
            Debug.Trace(THIS_FILE + "-- Player Race is Altmer")
            Nord01.ForceRefTo(DSilHand_CompanionShieldMAltmer as ObjectReference)
        elseif (Game.GetPlayer().GetRace() == DSilHand_CompanionShieldMArgonian.GetRace())
            Debug.Trace(THIS_FILE + "-- Player Race is Argonian")
            Nord01.ForceRefTo(DSilHand_CompanionShieldMArgonian as ObjectReference)
        elseif (Game.GetPlayer().GetRace() == DSilHand_CompanionShieldMBosmer.GetRace())
            Debug.Trace(THIS_FILE + "-- Player Race is Bosmer")
            Nord01.ForceRefTo(DSilHand_CompanionShieldMBosmer as ObjectReference)
        elseif (Game.GetPlayer().GetRace() == DSilHand_CompanionShieldMBreton.GetRace())
            Debug.Trace(THIS_FILE + "-- Player Race is Breton")
            Nord01.ForceRefTo(DSilHand_CompanionShieldMBreton as ObjectReference)
        elseif (Game.GetPlayer().GetRace() == DSilHand_CompanionShieldMDunmer.GetRace())
            Debug.Trace(THIS_FILE + "-- Player Race is Dunmer")
            Nord01.ForceRefTo(DSilHand_CompanionShieldMDunmer as ObjectReference)
        elseif (Game.GetPlayer().GetRace() == DSilHand_CompanionShieldMImperial.GetRace())
            Debug.Trace(THIS_FILE + "-- Player Race is Imperial")
            Nord01.ForceRefTo(DSilHand_CompanionShieldMImperial as ObjectReference)
        elseif (Game.GetPlayer().GetRace() == DSilHand_CompanionShieldMKhajiit.GetRace())
            Debug.Trace(THIS_FILE + "-- Player Race is Khajiit")
            Nord01.ForceRefTo(DSilHand_CompanionShieldMKhajiit as ObjectReference)
        elseif (Game.GetPlayer().GetRace() == DSilHand_CompanionShieldMNord.GetRace())
            Debug.Trace(THIS_FILE + "-- Player Race is Nord")
            Nord01.ForceRefTo(DSilHand_CompanionShieldMNord as ObjectReference)
        elseif (Game.GetPlayer().GetRace() == DSilHand_CompanionShieldMOrsimer.GetRace())
            Debug.Trace(THIS_FILE + "-- Player Race is Orsimer")
            Nord01.ForceRefTo(DSilHand_CompanionShieldMOrsimer as ObjectReference)
        elseif (Game.GetPlayer().GetRace() == DSilHand_CompanionShieldMRedguard.GetRace())
            Debug.Trace(THIS_FILE + "-- Player Race is Redguard")
            Nord01.ForceRefTo(DSilHand_CompanionShieldMRedguard as ObjectReference)
        endif
    else
        Debug.Trace("-- Player is FEMALE: change Alias for Farkas Shield Brother!")
        ; Change reference alias reference for male player.
        if (Game.GetPlayer().GetRace() == DSilHand_CompanionShieldFAltmer.GetRace())
            Debug.Trace(THIS_FILE + "-- Player Race is Altmer")
            Nord01.ForceRefTo(DSilHand_CompanionShieldFAltmer as ObjectReference)
        elseif (Game.GetPlayer().GetRace() == DSilHand_CompanionShieldFArgonians.GetRace())
            Debug.Trace(THIS_FILE + "-- Player Race is Argonian")
            Nord01.ForceRefTo(DSilHand_CompanionShieldFArgonians as ObjectReference)
        elseif (Game.GetPlayer().GetRace() == DSilHand_CompanionShieldFBosmer.GetRace())
            Debug.Trace(THIS_FILE + "-- Player Race is Bosmer")
            Nord01.ForceRefTo(DSilHand_CompanionShieldFBosmer as ObjectReference)
        elseif (Game.GetPlayer().GetRace() == DSilHand_CompanionShieldFBreton.GetRace())
            Debug.Trace(THIS_FILE + "-- Player Race is Breton")
            Nord01.ForceRefTo(DSilHand_CompanionShieldFBreton as ObjectReference)
        elseif (Game.GetPlayer().GetRace() == DSilHand_CompanionShieldFDunmer.GetRace())
            Debug.Trace(THIS_FILE + "-- Player Race is Dunmmer")
            Nord01.ForceRefTo(DSilHand_CompanionShieldFDunmer as ObjectReference)
        elseif (Game.GetPlayer().GetRace() == DSilHand_CompanionShieldFImperial.GetRace())
            Debug.Trace(THIS_FILE + "-- Player Race is Imperial")
            Nord01.ForceRefTo(DSilHand_CompanionShieldFImperial as ObjectReference)
        elseif (Game.GetPlayer().GetRace() == DSilHand_CompanionShieldFKhajiit.GetRace())
            Debug.Trace(THIS_FILE + "-- Player Race is Khajiit")
            Nord01.ForceRefTo(DSilHand_CompanionShieldFKhajiit as ObjectReference)
        elseif (Game.GetPlayer().GetRace() == DSilHand_CompanionShieldFNord.GetRace())
            Debug.Trace(THIS_FILE + "-- Player Race is Nord")
            Nord01.ForceRefTo(DSilHand_CompanionShieldFNord as ObjectReference)
        elseif (Game.GetPlayer().GetRace() == DSilHand_CompanionShieldFOrsimer.GetRace())
            Debug.Trace(THIS_FILE + "-- Player Race is Orsimer")
            Nord01.ForceRefTo(DSilHand_CompanionShieldFOrsimer as ObjectReference)
        elseif (Game.GetPlayer().GetRace() == DSilHand_CompanionShieldFRedguard.GetRace())
            Debug.Trace(THIS_FILE + "-- Player Race is Redguard")
            Nord01.ForceRefTo(DSilHand_CompanionShieldFRedguard as ObjectReference)
        endif
    endIf
    Debug.Trace(THIS_FILE + "-- Farkas Shield Brother Reference Alias: " + Nord01)
endfunction






