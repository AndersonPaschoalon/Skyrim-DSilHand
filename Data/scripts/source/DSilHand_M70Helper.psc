Scriptname DSilHand_M70Helper extends Quest  
{Helper script for quest M70.}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ReferenceAlias Property SilverHand01  Auto  
{todo}

ReferenceAlias Property SilverHand02  Auto  
{todo}

ReferenceAlias Property SilverHand03  Auto  
{todo}

ReferenceAlias Property SilverHand04  Auto  
{todo}

ReferenceAlias Property SilverHand05  Auto  
{todo}

ReferenceAlias Property SilverHand06  Auto  
{todo}

ReferenceAlias Property SilverHand07  Auto  
{todo}

ReferenceAlias Property SilverHand08  Auto  
{todo}

ReferenceAlias Property SilverHand09  Auto  
{todo}

ReferenceAlias Property SilverHand10  Auto  
{todo}

ReferenceAlias Property SilverHand11  Auto  
{todo}

ReferenceAlias Property SilverHand12  Auto  
{todo}

ReferenceAlias Property SilverHand13  Auto  
{todo}

ReferenceAlias Property SilverHand14  Auto  
{todo}

ReferenceAlias Property SilverHand15  Auto  
{todo}

ReferenceAlias Property SilverHand16  Auto  
{Reference to the 16th siilver hand NPC}

ReferenceAlias Property SilverHand17  Auto  
{Referene to the 17th silver hand NPC}

ReferenceAlias Property Grave01  Auto  
{todo}

ReferenceAlias Property Grave02  Auto  
{todo}

ReferenceAlias Property Grave03  Auto  
{todo}

ReferenceAlias Property Grave04  Auto  
{todo}

ReferenceAlias Property Grave05  Auto  
{todo}

ReferenceAlias Property Grave06  Auto  
{todo}

ReferenceAlias Property Grave07  Auto  
{todo}

ReferenceAlias Property Grave08  Auto  
{todo}

ReferenceAlias Property Grave09  Auto  
{todo}

ReferenceAlias Property Grave10  Auto  
{todo}

ReferenceAlias Property Grave11  Auto  
{todo}

ReferenceAlias Property Grave12  Auto  
{todo}

ReferenceAlias Property Grave13  Auto  
{todo}

ReferenceAlias Property Grave14  Auto  
{todo}

ReferenceAlias Property Grave15  Auto  
{todo}

ReferenceAlias Property Grave16  Auto  
{Reference to the Grave 16}

ReferenceAlias Property Grave17  Auto  
{Reference to the Grave 17}

ReferenceAlias Property KrevGrave01  Auto  
{Not used}

ReferenceAlias Property KrevGrave02  Auto  
{Not used}

ReferenceAlias Property KrevGrave03  Auto  
{Not used}

ReferenceAlias Property KrevGrave04  Auto  
{Not used}

ReferenceAlias Property KrevGrave05  Auto  
{Not used}

ReferenceAlias Property KrevGrave06  Auto  
{Not used}

ReferenceAlias Property KrevGrave07  Auto  
{Not used}

ReferenceAlias Property KrevGrave08  Auto  
{Not used}

ReferenceAlias Property KrevGrave09  Auto  
{Not used}

ReferenceAlias Property KrevGrave10  Auto  
{Not used}

ReferenceAlias Property KrevGrave11  Auto  
{Not used}

ReferenceAlias Property KrevGrave12  Auto  
{Not used}

ReferenceAlias Property Fjol  Auto  
{Reference to Fjol}

ReferenceAlias Property Krev  Auto  
{Reference to Krev}

ReferenceAlias Property Frag01  Auto  
{todo}

ReferenceAlias Property chest  Auto  
{todo}

ReferenceAlias Property xMarkGrave  Auto  
{Reference to xMarker that enables Krev Grave and rites}

ReferenceAlias Property xMarkSovngarde  Auto  
{Reference to the place where Krev will be teleported on Sovngarde on the Hall of Valor}

