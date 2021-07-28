Scriptname DSilHand_Utils extends Quest  

;;
;; ;; GAME AND UTILS
;; float Function GetCurrentHourOfDay() 
;; 
;; ;; ACTOR MOVE HANDLERS
;; 
;; Function moveSingleNpcRefAlias(ReferenceAlias npc, ReferenceAlias marker, string npcLabel, string callerScript) 
;; Function moveSingleNpcRefAlias2(ReferenceAlias npc, ObjectReference marker, string npcLabel, string callerScript) 
;; Function moveSingleNpc(Actor npc, ObjectReference marker, string npcLabel, string callerScript) 
;; Function moveNpcRefAliasIfAlive(ReferenceAlias npc, ReferenceAlias marker, String logInfo, string callerScript) 
;; Function moveNpcIfAlive(Actor npc, ObjectReference marker, String logInfo, string callerScript) 
;; 
;; ;; ACTOR FOLLOWER HELPERS
;; 
;; bool Function actorRefAliasIsFollower(ReferenceAlias npc, string actorNameStr, Faction PotentialFollowerFaction, Faction CurrentFollowerFaction, string callerScript)  
;; bool Function actorIsFollower(Actor npc, string actorNameStr, Faction PotentialFollowerFaction, Faction CurrentFollowerFaction, string callerScript) 
;; Function setupFollowerRefAlias(ReferenceAlias npc, string actorName, string callerScript) 
;; Function setupFollower(Actor npc, string actorName, string callerScript) 
;; Function shutdownFollowerRefAlias(ReferenceAlias npc, string actorName, string callerScript) 
;; Function shutdownFollower(Actor npc, string actorName, string callerScript) 
;; 
;; ;; ACTOR STATUS
;; bool Function areAllActorsAliasRefDead(ReferenceAlias[] npcsArray, string callerScript) 
;; bool Function areAllActorsDead(Actor[] npcsArray, string callerScript) 
;; bool Function are2ActorsRefAliasDead(ReferenceAlias npc1, ReferenceAlias npc2, string callerScript) 
;; bool Function are2ActorsDead(Actor npc1, Actor npc2, string callerScript) 
;; 
;; ;; ENABLE/DISABLE 
;; Function enableActorAliasRef(ReferenceAlias npc, string actorName, string callerScript) 
;; Function enableActor(Actor npc, string actorName, string callerScript) 
;; Function enableObjectRefAlias(ReferenceAlias objAlias, string objectName, string callerScript) 
;; Function enableObject(ObjectReference obj, string objName, string callerScript) 
;; Function disableActorRefAlias(ReferenceAlias npc, string actorName, string callerScript) 
;; Function disableActor(Actor npc, string actorName, string callerScript) 
;; 
;; Function disableObjectRefAlias(ReferenceAlias objAlias, string objectName, string callerScript) 
;; Function disableObject(ObjectReference obj, string objName, string callerScript) 
;; 
;; ;; COMBAT
;; Function stopAllCombat(Actor npc, string actorName, string callerScript) 
;; Function stopAllCombatRefAlias(ReferenceAlias npc, string actorName, string callerScript) 
;; 
;; ;; ANIMATIONS 
;; Function playIdleHelper(ReferenceAlias aliasActor, string actorName, Idle akIdle, string idleDescription, string callerScript) 
;; 
;; 
;; ;; TROUBLESHOOTING
;; string Function logActorStatus(Actor actorObj, string actorName, int logLevel, string callerScript) 
;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GAME AND UTILS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input:
;
; https://www.creationkit.com/index.php?title=Function_for_Time_of_Day
; The global function GetCurrentGameTime can be used to return the number of 
; in-game days passed, including the fraction of the current day that has 
; passed.
; This function removes the portion of GetCurrentGameTime's return value 
; that returns to previous in-game days, then converts the remaining portion
; to hours.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
float Function GetCurrentHourOfDay() global
	float Time = Utility.GetCurrentGameTime()
	Time -= Math.Floor(Time) ; Remove "previous in-game days passed" bit
	Time *= 24 ; Convert from fraction of a day to number of hours
	Return Time 
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ACTOR MOVE HANDLERS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: ReferenceAlias npc - ReferenceAlias to Acotr NPC to be moved
; Input: ReferenceAlias marker - ReferenceAlias to ObjectReference marker 
;        the NPC will be moved
; Input: string npcLabel - information about the NPC and Marker, to be loged.
; Input: string callerScript - script from where this function was called, to be
;        logged.
; 
; Function to move a single NPC to a marker. If mustEnable is set, it forces 
; the actor to be enabled. If the actor is dead, it resurrects it. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function moveSingleNpcRefAlias(ReferenceAlias npc, ReferenceAlias marker, string npcLabel, string callerScript) global
    string logCall = logPrefix(callerScript)
    if( (npc != None) && (marker != None))
        moveSingleNpc(npc.GetActorReference(), marker.GetReference(), npcLabel, logCall)
    else 
        if(npc == None)
            Debug.Trace(logCall + " **ERROR** ReferenceAlias npc is EMPTY for  npcLabel<" + npcLabel + ">", 2)
        else
            Debug.Trace(logCall + " **ERROR** ReferenceAlias marker is EMPTY for npcLabel<" + npcLabel + ">", 2)
        endif
    endif
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: ReferenceAlias npc - ReferenceAlias to Acotr NPC to be moved
; Input: ObjectReference marker - ObjectReference marker  where the NPC will 
;        be moved to
; Input: string npcLabel - information about the NPC and Marker, to be loged.
; Input: string callerScript - script from where this function was called, to be
;        logged.
; 
; Function to move a single NPC to a marker. If mustEnable is set, it forces 
; the actor to be enabled. If the actor is dead, it resurrects it. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function moveSingleNpcRefAlias2(ReferenceAlias npc, ObjectReference marker, string npcLabel, string callerScript) global
    string logCall = logPrefix(callerScript)
    if(npc != None)
        moveSingleNpc(npc.GetActorReference(), marker, npcLabel, logCall)
    else 
        Debug.Trace(logCall + " **ERROR** ReferenceAlias npc is EMPTY for  npcLabel<" + npcLabel + ">", 2)
    endif
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Actor npc - NPC to be moved
; Input: ObjectReference marker - ObjectReference to the marker the NPC will
;        be moved
; Input: string npcLabel - information about the NPC and Marker, to be loged.
; Input: string callerScript - script from where this function was called, to be
;        logged.
; 
; Function to move a single NPC to a marker. If mustEnable is set, it forces 
; the actor to be enabled. If the actor is dead, it resurrects it. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function moveSingleNpc(Actor npc, ObjectReference marker, string npcLabel, string callerScript) global
    string logCall = logPrefix(callerScript)
    if( (npc != None) && (marker != None))
        Debug.Trace(logCall + " moving NPC " + npcLabel + " to marker ...")
        npc.MoveTo(marker)
        npc.SetPosition(marker.GetPositionX(), marker.GetPositionY(), marker.GetPositionZ())
        ; Enable npc        
        if (npc.IsDisabled() == true) 
            Debug.Trace(logCall + " Actor npc is disabled => call npc.Enable() ")
            npc.Enable()
        endif
        ; ensure the npc is alive
        if (npc.IsDead() == true) 
            Debug.Trace(logCall + " Actor npc is dead => call npc.Resurrect()")
            npc.Resurrect()
        endif
        ; Reavaluate the actor AI package
        npc.EvaluatePackage()
    else 
        if(npc == None)
            Debug.Trace(logCall + " **WARNING** Actor npc is EMPTY for npcLabel<" + npcLabel + ">", 1)
        else
            Debug.Trace(logCall + " **WARNING** ObjectReference marker is EMPTY for  npcLabel<" + npcLabel + ">", 1)
        endif
    endif
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Actor npc - NPC to be moved
; Input: ObjectReference marker - ObjectReference to the marker the NPC will
;        be moved
; Input: String logInfo - information about the NPC and Marker, to be loged.
; 
; Function to move a single NPC to a marker if it is Alive.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function moveNpcRefAliasIfAlive(ReferenceAlias npc, ReferenceAlias marker, String logInfo, string callerScript) global
    string logCall = logPrefix(callerScript)
    moveNpcIfAlive(npc.GetActorReference(), marker.GetReference(), logInfo, logCall)
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Actor npc - NPC to be moved
; Input: ObjectReference marker - ObjectReference to the marker the NPC will
;        be moved
; Input: String logInfo - information about the NPC and Marker, to be loged.
; 
; Function to move a single NPC to a marker if it is Alive.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function moveNpcIfAlive(Actor npc, ObjectReference marker, String logInfo, string callerScript) global
    string logCall = logPrefix(callerScript)
    if( (npc != None) && (marker != None))
        if (npc.IsDead() == false)
            Debug.Trace(logCall + " moving NPC " + logInfo)
            npc.MoveTo(marker)
            npc.SetPosition(marker.GetPositionX(), marker.GetPositionY(), marker.GetPositionZ())
        else
            Debug.Trace(logCall + " NPC:<" +npc + "> is Dead, cannot execute move: " +  logInfo)
        endif
    else 
        if(npc == None)
            Debug.Trace(logCall + " **ERROR** npc param is EMPTY: " + logInfo, 2)
        else
            Debug.Trace(logCall + " **ERROR** marker param is EMPTY: " + logInfo, 2)
        endif
    endif
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ACTOR FOLLOWER HELPERS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: ReferenceAlias npc - ReferenceAlias to Actor to be checked if he/she 
;        is a follower or not
; Input: string actorNameStr - Actor name to be logged. It just used to be help 
;        the debug, has no effect on the method operation. 
; Input: Faction PotentialFollowerFaction - follower faction 
; Input: Faction CurrentFollowerFaction - follower faction. If the player is 
;        a follower its rank is -1, if it is, its rank is 0.
; Input: string callerScript - script from where this function was called, to be
;        logged.
;
; Tells if an actor is a follower or not.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function actorRefAliasIsFollower(ReferenceAlias npc, string actorNameStr, Faction PotentialFollowerFaction, Faction CurrentFollowerFaction, string callerScript) global 
    string loginfo = logPrefix(callerScript)
    ; check if the actor is valid
    if ( npc == None)
        Debug.Trace(loginfo + " **WARNING** ReferenceAlias npc <" + actorNameStr + ">", 1);
        return false
    endif
    return actorIsFollower(npc.GetActorReference(), actorNameStr, PotentialFollowerFaction, CurrentFollowerFaction, loginfo)
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Actor npc - Actor to be checked if he/she is a follower or not
; Input: string actorNameStr - Actor name to be logged. It just used to be help 
;        the debug, has no effect on the method operation. 
; Input: Faction PotentialFollowerFaction - follower faction 
; Input: Faction CurrentFollowerFaction - follower faction. If the player is 
;        a follower its rank is -1, if it is, its rank is 0.
; Input: string callerScript - script from where this function was called, to be
;        logged.
; Tells if an actor is a follower or not.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function actorIsFollower(Actor npc, string actorNameStr, Faction PotentialFollowerFaction, Faction CurrentFollowerFaction, string callerScript) global
    string loginfo = logPrefix(callerScript)
    Debug.Trace(loginfo + " -- checking if actor " + actorNameStr + ":<" + npc + "> is a follower");
    ; check if the actor is valid
    if ( npc == None)
        Debug.Trace(loginfo + " **WARNING** Actor npc <" + actorNameStr + ">", 2);
        return false
    endif
    ; do the actual check if the NPC is a follower. If the NPC is a follower,
    ; both ranks must be equals to 0.
    int facRankP = npc.GetFactionRank(PotentialFollowerFaction)
    int facRankC = npc.GetFactionRank(CurrentFollowerFaction)
    Debug.Trace(loginfo + " -- PotentialFollowerFaction:<" + facRankP + ">");
    Debug.Trace(loginfo + " -- CurrentFollowerFaction:<" + facRankC + ">");
    if(  (facRankP >= 0 ) && (facRankC >= 0) )
        return true
    endif
    return false
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: ReferenceAlias npc - actor the will become a follower
; Input: string actorNameStr - Actor name to be logged. It just used to be help 
;        the debug, has no effect on the method operation. 
; Input: string callerScript - script from where this function was called, to be
;        logged.
;
; Set the NPC as a teamate to the player, and rises the relationship level to
; 3, and evaluates the AI package. This function does not make the NPC to 
; follow the player, just makes him firendly, do favors and reavalutate 
; the AI package instantaneously. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function setupFollowerRefAlias(ReferenceAlias npc, string actorName, string callerScript) global
    string loginfo = logPrefix(callerScript)
    if(npc != None)
        setupFollower(npc.GetActorReference(),  actorName, logInfo)
    else
        Debug.Trace(loginfo + " **WARNING** Error on setupFollowerRefAlias() ReferenceAlias npc is EMPTY", 1);
    endif
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Actor npc - actor the will become a follower
; Input: string actorNameStr - Actor name to be logged. It just used to be help 
;        the debug, has no effect on the method operation. 
; Input: string callerScript - script from where this function was called, to be
;        logged.
;
; Set the NPC as a teamate to the player, and rises the relationship level to
; 3, and evaluates the AI package. This function does not make the NPC to 
; follow the player, just makes him firendly, do favors and reavalutate 
; the AI package instantaneously. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function setupFollower(Actor npc, string actorName, string callerScript) global
    string loginfo = logPrefix(callerScript)
    Debug.Trace(loginfo + " -- setupFollower");
    if(npc != None) 
        ; Set NPC as a teamate
        npc.SetPlayerTeammate()
        ; make the actor friendly to the player
        npc.SetRelationshipRank(Game.GetPlayer(), 3)
        ; Reavaluate the actor AI package
        npc.EvaluatePackage()
    else
        Debug.Trace(loginfo + " **WARNING** Error on setupFollower() Actor npc is EMPTY", 1);
    endif    
