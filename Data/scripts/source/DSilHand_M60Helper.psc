Scriptname DSilHand_M60Helper extends Quest  
{DSilHand_M60Helper Helper functions for M60 quest}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ReferenceAlias Property Alias_CompBret1  Auto  
{Alias_CompBret1}

ReferenceAlias Property Alias_CompImp1  Auto  
{Alias_CompImp1}

ReferenceAlias Property Alias_CompNord3  Auto  
{Alias_CompNord3}

ReferenceAlias Property Alias_CompNord4  Auto  
{Alias_CompNord4}

ReferenceAlias Property Alias_CompRed1  Auto  
{Alias_CompRed1}

ReferenceAlias Property Alias_CompRed2  Auto  
{Alias_CompRed2}

ReferenceAlias Property Alias_Aela  Auto  
{Alias_Aela}

ReferenceAlias Property Alias_Skjol  Auto  
{Alias_Skjol}

ObjectReference Property markCompNord3  Auto  
{markCompNord3 reference to xMarker for Companion Nord 2 for quest M60.}

ObjectReference Property markCompNord4  Auto  
{markCompNord4 reference to xMarker for Companion Nord 2 for quest M60.}

ObjectReference Property markCompRed1  Auto  
{markCompRed1 reference to xMarker for Companion Redguard 1 for quest M60.}

ObjectReference Property markCompRed2  Auto  
{markCompRed2 reference to xMarker for Companion Redguard 2 for quest M60.}

ObjectReference Property markAela  Auto  
{markAela reference to xMarker for Aela for quest M60.}

ObjectReference Property markSkjol  Auto  
{markSkjol reference to xMarker for Skjol for quest M60.}

ObjectReference Property wildWerewolf1  Auto  
{Reference to the Wild Werewolf 1 from the quest M60. }

ObjectReference Property wildWerewolf2  Auto  
{Reference to the Wild Werewolf 2 from the quest M60. }

ObjectReference Property DSilHand_GallowsBarredDoor  Auto  
{DSilHand_GallowsBarredDoor reference force the door be closed on the Quest M60.}

ObjectReference Property DSilHand_GallowsDoorBar  Auto  
{DSilHand_GallowsDoorBar Bar for GallowsBarredDoor. It forces the door to be closed and barred on the quest M60.}

;ObjectReference Property DSilHand_GallowsImpJailDoor  Auto  
;{DSilHand_GallowsImpJailDoor Reference to the Jail whre the Werewolf prisioner is located.}

ObjectReference Property DSilHand_GallowsImpJailDoor01  Auto  
{DSilHand_GallowsImpJailDoor01 Reference to the Jail whre the Werewolf prisioner is located.}

Quest Property DSilHand_M60Retaliation  Auto  
{Reference to the script Owning Quest.}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