SPELL Property AbFXSovengardeGlow  Auto  
{Spell for glowing on sovngarde -- not working}

ReferenceAlias Property xHeadSilver01  Auto  
{todo}

ReferenceAlias Property xHeadSilver02  Auto  
{todo}

ReferenceAlias Property xHeadSilver03  Auto  
{todo}

ReferenceAlias Property xHeadSilver04  Auto  
{todo}

ReferenceAlias Property xHeadSilver05  Auto  
{todo}

ReferenceAlias Property xHeadSilver06  Auto  
{todo}

ReferenceAlias Property xHeadSilver07  Auto  
{todo}

ReferenceAlias Property hillara  Auto  
{todo}

ReferenceAlias Property Sennar  Auto  
{todo}

ReferenceAlias Property xHeadSennar  Auto  
{todo}

ReferenceAlias Property xHeadHillara  Auto  
{todo}

ReferenceAlias Property xHeadFjol  Auto  
{todo}

Faction Property PotentialFollowerFaction  Auto  
{todo}

Faction Property CurrentFollowerFaction  Auto  
{todo}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

String THIS_FILE = "(DSilHand_M70Helper.psc) "
Int N_SILVERHANDS_REFERENCES = 17
Int N_STANDING_SILVER_MAX = 7
Int nDeadSilverhands = 0
Int nAliveSilverhands = 0
Actor[] silverArray = None 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Public Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; This method: 
; (1) Enables one grave for each Silverhand that are dead right now and diable
;     the dead bodies
; (2) Enables Krev Coffing and funeral rites, move him to Sovngarde and make 
;     him glow 
; (3) Teleport to the XHeadingMarkes objects some alive  silverhands. It will
;     Stop teleport if there is not enough alive silverhands or if the 
;     xMarkerHeading are all filled.
; (4) If Hillara/Sennar is not your follower, move them to the funeral as well.  
; (5) Move Fjol to the funeral
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function prepareSilverHandFuneral()
    Debug.Trace(THIS_FILE + " -- enableSilverhandGraves()")  
    ; Load silver hand graves objects 
    ObjectReference g00 = Grave01.GetReference() as ObjectReference 
    ObjectReference g01 = Grave02.GetReference() as ObjectReference  
    ObjectReference g02 = Grave03.GetReference() as ObjectReference  
    ObjectReference g03 = Grave04.GetReference() as ObjectReference  
    ObjectReference g04 = Grave05.GetReference() as ObjectReference  
    ObjectReference g05 = Grave06.GetReference() as ObjectReference  
    ObjectReference g06 = Grave07.GetReference() as ObjectReference  
    ObjectReference g07 = Grave08.GetReference() as ObjectReference  
    ObjectReference g08 = Grave09.GetReference() as ObjectReference  
    ObjectReference g09 = Grave10.GetReference() as ObjectReference  
    ObjectReference g10 = Grave11.GetReference() as ObjectReference  
    ObjectReference g11 = Grave12.GetReference() as ObjectReference  
    ObjectReference g12 = Grave13.GetReference() as ObjectReference  
    ObjectReference g13 = Grave14.GetReference() as ObjectReference   
    ObjectReference g14 = Grave15.GetReference() as ObjectReference    
    ObjectReference g15 = Grave16.GetReference() as ObjectReference    
    ObjectReference g16 = Grave17.GetReference() as ObjectReference
    ObjectReference[] graveArray = new ObjectReference[17]
    graveArray[0] = g00
    graveArray[1] = g01
    graveArray[2] = g02
    graveArray[3] = g03
    graveArray[4] = g04
    graveArray[5] = g05
    graveArray[6] = g06
    graveArray[7] = g07
    graveArray[8] = g08
    graveArray[9] = g09
    graveArray[10] = g10
    graveArray[11] = g11
    graveArray[12] = g12
    graveArray[13] = g13
    graveArray[14] = g14
    graveArray[15] = g15
    graveArray[16] = g16
    ; load xHead objects  
    ObjectReference xH01 = xHeadSilver01.GetReference() as ObjectReference 
    ObjectReference xH02 = xHeadSilver02.GetReference() as ObjectReference 
    ObjectReference xH03 = xHeadSilver03.GetReference() as ObjectReference 
    ObjectReference xH04 = xHeadSilver04.GetReference() as ObjectReference 
    ObjectReference xH05 = xHeadSilver05.GetReference() as ObjectReference 
    ObjectReference xH06 = xHeadSilver06.GetReference() as ObjectReference 
    ObjectReference xH07 = xHeadSilver07.GetReference() as ObjectReference 
    ObjectReference[] xHArray = new ObjectReference[7]
    xHArray[0] = xH01
    xHArray[1] = xH02
    xHArray[2] = xH03
    xHArray[3] = xH04
    xHArray[4] = xH05
    xHArray[5] = xH06
    xHArray[6] = xH07
    ;
    ; (1) Enables one grave for each Silverhand that are dead right now and diable
    ;     the dead bodies
    ;
    int nDeadSilHand = calcAndDisableDeadSilverhand()
    Debug.Trace( THIS_FILE + "-- nDeadSilHand:<" + nDeadSilHand + ">");
    int i = 0
    int enabledGraves = 0
    ; this will continue to enable graves until 
    ;  (a) the grave counter is smaller than the max number of graves
    ;  (b) the number of enabled graves is smaller than the number of dead silver hands
    while ( (i < N_SILVERHANDS_REFERENCES) && (enabledGraves < nDeadSilHand) )
        ; log info
        Debug.Trace(THIS_FILE + " loop -> i:<" + i + ">/<" + N_SILVERHANDS_REFERENCES + ">, enabledGraves:<" + enabledGraves + ">/" + nDeadSilHand + ">");
        ; Enable Grave
        if(graveArray[i] != None)
            graveArray[i].Enable()
        else
            Debug.Trace(THIS_FILE + " **ERROR** Grave  graveArray[" + i + "] is EMPTY -> COLD NOT ENABLE IT", 2)
        endif
        ; increment counters
        enabledGraves += 1 ; even if Enable() failed it must count as it it worked
        i += 1 
    endwhile
    ;
    ; (2) Enables Krev Coffing and funeral rites, move him to Sovngarde and make 
    ;     him glow 
    ;
    enableKrevGrave()
    moveKrevToSovngarde()

    ;
    ; (3) Teleport to the XHeadingMarkes objects some alive  silverhands. It will
    ;     Stop teleport if there is not enough alive silverhands or if the 
    ;     xMarkerHeading are all filled.    
    ;
    i = 0
    int nCountXMarker = 0
