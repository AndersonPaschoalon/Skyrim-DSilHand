Scriptname DSilHand_M40Helper extends Quest  


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  FUNCTIONS
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
;  Input: none
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