String THIS_FILE = "(DSilHand_M60Helper.psc) "
Int KILL_ALL_INVADERS_STAGE = 20
Int KILL_ALL_INVADERS_NEXT = 30

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Private: Tells if the invaders outside are all dead
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function invadersOutsideAreDead()
    Debug.Trace(THIS_FILE + "-- invadersOutsideAreDead()")
    Actor CompBret1 = Alias_CompBret1.GetReference() as Actor
    Actor CompImp1 = Alias_CompImp1.GetReference() as Actor
    if( (CompBret1 == None) || (CompImp1 == None) )
        Debug.Trace(THIS_FILE + " ** ERROR ** SOME REFERENCES ARE EMPTY!!", 2)
        Debug.Trace(THIS_FILE + " -- Script references:", 2)
        Debug.Trace(THIS_FILE + "    * CompBret1: <" + CompBret1 + ">", 2)
        Debug.Trace(THIS_FILE + "    * CompImp1: <" + CompImp1 + ">", 2)
        Debug.MessageBox("FATAL ERROR ON QUEST M60: EMPTY REFERENCES")
    else 
    
        if( (CompBret1.IsDead() == true) && (CompImp1.IsDead() == true))
            Debug.Trace(THIS_FILE + " -- All invaders OUTSIDE are dead!")
            return True
        endif
        Debug.Trace(THIS_FILE + " -- Invaders OUTSIDE IsDead() result:")
        Debug.Trace(THIS_FILE + "    * CompBret1: <" + CompBret1.IsDead() + ">")
        Debug.Trace(THIS_FILE + "    * CompImp1: <" + CompImp1.IsDead() + ">")
    endif  
    return false
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Private: Tells if the invaders inside gallows rock (except the wild werewolves)
; are all dead.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function invadersInsideAreDead()
    Debug.Trace(THIS_FILE + "-- invadersInsideAreDead()")
    Actor CompNord3 = Alias_CompNord3.GetReference() as Actor
    Actor CompNord4 = Alias_CompNord4.GetReference() as Actor
    Actor CompRed1 = Alias_CompRed1.GetReference() as Actor
    Actor CompRed2 = Alias_CompRed2.GetReference() as Actor
    Actor Aela = Alias_Aela.GetReference() as Actor
    Actor Skjol = Alias_Skjol.GetReference() as Actor
    if( (CompNord3 == None) || (CompNord4 == None) || (CompRed1 == None) || (CompRed2 == None) || (Aela == None) || (Skjol == None) )
        Debug.Trace(THIS_FILE + " ** ERROR ** SOME REFERENCES ARE EMPTY!!", 2)
        Debug.Trace(THIS_FILE + " -- Script references:", 2)
        Debug.Trace(THIS_FILE + "    * CompNord3: <" + CompNord3 + ">", 2)
        Debug.Trace(THIS_FILE + "    * CompNord4: <" + CompNord4 + ">", 2)
        Debug.Trace(THIS_FILE + "    * CompRed1: <" + CompRed1 + ">", 2)
        Debug.Trace(THIS_FILE + "    * CompRed2: <" + CompRed2 + ">", 2)
        Debug.Trace(THIS_FILE + "    * Aela: <" + Aela + ">", 2)
        Debug.Trace(THIS_FILE + "    * Skjol: <" + Skjol + ">", 2)
        Debug.MessageBox("FATAL ERROR ON QUEST M60: EMPTY REFERENCES")
    else 
    
        if( (CompNord3.IsDead() == true) && (CompNord4.IsDead() == true) && (CompRed1.IsDead() == true) && (CompRed2.IsDead() == true) && (Aela.IsDead() == true) && (Skjol.IsDead() == true) )
            Debug.Trace(THIS_FILE + " -- All invaders INSIDE are dead!")
            return True
        endif
        Debug.Trace(THIS_FILE + " -- Invaders IsDead() result:")
        Debug.Trace(THIS_FILE + "    * CompNord3: <" + CompNord3.IsDead() + ">")
        Debug.Trace(THIS_FILE + "    * CompNord4: <" + CompNord4.IsDead() + ">")
        Debug.Trace(THIS_FILE + "    * CompRed1: <" + CompRed1.IsDead() + ">")
        Debug.Trace(THIS_FILE + "    * CompRed2: <" + CompRed2.IsDead() + ">")
        Debug.Trace(THIS_FILE + "    * Aela: <" + Aela.IsDead() + ">")
        Debug.Trace(THIS_FILE + "    * Skjol: <" + Skjol.IsDead() + ">")
    endif  
    return false
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Private: Tells if the invaders inside and outside Gallows rock are all dead.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function invadersAreDead()
    Debug.Trace(THIS_FILE + "-- invadersAreDead()")
    bool invadersInsideDead = invadersInsideAreDead()
    bool invadersOutsideDead = invadersOutsideAreDead()
    if((invadersInsideDead == true) && (invadersOutsideDead == true))
        Debug.Trace(THIS_FILE + " -- All INVADERS are dead!")
        return true
    endif
    return false
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Public
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function advanceStageKillInvaders()
    Debug.Trace(THIS_FILE + " -- advanceStageKillInvaders()")
    if(invadersAreDead())
        Debug.Trace(THIS_FILE + "-- Advances Quest M60 from Stage<" + KILL_ALL_INVADERS_STAGE + "> to Stage:<" + KILL_ALL_INVADERS_NEXT + ">")
        DSilHand_M60Retaliation.SetObjectiveCompleted(KILL_ALL_INVADERS_STAGE);
        DSilHand_M60Retaliation.SetStage(KILL_ALL_INVADERS_NEXT)
        DSilHand_M60Retaliation.SetObjectiveDisplayed(KILL_ALL_INVADERS_NEXT)
    endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Enable the werewolves for the quest M60.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function enableWerewolves()
    Debug.Trace(THIS_FILE + " -- enableWerewolves()"); 
    if(wildWerewolf1 != None)
        Debug.Trace(THIS_FILE + " -- Enable wildWerewolf 1"); 
        wildWerewolf1.Enable()
    else
        Debug.Trace(THIS_FILE + " **ERROR** WerewolfWild1 is EMPTY!", 2); 
    endif
    if(wildWerewolf2 != None)
        Debug.Trace(THIS_FILE + " -- Enable wildWerewolf 2"); 
        wildWerewolf2.Enable()
    else
        Debug.Trace(THIS_FILE + " **ERROR** wildWerewolf2 is EMPTY!", 2); 
    endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Public: prepare the doors for quest M60 (close Gallows barred door and opnes
; the wild werewolf cage).
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function setupDoors()
    closeGallowsBarredDoor()
    openWerewolfCage()