endFunction 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: ReferenceAlias npc - ReferenceAlias to actor the will become a follower
; Input: string actorNameStr - Actor name to be logged. It just used to be help 
;        the debug, has no effect on the method operation. 
; Input: string callerScript - script from where this function was called, to be
;        logged.
;
; Unset the NPC as a teamate to the player and evaluates the AI package. 
; This function does not make the NPC to unfollow the player, just makes him 
; stops to do favors and reavaluate instantaneously the AI package. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function shutdownFollowerRefAlias(ReferenceAlias npc, string actorName, string callerScript) global
    string loginfo = logPrefix(callerScript)
    if(npc != None) 
        shutdownFollower(npc.GetActorReference(), actorName, loginfo)
    else
        Debug.Trace(loginfo + " **WARNING** Error on shutdownFollowerRefAlias() ReferenceAlias npc object is EMPTY", 1);
    endif
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Actor npc -  actor the will become a follower
; Input: string actorNameStr - Actor name to be logged. It just used to be help 
;        the debug, has no effect on the method operation. 
; Input: string callerScript - script from where this function was called, to be
;        logged.
;
; Unset the NPC as a teamate to the player and evaluates the AI package. 
; This function does not make the NPC to unfollow the player, just makes him 
; stops to do favors and reavaluate instantaneously the AI package. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function shutdownFollower(Actor npc, string actorName, string callerScript) global
    string loginfo = logPrefix(callerScript)
    Debug.Trace(loginfo + " -- shutdownFollower");
    if(npc != None) 
        ; Unset the player as a teamate
        npc.SetPlayerTeammate(false)
        ; Reavaluate the actor AI package
        npc.EvaluatePackage()        
    else
        Debug.Trace(loginfo + " **WARNING** Error on setupFollower() Actor npc object is EMPTY", 1);
    endif
