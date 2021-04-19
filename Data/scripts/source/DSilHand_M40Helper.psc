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
; Input: Actor npc - NPC to be moved
; Input: ObjectReference marker - ObjectReference to the marker the NPC will
;        be moved
; Input: String logInfo - information about the NPC and Marker, to be loged.
; 
; Function to move a single NPC to a marker.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function moveSingleNpc(Actor npc, ObjectReference marker, String logInfo)
    if( (npc != None) && (marker != None))
        Debug.Trace(THIS_FILE + " moving NPC " + logInfo)
        npc.MoveTo(marker)
        npc.Enable()
        npc.SetPosition(marker.GetPositionX(), marker.GetPositionY(), marker.GetPositionZ())
    else 
        if(npc == None)
            Debug.Trace(THIS_FILE + " **ERROR** npc param is EMPTY: " + logInfo, 2)
        else
            Debug.Trace(THIS_FILE + " **ERROR** marker param is EMPTY: " + logInfo, 2)
        endif
    endif
endFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Input: delay time this function will take to complete the objective
; 
; Setup the enviroment of the companions atack:
; 1 . Move Farkas and Nor01 to the starting point
; 2.  Make them start to run to the player
; 3.  Make them invulnerable
; 4.  Wait the Delay time, to complete the objective "Explore dustmans cairn"
; 5.  Complete the objective "Explore dustmans cairn" and setup "Kill Farkas"
; 6.  Make them vulnerable once again
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
    moveSingleNpc(farkasObj, markStart, "Farkas -> markStart")
    moveSingleNpc(nord01Obj, markStart, "Nord01 -> markStart")
    ; 4.  Wait the Delay time, to complete the objective "Explore dustmans cairn"
    Debug.Trace(THIS_FILE + " -- Wait the Delay time, to complete the objective Explore dustmans cairn")
    if (delayTime > 0)
        Utility.Wait(delayTime) 
    endif
    ; 2.  Make them start to run to the player
    Debug.Trace(THIS_FILE + " -- 2.  Make them start to run to the player")
    farkasObj.EvaluatePackage()
    nord01Obj.EvaluatePackage()
    bool farkasObjRet = farkasObj.PathToReference(Game.GetPlayer(), 1)
    bool nord01ObjRet = nord01Obj.PathToReference(Game.GetPlayer(), 1)
    ; 3.  Make them invulnerable
    Debug.Trace(THIS_FILE + " -- 3.  Make them invulnerable")    
    farkasObj.GetActorBase().SetInvulnerable(true)
    nord01Obj.GetActorBase().SetInvulnerable(true)
    ; 5.  Complete the objective "Explore dustmans cairn" and setup "Kill Farkas"
    Debug.Trace(THIS_FILE + " -- 5.  Complete the objective Explore dustmans cairn and setup Kill Farkas")
    Debug.Trace(THIS_FILE + " -- Set Stage STAGE_KILL_FARKAS");
    SetStage(STAGE_KILL_FARKAS)
    Debug.Trace(THIS_FILE + " -- Set Objective Completed/Displayed OBJECTIVE_EXPLORE_DUSTMANS_CAIRN/OBJECTIVE_KILL_FARKAS"); 
    SetObjectiveCompleted(OBJECTIVE_EXPLORE_DUSTMANS_CAIRN)
    SetObjectiveDisplayed(OBJECTIVE_KILL_FARKAS)
    ; 6.  Make them vulnerable once again   
    Debug.Trace(THIS_FILE + " -- 6.  Make them vulnerable once again")    
    farkasObj.GetActorBase().SetInvulnerable(false)
    nord01Obj.GetActorBase().SetInvulnerable(false)  
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
    Actor fjolObj = Fjol.GetActorRef() as Actor
    ObjectReference fjolMarker = xMarkerFjol.GetReference() as ObjectReference
    moveSingleNpc(fjolObj, fjolMarker, "Moving Fjol from DUSTMANS CAIRN to DRIFTSHADE REFUGEE: FJOL => DRIFTSHADE XMARKER")
    ; Moving Silver hand soldiers
    String moveMsg = "Moving Silverhand soldier from DUSTMANS CAIRN to DRIFTSHADE REFUGEE "
    Actor s01 = Silver01.GetActorRef() as Actor
    Actor s02 = Silver02.GetActorRef() as Actor
    Actor s03 = Silver03.GetActorRef() as Actor
    Actor s04 = Silver04.GetActorRef() as Actor
    Actor s05 = Silver05.GetActorRef() as Actor
    Actor s06 = Silver06.GetActorRef() as Actor
    Actor s07 = Silver07.GetActorRef() as Actor
    Actor s08 = Silver08.GetActorRef() as Actor
    Actor s09 = Silver09.GetActorRef() as Actor
    Actor s10 = Silver10.GetActorRef() as Actor
    Actor s11 = Silver01.GetActorRef() as Actor
    Actor s12 = Silver01.GetActorRef() as Actor
    Actor s13 = SilverH01.GetActorRef() as Actor
    Actor s14 = SilverH02.GetActorRef() as Actor
    Actor s15 = SilverH03.GetActorRef() as Actor
    Actor s16 = SilverH04.GetActorRef() as Actor
    ObjectReference m01 = xMarkerS01.GetReference() as ObjectReference
    ObjectReference m02 = xMarkerS02.GetReference() as ObjectReference
    ObjectReference m03 = xMarkerS03.GetReference() as ObjectReference
    ObjectReference m04 = xMarkerS04.GetReference() as ObjectReference
    ObjectReference m05 = xMarkerS05.GetReference() as ObjectReference
    ObjectReference m06 = xMarkerS06.GetReference() as ObjectReference
    ObjectReference m07 = xMarkerS07.GetReference() as ObjectReference
    ObjectReference m08 = xMarkerS08.GetReference() as ObjectReference
    ObjectReference m09 = xMarkerS09.GetReference() as ObjectReference
    ObjectReference m10 = xMarkerS10.GetReference() as ObjectReference
    ObjectReference m11 = xMarkerS11.GetReference() as ObjectReference
    ObjectReference m12 = xMarkerS12.GetReference() as ObjectReference
    ObjectReference m13 = xMarkerS13.GetReference() as ObjectReference
    ObjectReference m14 = xMarkerS14.GetReference() as ObjectReference
    ObjectReference m15 = xMarkerS15.GetReference() as ObjectReference
    ObjectReference m16 = xMarkerS16.GetReference() as ObjectReference
    moveSingleNpc(s01, m01, moveMsg + "s01 => m01")
    moveSingleNpc(s02, m02, moveMsg + "s02 => m02")
    moveSingleNpc(s03, m03, moveMsg + "s03 => m03")
    moveSingleNpc(s04, m04, moveMsg + "s04 => m04")
    moveSingleNpc(s05, m05, moveMsg + "s05 => m05")
    moveSingleNpc(s06, m06, moveMsg + "s06 => m06")
    moveSingleNpc(s07, m07, moveMsg + "s07 => m07")
    moveSingleNpc(s08, m08, moveMsg + "s08 => m08")
    moveSingleNpc(s09, m09, moveMsg + "s09 => m09")
    moveSingleNpc(s10, m10, moveMsg + "s10 => m10")
    moveSingleNpc(s11, m11, moveMsg + "s11 => m11")
    moveSingleNpc(s12, m12, moveMsg + "s12 => m12")
    moveSingleNpc(s13, m13, moveMsg + "s13 => m13")
    moveSingleNpc(s14, m14, moveMsg + "s14 => m14")
    moveSingleNpc(s15, m15, moveMsg + "s15 => m15")
    moveSingleNpc(s16, m16, moveMsg + "s16 => m16")
    s01.EnableAI(false)
endfunction