;    while ( (i < N_SILVERHANDS_REFERENCES) && (nCountXMarker < N_STANDING_SILVER_MAX) )
;        if(silverArray[i] != None)
;            ; if it is alive, move to xhead
;            Debug.Trace(THIS_FILE + "-- try to move NPC silverArray[i]:<" + silverArray[i] + ">")
;            if (silverArray[i].IsDead() == False)
;                ; Ressurect just in case ... 
;                silverArray[i].Resurrect()                
;                moveSingleNpc(silverArray[i], xHArray[nCountXMarker], "silverArray[" + i + "] =>  xHArray[" + nCountXMarker + "]")
;                ; make the actor look at krev grave
;                silverArray[i].SetLookAt(KrevGrave01.GetActorReference(), true)  
;                ; go to next marker
;                nCountXMarker += 1
;            else
;                Debug.Trace(THIS_FILE + "-- silverArray[" + i + "] is dead -> silverArray[i]:<" + silverArray[i] + ">")
;            endif
;        else
;            Debug.Trace(THIS_FILE + "**ERROR** silver and reference silverArray[" + i + "] is EMPTY!", 2)
;        endif
;        ; increment counters
;        i += 1 
;    endwhile
    while ( (i < N_SILVERHANDS_REFERENCES) && (nCountXMarker < N_STANDING_SILVER_MAX) )
        if(silverArray[i] != None)
            string silverHandLabel = "silverArray[" + i + "]:<" + silverArray[i] + ">" 
            ; if it is alive, move to xhead
            Debug.Trace(THIS_FILE + "-- try to move NPC "  + silverHandLabel)
            if (silverArray[i].IsDead() == False)
                ; if it is alive, move to xhead - is ressurected if is dead
                DSilHand_Utils.moveSingleNpc(silverArray[i], xHArray[nCountXMarker], silverHandLabel, THIS_FILE)
                ; make the actor look at krev grave
                silverArray[i].SetLookAt(KrevGrave01.GetReference(), true)  
                ; go to next marker
                nCountXMarker += 1
            else
                Debug.Trace(THIS_FILE + "-- silverArray[" + i + "] is dead -> silverArray[i]:<" + silverArray[i] + ">")
            endif
        else
            Debug.Trace(THIS_FILE + "**ERROR** silver and reference silverArray[" + i + "] is EMPTY!", 2)
        endif
        ; increment counters
        i += 1 
    endwhile

    ;
    ; (4) If Hillara/Sennar is not your follower, move them to the funeral as well. 
    ;
    bool isFollower = false 
    ; delete
    ; ObjectReference xhSennar = xHeadSennar.GetReference() as ObjectReference
    ; ObjectReference xhHillara = xHeadHillara.GetReference() as ObjectReference
    Actor hillaraActor = Hillara.GetReference() as Actor
    Actor sennarActor = Sennar.GetReference() as Actor
    ; make hillara follow
    isFollower = actorIsFollower(hillaraActor, "HILLARA")
    if(isFollower == false)
        ; delete 
        ; moveSingleNpc(hillaraActor, xhHillara, "hillaraActor => xhHillara")
        DSilHand_Utils.moveSingleNpcRefAlias(Hillara, xHeadHillara, "Hillara", THIS_FILE)
    endif
    ; make sennar follow
    isFollower = actorIsFollower(sennarActor, "SENAAR")
    if(isFollower == false)
        ; delete 
        ; moveSingleNpc(sennarActor, xhSennar, "sennarActor => xhSennar")
        DSilHand_Utils.moveSingleNpcRefAlias(Sennar, xHeadSennar, "Sennar", THIS_FILE)
    endif

    ;
    ; (5) Move Fjol to the funeral
    ;
    ; Delete
    ; Actor fjolActor = Fjol.GetReference() as Actor
    ; ObjectReference xhFjol = xHeadFjol.GetReference() as ObjectReference 
    ; moveSingleNpc(fjolActor, xhFjol, "fjolActor => xhFjol")
    DSilHand_Utils.moveSingleNpcRefAlias(Fjol, xHeadFjol, "Fjol", THIS_FILE)
endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Move Krev To Sovngarde, make him invulnerable and make him glow
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function cleanScript()
    Debug.Trace(THIS_FILE + " -- cleanScript(): cleanning quest reference") 
    Debug.Trace(THIS_FILE + " -- clear forced look at")
    int i = 0      ; loop counter 
    while(i < N_SILVERHANDS_REFERENCES)
        if(silverArray[i] != None)
            ; if the actor is alive, release its position
            if(silverArray[i].IsDead() == false) 
                silverArray[i].ClearLookAt()
                Debug.Trace(THIS_FILE + " silverArray[" + i + "]:<" + silverArray[i] + "> is Alive => return to editor location: silverArray[i].MoveToMyEditorLocation()")
            endif
        else 
            Debug.Trace(THIS_FILE + " **ERROR** SilverHand Actor silverArray[" + i + "] IS NULL", 2)    
        endif   
        i += 1
    endWhile
endFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Private Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Move Krev To Sovngarde, make him invulnerable and make him glow
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function moveKrevToSovngarde()
    Debug.Trace(THIS_FILE + " -- moveKrevToSovngarde()")
    Actor krevActor = Krev.GetReference() as Actor
    krevActor.Enable()
    ObjectReference mark = xMarkSovngarde.GetReference() as ObjectReference
    DSilHand_Utils.moveSingleNpc(krevActor, mark, "krevActor", THIS_FILE)
    ; delete 
    ; moveSingleNpc(krevActor, mark, "Krev -> Sovngarde")
    Debug.Trace(THIS_FILE + " -- make krev glow")
    krevActor.AddSpell(AbFXSovengardeGlow)
    ;AbFXSovengardeGlow.Cast(krevActor, krevActor)
    Debug.Trace(THIS_FILE + " -- make krev invulnerable")
    krevActor.GetActorBase().SetInvulnerable(true)
endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Enables Krev grave
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function enableKrevGrave()  
    Debug.Trace(THIS_FILE + " -- enableKrevGrave() xMarkGrave:<" + xMarkGrave + ">")
    if(xMarkGrave != None)
        xMarkGrave.GetReference().Enable() 
    else
        Debug.Trace(THIS_FILE + " ** ERROR ** COULD NOT LOAD xMarkGrave, IT IS EMPTY")
    endif     
endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; This method calculates how many silver hand soldiers are dead on Gallows 
; rock, to enable burials to all of them in the exterior. Also, if they are 
; dead it disable them, in order to do not exist at the same time a dead body 
; and a grave for the same NPC.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
int Function calcAndDisableDeadSilverhand()
    Debug.Trace(THIS_FILE + " -- calcAndDisableDeadSilverhand()")
    ; Load Silver hand soldiers actors objects 
    Actor sh00 = SilverHand01.GetReference() as Actor
    Actor sh01 = SilverHand02.GetReference() as Actor
    Actor sh02 = SilverHand03.GetReference() as Actor
    Actor sh03 = SilverHand04.GetReference() as Actor
    Actor sh04 = SilverHand05.GetReference() as Actor
    Actor sh05 = SilverHand06.GetReference() as Actor
    Actor sh06 = SilverHand07.GetReference() as Actor
    Actor sh07 = SilverHand08.GetReference() as Actor
    Actor sh08 = SilverHand09.GetReference() as Actor
    Actor sh09 = SilverHand10.GetReference() as Actor
    Actor sh10 = SilverHand11.GetReference() as Actor
    Actor sh11 = SilverHand12.GetReference() as Actor
    Actor sh12 = SilverHand13.GetReference() as Actor
    Actor sh13 = SilverHand14.GetReference() as Actor
    Actor sh14 = SilverHand15.GetReference() as Actor
    Actor sh15 = SilverHand16.GetReference() as Actor
    Actor sh16 = SilverHand17.GetReference() as Actor
    silverArray = new Actor[17]
    silverArray[0] = sh00
    silverArray[1] = sh01    
    silverArray[2] = sh02
    silverArray[3] = sh03    
    silverArray[4] = sh04 
    silverArray[5] = sh05    
    silverArray[6] = sh06 
    silverArray[7] = sh07 
    silverArray[8] = sh08
    silverArray[9] = sh09  
    silverArray[10] = sh10
    silverArray[11] = sh11    
    silverArray[12] = sh12
    silverArray[13] = sh13 
    silverArray[14] = sh14
    silverArray[15] = sh15    
    silverArray[16] = sh16
    ; loog over all silver hand references to 
    ; (1) check if they are dead, and increment the counter if true 
    ; (2) disable the dead actors, so their couposes will no lay arround
    int i = 0      ; loop counter 
    int deadActors = 0 ; dead actor loop counter 
    while(i < N_SILVERHANDS_REFERENCES)
        if(silverArray[i] != None)    
            if(silverArray[i].IsDead()) 
                deadActors += 1
                silverArray[i].Disable()
            else 
                if(silverArray[i].IsEnabled() == false)
                    Debug.Trace(THIS_FILE + " silverArray[" + i + "] is diabled => enable on Actor:<" + silverArray[i] + ">")
                    silverArray[i].Enable()
                endif
                Debug.Trace(THIS_FILE + " silverArray[" + i + "]:<" + silverArray[i] + "> is Alive")
            endif
        else 
            Debug.Trace(THIS_FILE + " **ERROR** SilverHand Actor silverArray[" + i + "] IS NULL", 2)    
        endif   
        i += 1
    endWhile
    ; log and return the result and sets the property
    nDeadSilverhands =  deadActors
    nAliveSilverhands = N_SILVERHANDS_REFERENCES - nDeadSilverHands
    Debug.Trace(THIS_FILE + "-------------------------------------------------------")
    Debug.Trace(THIS_FILE + "-- Gallows Rock Invasion status:")
    Debug.Trace(THIS_FILE + "-- Number of DEAD Silver hands : " + nDeadSilverhands)
    Debug.Trace(THIS_FILE + "-- Number of ALIVE Silver hands: " + nAliveSilverhands)
    Debug.Trace(THIS_FILE + "-------------------------------------------------------")

    Debug.Trace(THIS_FILE + " -- calcAndDisableDeadSilverhand deadActors:<" + deadActors + ">, nInteractions:<" + i + ">")
    return deadActors        
endfunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Actor npc - NPC to be moved
; Input: ObjectReference marker - ObjectReference to the marker the NPC will
;        be moved
; Input: String logInfo - information about the NPC and Marker, to be loged.
; 
; Function to move a single NPC to a marker.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Function moveSingleNpc(Actor npc, ObjectReference marker, String logInfo)
;     if( (npc != None) && (marker != None))
;         if ( npc.IsDead() == false)
;             Debug.Trace(THIS_FILE + " moving NPC " + logInfo + " npc:<" + npc + ">, marker:<" + marker + ">")
;             npc.MoveTo(marker)
;             ;npc.Enable()
;             npc.SetPosition(marker.GetPositionX(), marker.GetPositionY(), marker.GetPositionZ())
;         else
;             Debug.Trace(THIS_FILE + " NPC:<" +npc + "> is Dead, cannot execute move: " +  logInfo)
;         endif
;     else 
;         if(npc == None)
;             Debug.Trace(THIS_FILE + " **ERROR** npc param is EMPTY: " + logInfo, 2)
;         else
;             Debug.Trace(THIS_FILE + " **ERROR** marker param is EMPTY: " + logInfo, 2)
;         endif
;     endif
; endFunction




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Actor npc - Actor to be checked if he/she is a follower or not
; Input: string actorNameStr - Actor name to be logged. It just used to be help 
;        the debug, has no effect on the method operation. 
; 
; Tells if an actor is a follower or not.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Bool Function actorIsFollower(Actor npc, string actorNameStr)
    Debug.Trace(THIS_FILE + " -- checking if actor " + actorNameStr + ":<" + npc + "> is a follower");
    ; check if the actor is valid
    if ( npc == None)
        Debug.Trace(THIS_FILE + " **WARNING** INPUT ACTOR IS EMPTY <" + actorNameStr + ">", 2);
        return false
    endif
    ; do the actual check if the NPC is a follower. If the NPC is a follower,
    ; both ranks must be equals to 0.
    int facRankP = npc.GetFactionRank(PotentialFollowerFaction)
    int facRankC = npc.GetFactionRank(CurrentFollowerFaction)
    Debug.Trace(THIS_FILE + " -- PotentialFollowerFaction:<" + facRankP + ">");
    Debug.Trace(THIS_FILE + " -- CurrentFollowerFaction:<" + facRankC + ">");
    if(  (facRankP >= 0 ) && (facRankC >= 0) )
        return true
    endif
    return false
endFunction