EndFunction

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
; Input: void
; 
; Move the NPCs inside Gallows Rock, except the Circle members (Aela and Skjol).
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function moveNpcs()
    Actor nord3 = Alias_CompNord3.GetReference() as Actor
    Actor nord4 = Alias_CompNord4.GetReference() as Actor
    Actor red1 = Alias_CompRed1.GetReference() as Actor
    Actor red2 = Alias_CompRed2.GetReference() as Actor
    Actor aela = Alias_Aela.GetReference() as Actor
    Actor skjol = Alias_Skjol.GetReference() as Actor
    moveSingleNpc(nord3, markCompNord3, "nord3 -> markCompNord3")
    moveSingleNpc(nord4, markCompNord4, "nord4 -> markCompNord4")
    moveSingleNpc(red1, markCompRed1, "red1 -> markCompRed1")
    moveSingleNpc(red2, markCompRed2, "red2 -> markCompRed2")
    moveSingleNpc(aela, markAela, "aela -> markAela")
    moveSingleNpc(skjol, markSkjol, "skjol -> markSkjol")
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Move the Cricle members to Gallows Main Chamber. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function moveCircleActors()
    Debug.Trace("** moveCircleActors")
    Actor aela = Alias_Aela.GetReference() as Actor
    Actor skjol = Alias_Skjol.GetReference() as Actor
    moveSingleNpc(aela, markAela, "aela -> markAela")
    moveSingleNpc(skjol, markSkjol, "skjol -> markSkjol")
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Disable the Circle members for this quest.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function disableCircleMembers()
    Debug.Trace("-- disableCircleMembers()")
    Actor aela = Alias_Aela.GetReference() as Actor
    Actor skjol = Alias_Skjol.GetReference() as Actor
    aela.Disable()
    skjol.Disable()  
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Enable the circle members for this quest.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function enableCircleMembers()
    Debug.Trace("-- enableCircleMembers()")
    Actor aela = Alias_Aela.GetReference() as Actor
    Actor skjol = Alias_Skjol.GetReference() as Actor    
    aela.Enable()
    skjol.Enable()      
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Force close DSilHand_GallowsBarredDoor door
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function closeGallowsBarredDoor ()
    Debug.Trace(THIS_FILE + "-- closeGallowsBarredDoor()");
    ; load references
    ObjectReference linkedDoor = DSilHand_GallowsDoorBar.getLinkedRef()
    BarredDoor doorScript = linkedDoor as BarredDoor
    ; Check properties
    if( (DSilHand_GallowsBarredDoor == None) || (doorScript == None) || (linkedDoor == None))
        Debug.MessageBox("**FATAL ERROR ON QUEST M60** closeGallowsBarredDoor references are EMPTY");
        Debug.Trace(THIS_FILE + "**FATAL ERROR ON QUEST M60** closeGallowsBarredDoor references are EMPTY", 2);
        Debug.Trace(THIS_FILE + "    * DSilHand_GallowsBarredDoor: <" + DSilHand_GallowsBarredDoor + ">", 2)
        Debug.Trace(THIS_FILE + "    * doorScript: <" + doorScript + ">", 2)
        Debug.Trace(THIS_FILE + "    * linkedDoor: <" + linkedDoor + ">", 2)
    else 
        ; Closes the door
        if(DSilHand_GallowsBarredDoor.GetOpenState() == 1)
            DSilHand_GallowsBarredDoor.SetOpen(false)
        else
            Debug.Trace(THIS_FILE + "-- Current Door(GallowsBarredDoor) State: " + DSilHand_GallowsBarredDoor.GetOpenState());
        endif
        ; bar the door
        Debug.Trace(THIS_FILE + "--doorScript:<" + doorScript + ">");
        if (doorScript.barred == false)
            DSilHand_GallowsDoorBar.playAnimationAndWait("down","done")
            doorScript.barred = true
            linkedDoor.BlockActivation(true)
        else
            Debug.Trace(THIS_FILE + "-- doorScript.barred: " + doorScript.barred);
        endif 
    endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Force OPEN DSilHand_GallowsImpJailDoor01 prisioner door
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function openWerewolfCage()
    Debug.Trace(THIS_FILE + " -- openWerewolfDoor()");
    if(DSilHand_GallowsImpJailDoor01 != None)
        DSilHand_GallowsImpJailDoor01.Lock(false, true)
        DSilHand_GallowsImpJailDoor01.SetOpen(true)
        Debug.Trace(THIS_FILE + "-- Current Door(GallowsImpJailDoor01) State: " + DSilHand_GallowsImpJailDoor01.GetOpenState());
    else
        Debug.Trace(THIS_FILE + " **ERROR** DSilHand_GallowsImpJailDoor01 REFERENCE IS EMPTY!!", 2);
    endif
EndFunction