endFunction 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ACTOR STATUS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Actor[] actorsArray - check if all actors are dead
; Input: string callerScript - Actor name to be logged. It just used to be help 
;        the debug, has no effect on the method operation. 
; 
; Tells if all the Actors in the array are dead or Not. 
; If all actors are dead it return true.
; If any actors is alive it return false.
; If any of the actors or the vector is null pointer it return false.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function areAllActorsAliasRefDead(ReferenceAlias[] npcsArray, string callerScript) global
    string loginfo = logPrefix(callerScript)
    if(npcsArray == None)
        Debug.Trace(loginfo + " **WARNING** Actor[] npcsArray IS EMPTY!", 1);
        return true
    endif
    int numbNpcs = npcsArray.length
    int i = 0
    int nullActors = 0
    while ( i < numbNpcs)
        if (npcsArray[i] != None)
            Actor npc = npcsArray[i].GetReference() as Actor
            if (npc != None)
                if (npc.IsDead() != true)
                    Debug.Trace(loginfo + " -- npcsArray[" + i + "] is Alive")
                    return false
                endif
            else
                Debug.Trace(loginfo + " **WARNING** ERROR CASTING: npcsArray[i].GetReference() as Actor" , 1)
                Debug.Trace(loginfo + " **WARNING** npcsArray[" + i + "] IS EMPTY!" , 1)
                nullActors += 1
            endif
        else
            nullActors += 1
            Debug.Trace(loginfo + " **WARNING** npcsArray[" + i + "] IS EMPTY!" , 1)
        endif
        i += 1
    endwhile
    if (nullActors > 0)
        Debug.Trace(loginfo + " **WARNING** EMPTY NPCS COUNT ON areAllActorsDead():<" + nullActors + ">" , 1);
    endif
    Debug.Trace(loginfo + " -- ALL NPCS ARE DEAD!");       
    return true
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Actor[] actorsArray - check if all actors are dead
; Input: string callerScript - Actor name to be logged. It just used to be help 
;        the debug, has no effect on the method operation. 
; 
; Tells if all the Actors in the array are dead or Not. 
; If all actors are dead it return true.
; If any actors is alive it return false.
; Any null pointer to a actor is considered a dead actor, but it logs an
; warning message.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function areAllActorsDead(Actor[] npcsArray, string callerScript) global
    string loginfo = logPrefix(callerScript)
    if(npcsArray == None)
        Debug.Trace(loginfo + " **WARNING** Actor[] npcsArray IS EMPTY!", 2);
        return true
    endif
    int numbNpcs = npcsArray.length
    int i = 0
    int nullActors = 0
    while ( i < numbNpcs)
        if (npcsArray[i] != None)
            if (npcsArray[i].IsDead() != true)
                Debug.Trace(loginfo + " -- npcsArray[" + i + "] is Alive");
                return false
            endif
        else
            nullActors += 1
            Debug.Trace(loginfo + " **WARNING** npcsArray[" + i + "] IS EMPTY!" , 1);
        endif
        i += 1
    endwhile
    if (nullActors > 0)
        Debug.Trace(loginfo + " **WARNING** EMPTY NPCS COUNT ON areAllActorsDead():<" + nullActors + ">" , 1);
    endif
    Debug.Trace(loginfo + " -- ALL NPCS ARE DEAD!");       
    return true
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: ReferenceAlias npc1 - First actor to be checked
; Input: ReferenceAlias npc2 - Second Actor to be checked
; Input: string callerScript - 
; 
; Tell if two actors are dead. If the Actor object is empty, it is considered 
; dead by default.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function are2ActorsRefAliasDead(ReferenceAlias npc1, ReferenceAlias npc2, string callerScript) global
    string loginfo = logPrefix(callerScript)
    if ( (npc1 == None) && (npc2 == None) ) 
        Debug.Trace(loginfo + "**WARNING** Error ReferenceAlias npc1 and ReferenceAlias npc2 are EMPTY!", 1)
        Debug.Trace(loginfo + "**WARNING** RETURNING TRUE AS DEFAULT FROM are2ActorsRefAliasDead()", 1)
        return true
    elseif ( (npc1 == None) )
        Debug.Trace(loginfo + "**WARNING** Error ReferenceAlias npc1 is EMPTY!", 1)
        return npc2.GetActorReference().IsDead()
    elseif ((npc2 == None))
        Debug.Trace(loginfo + "**WARNING** Error ReferenceAlias npc2 is EMPTY!", 1)
        return npc1.GetActorReference().IsDead()
    else
        return are2ActorsDead(npc1.GetActorReference(), npc2.getActorReference(), loginfo)
    endif
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Actor npc1 - First actor to be checked
; Input: Actor npc2 -  
; Input: string callerScript - 
; 
; Tell if two actors are dead. If the Actor object is empty, it is considered 
; dead by default.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function are2ActorsDead(Actor npc1, Actor npc2, string callerScript) global
    string loginfo = logPrefix(callerScript)
    ; null pointer handlers
    if( (npc1 == None) && (npc2 == None) ) 
        Debug.Trace(loginfo + " **WARNING** Error on are2ActorsDead(): npc1 and npc2 are EMPTY!", 1)
        Debug.Trace(loginfo + " **WARNING** TRUE AS DEFEAULT", 1)
        return true
    elseif(npc1 == None)
        Debug.Trace(loginfo + " **WARNING** npc1 is EMPTY! -- WILL BE COUNTED AS DEAD AS DEFAULT", 1)
        if(npc2.IsDead() == true)
            Debug.Trace(loginfo + " **WARNING** npc2 is DEAD", 1)
            return true
        else
            return false
        endif
    elseif(npc2 == None)
        Debug.Trace(loginfo + " **WARNING** npc2 is EMPTY! -- WILL BE COUNTED AS DEAD AS DEFAULT", 1)
        if(npc1.IsDead() == true)
            Debug.Trace(loginfo + " **WARNING** npc1 is DEAD", 1)
            return true
        else
            return false
        endif
    ; base case        
    else
        if( (npc1.IsDead() == true) && (npc2.IsDead() == true) )
            Debug.Trace(loginfo + " -- all npcs are dead!")
            return true
        else
            return false
        endif
    endif
endFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ENABLE/DISABLE 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input : Actor npc - actor to be enabled
; Input : string actorName - name of the actor to be enabled. Is used only to 
;         to log information.
; Input : string callerScript - caller script name.  Is used only to log 
;         information.
;
; Enables an actor object. If the actor is dead, it resurrect it. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function enableActorAliasRef(ReferenceAlias npc, string actorName, string callerScript) global
    string loginfo = logPrefix(callerScript)
    if (npc == None) 
        Debug.Trace(loginfo + " **WARNING** CANNOT ENABLE ACTOR ReferenceAlias: IT IS EMPTY", 1)
    else
        enableActor(npc.GetActorReference(), actorName, loginfo)
    endif
endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input : Actor npc - actor to be enabled
; Input : string actorName - name of the actor to be enabled. Is used only to 
;         to log information.
; Input : string callerScript - caller script name.  Is used only to log 
;         information.
;
; Enables an actor object. If the actor is dead, it resurrect it. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function enableActor(Actor npc, string actorName, string callerScript) global
    string loginfo = logPrefix(callerScript)
    if (npc == None)
        Debug.Trace(loginfo + " **WARNING** CANNOT ENABLE ACTOR: IT IS EMPTY", 1)
    else
        npc.Enable()
        if(npc.IsDead() == true)
            Debug.Trace(loginfo + " -- NPC " + actorName + " is dead! => Resurrect!")
            npc.Resurrect()
        endif
    endif
endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: ReferenceAlias obj - Object to be enabled ReferenceAlias.
; Input: string actorName - the name or actor label to be identifed on the logs
; 
; Enables an object using its alias reference, after checking if the reference 
; is empty. It it fails, logs an error message.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function enableObjectRefAlias(ReferenceAlias objAlias, string objectName, string callerScript) global
    string loginfo = logPrefix(callerScript)
    if(objAlias != None)
        enableObject(objAlias.GetReference(), objectName, loginfo)
    else
        Debug.Trace(loginfo + " **WARNING** ReferenceAlias to objAlias <" + objectName + "> is EMPTY!", 1)
    endif     
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: ObjectReference npc - the object to be enabled
; Input: string objName - the name or actor label to be identifed on the logs
; 
; Enable an ObjectReference after checking if the reference is empty. 
; It it fails,  logs an error message.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function enableObject(ObjectReference obj, string objName, string callerScript) global
    string loginfo = logPrefix(callerScript)
    Debug.Trace(loginfo + " -- Enable Object " + objName + " <" + obj + ">")
    if(obj != None)
        obj.Enable()
    else
        Debug.Trace(loginfo + " **ERROR** ObjectReference obj to <" + objName + "> is EMPTY!", 2)
    endif   
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: ReferenceAlias npc - the actor passed as a ReferenceAlias.
; Input: string actorName - the name or actor label to be identifed on the logs
; 
; Disable an actor after checking if the reference is empty. It it fails, 
; logs an error message.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function disableActorRefAlias(ReferenceAlias npc, string actorName, string callerScript) global
    string loginfo = logPrefix(callerScript)
    if(npc != None)
        disableActor(npc.GetActorReference(), actorName, loginfo)
    else
        Debug.Trace(loginfo + " **ERROR** ReferenceAlias to npc " + actorName + " is EMPTY!", 2)
    endif     
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Actor npc - the actor to be disabled
; Input: string actorName - the name or actor label to be identifed on the logs
; Input: string callerScript - caller script, to log in case of error
; 
; Disable an actor after checking if the reference is empty. It it fails, 
; logs an error message.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function disableActor(Actor npc, string actorName, string callerScript) global
    string loginfo = logPrefix(callerScript)
    Debug.Trace(loginfo + " -- Disable Actor " + actorName + " <" + npc + ">")
    if(npc != None)
        npc.Disable()
    else
        Debug.Trace(loginfo + " **ERROR** Actor npc " + actorName + " is EMPTY!", 2)
    endif     
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: ReferenceAlias obj - Object to be disabled ReferenceAlias.
; Input: string actorName - the name or actor label to be identifed on the logs
; 
; Disable an object using its alias reference, after checking if the reference 
; is empty. It it fails, logs an error message.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function disableObjectRefAlias(ReferenceAlias objAlias, string objectName, string callerScript) global
    string loginfo = logPrefix(callerScript)
    if(objAlias != None)
        disableObject(objAlias.GetReference(), objectName, loginfo)
    else
        Debug.Trace(loginfo + " **ERROR** ReferenceAlias to object objAlias <" + objectName + "> is EMPTY!", 2)
    endif     
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: ObjectReference npc - the object to be disabled
; Input: string objName - the name or actor label to be identifed on the logs
; 
; Disable an ObjectReference after checking if the reference is empty. 
; It it fails,  logs an error message.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function disableObject(ObjectReference obj, string objName, string callerScript) global
    string loginfo = logPrefix(callerScript)
    Debug.Trace(loginfo + " -- Disable Object " + objName + " <" + obj + ">")
    if(obj != None)
        obj.Disable()
    else
        Debug.Trace(loginfo +" **ERROR** ObjectReference to obj " + objName + " is EMPTY!", 2)
    endif   
endFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; COMBAT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Actor npc - npc to be pacified
;
; stops all combat and combat alargs against the specified npc 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function stopAllCombat(Actor npc, string actorName, string callerScript) global
    string loginfo = logPrefix(callerScript)
    Debug.Trace(loginfo + " -- exec StopCombat() and StopCombatAlarm() on npc " + actorName + "<" + npc + ">")
    if(npc != None)
        npc.StopCombat()
        npc.StopCombatAlarm()
    else
        Debug.Trace(loginfo + " **WARNING** NPC object is EMPTY!", 1)
    endif
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Actor npc - npc to be pacified
;
; stops all combat and combat alargs against the specified npc 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function stopAllCombatRefAlias(ReferenceAlias npc, string actorName, string callerScript) global
    string loginfo = logPrefix(callerScript)
    Debug.Trace(loginfo + " -- exec StopCombat() and StopCombatAlarm() on npc " + actorName + "<" + npc + ">")
    if(npc != None)
        Actor npcActor = npc.GetActorReference()
        stopAllCombat(npcActor, actorName, loginfo)
    else
        Debug.Trace(loginfo + " **WARNING** NPC ReferenceAlias object is EMPTY!", 1)
    endif
endFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ANIMATIONS 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: ReferenceAlias aliasActor - Actor that will execute the animation
; string actorName - infor to help the identification of the actro on the logs 
; Input: Idle akIdle - idle animation that will be executed by the NPC 
; Input: string idleDescription - Name or information about the Idle. This
;        value will be logged, but does not interfere on the function execution.
; 
; Force an actor to play an Idle.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function playIdleHelper(ReferenceAlias aliasActor, string actorName, Idle akIdle, string idleDescription, string callerScript) global
    string loginfo = logPrefix(callerScript)
    Actor actorObj = aliasActor.GetReference() as Actor
    if (actorObj != None) && (actorObj.IsEnabled() == true) && (actorObj.IsDead() == false)
        if actorObj.PlayIdle(akIdle)
            Debug.Trace(loginfo + " -- idle animation (" + idleDescription + ") is running for Actor " + actorName + "...")
        else
            Debug.Trace(loginfo + " ** ERROR: Something went wrong on idle animation (" + idleDescription + ") for the Actor " + actorName + "...", 2)
            Debug.Trace(loginfo + " **  Idle akIdle:<" +  akIdle + ">")
            logActorStatus(actorObj, actorName, 2, loginfo)
        endIf    
    else
        Debug.Trace(loginfo + " **ERROR** cANNOT EXECUTE IDDLE ANIMATION (Actor object is EMPTY, disabled or dead!)", 2)      
    endif
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TROUBLESHOOTING
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Actor actorObj - The actor object
; Input: string actorName - The name of the actor
; Input: string callerScript - Script wich called this function
;
; This function helps to log information about an actor object. Usually, 
; can be used to troubleshoot the actor object if something went wrong.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
string Function logActorStatus(Actor actorObj, string actorName, int logLevel, string callerScript) global
    ; ensure the loglevel is 0, 1 or 2. 
    if(logLevel > 2)
        logLevel = 2
    endif
    if(logLevel < 0)
        logLevel = 0
    endif
    ; log information
    Debug.Trace(callerScript + " -- Status for Actor " + actorName, logLevel)
    if (actorObj != None) 
        Debug.Trace(callerScript + "    * Actor actorObj:<" + actorName + ">", logLevel)
        Debug.Trace(callerScript + "    * Actor actorObj.IsDead():<" + actorObj.IsDead() + ">", logLevel)
        Debug.Trace(callerScript + "    * Actor actorObj.GetRace():<" + actorObj.GetRace() + ">", logLevel)
        Debug.Trace(callerScript + "    * Actor actorObj.IsInCombat():<" + actorObj.IsInCombat()+ ">", logLevel)
        Debug.Trace(callerScript + "    * Actor actorObj.IsInCombat():<" + actorObj.IsInCombat()+ ">", logLevel)
        Debug.Trace(callerScript + "    * Actor actorObj.IsDeleted():<" + actorObj.IsDeleted() + ">", logLevel)
        Debug.Trace(callerScript + "    * Actor actorObj.IsDisabled():<" + actorObj.IsDisabled() + ">", logLevel)
        Debug.Trace(callerScript + "    * Actor actorObj.IsEnabled():<" + actorObj.IsEnabled() + ">", logLevel)
    else
        Debug.Trace(callerScript + "**WARNING** Actor Object is EMPTY", logLevel)
    endif
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PRIVATE  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

string Function logPrefix(string callerScript) global
    return "(DSilHand_Utils.psc)::" + callerScript
EndFunction



