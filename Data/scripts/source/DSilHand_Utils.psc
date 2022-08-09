Scriptname DSilHand_Utils extends Quest  
{Utilities script, to help execute routines, and perform checking on objects before executing actions.}

;;
;; ;; GAME AND UTILS
;; 
;; float Function GetCurrentHourOfDay() global
;; bool Function moveObjectToContainer(ReferenceAlias refAliasObj, ReferenceAlias refAliasContainer, string objectLabel, string containerLabel, string callerScript) global
;; bool Function advanceQuest(Quest myQuest, int currObj, int nextObj, int nextStage, string callerScript) global
;; bool Function advanceIfAlreadyTaken(Quest myQuest, ObjectReference theObject, string objectLabel, int objToComplete,  int nextObj, int nextStage, string callerScript) global
;; 
;; ;; ACTOR MOVE HANDLERS
;; 
;; Function moveSingleNpcRefAlias(ReferenceAlias npc, ReferenceAlias marker, string npcLabel, string callerScript) global
;; Function moveSingleNpcRefAlias2(ReferenceAlias npc, ObjectReference marker, string npcLabel, string callerScript) global
;; Function moveSingleNpc(Actor npc, ObjectReference marker, string npcLabel, string callerScript) global
;; Function moveNpcRefAliasIfAlive(ReferenceAlias npc, ReferenceAlias marker, String logInfo, string callerScript) global
;; Function moveNpcIfAlive(Actor npc, ObjectReference marker, String logInfo, string callerScript) global
;; 
;; ;; ACTOR FOLLOWER HELPERS
;; 
;; bool Function actorRefAliasIsFollower(ReferenceAlias npc, string actorNameStr, Faction PotentialFollowerFaction, Faction CurrentFollowerFaction, string callerScript) global 
;; bool Function actorIsFollower(Actor npc, string actorNameStr, Faction PotentialFollowerFaction, Faction CurrentFollowerFaction, string callerScript) global
;; Function setupFollowerRefAlias(ReferenceAlias npc, string actorName, string callerScript) global
;; Function setupFollower(Actor npc, string actorName, string callerScript) global
;; Function shutdownFollowerRefAlias(ReferenceAlias npc, string actorName, string callerScript) global
;; Function shutdownFollower(Actor npc, string actorName, string callerScript) global
;; 
;; ;; REPORT ACTOR OBJECT STATE
;; 
;; bool Function areAllActorsRefAliasDead(ReferenceAlias[] npcsArray, string callerScript) global
;; bool Function areAllActorsDead(Actor[] npcsArray, string callerScript) global
;; bool Function are2ActorsRefAliasDead(ReferenceAlias npc1, ReferenceAlias npc2, string callerScript) global
;; bool Function are2ActorsDead(Actor npc1, Actor npc2, string callerScript) global
;; 
;; ;; CHANGE ACTOR OBJECT STATE
;; 
;; bool Function enableActorRefAlias(ReferenceAlias npc, string actorName, string callerScript) global
;; bool Function enableActor(Actor npc, string actorName, string callerScript) global
;; bool Function enableObjectRefAlias(ReferenceAlias objAlias, string objectName, string callerScript) global
;; bool Function enableObject(ObjectReference obj, string objName, string callerScript) global
;; bool Function disableActorRefAlias(ReferenceAlias npc, string actorName, string callerScript) global
;; bool Function disableActor(Actor npc, string actorName, string callerScript) global
;; bool Function makeRefAliasInvulnerable(ReferenceAlias actorRefAlias, string actorLabel, string callerScript) global
;; bool Function disableObjectRefAlias(ReferenceAlias objAlias, string objectName, string callerScript) global
;; bool Function disableObject(ObjectReference obj, string objName, string callerScript) global
;; bool Function disableActorRefAliasIfDead(ReferenceAlias npc, string actorName, string callerScript) global
;; bool Function makeRefAliasInvulnerable(ReferenceAlias actorRefAlias, string actorLabel, string callerScript) global
;;
;; 
;; ;; CHANGE ACTOR BAHAVIOR IN THE WORLD
;; 
;; Function stopAllCombat(Actor npc, string actorName, string callerScript) global
;; Function stopAllCombatRefAlias(ReferenceAlias npc, string actorName, string callerScript) global
;; Function playIdleHelper(ReferenceAlias aliasActor, string actorName, Idle akIdle, string idleDescription, string callerScript) global
;; 
;; ;; SCENES
;; 
;; bool Function forceRunScene(Scene sceneObject, string sceneName, int maxTries, string callerScript) global
;; 
;; 
;; ;; TROUBLESHOOTING
;; 
;; string Function logActorStatus(Actor actorObj, string actorName, int logLevel, string callerScript) global
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
; Input: ReferenceAlias refAliasObj - object to be moved to the conteiner
; Input: ReferenceAlias refAliasContainer - reference alias to the conteiner
; Input: string objectLabel - label for the object, used on the log
; Input: string containerLabel - label for the conteiner, used on the log
; Input: string callerScript - script where this function was called.
; Returns: bool - return true if move operation was executed, false if not.
;
; Tries to move an object to a conteiner both from ReferenceAlias objects,
; but ensure they are not empty and enabled first. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function moveObjectToContainer(ReferenceAlias refAliasObj, ReferenceAlias refAliasContainer, string objectLabel, string containerLabel, string callerScript) global
    string logCall = logPrefix(callerScript)
    Debug.Trace(logCall + "moveObjectToContainer()")
    bool retVal = enableObjectRefAlias(refAliasObj, objectLabel, logCall)
    if(retVal == false)
        Debug.Trace(logCall + " **ERROR** Enabling Object to be moved " + objectLabel, 2)
        return false
    endif
    retVal = enableObjectRefAlias(refAliasContainer, containerLabel, logCall)
    if(retVal == false)
        Debug.Trace(logCall + " **ERROR** Enabling Object Conteiner " + containerLabel, 2)
        return false
    endif
    Debug.Trace(logCall + " move " + objectLabel + "(" + refAliasObj+ ") => " + containerLabel + "(" + refAliasContainer + ")")
    Debug.Trace(logCall + " " + objectLabel + " => " + containerLabel)
    refAliasContainer.GetReference().AddItem(refAliasObj.GetReference())
    return true
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input:  Quest myQuest - Quest to be modified
; Input:  int currObj - current quest objective to be completed. 
;             To skip this  this operation set any negative value.
; Input:  int nextObj - next objective to be set.
;             To skip this  this operation set any value smaller than 0.
; Input:  int nextStage - next stage to be set.
;             To skip this  this operation set any negative value.
; Input:  string callerScript - optional parameter, used to log the caller 
;             script for debug purposes.
; Returns: true if the changes were applied successfully, false otherwise.
;
; This method helps to complete an objective and advance to the next one.
; This is helpfull since the three operations SetStge(), 
; SetObjectiveCompleted() and SetObjectiveDisplayed() frequently appear
; together.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function advanceQuest(Quest myQuest, int currObj, int nextObj, int nextStage, string callerScript) global
    string logCall = logPrefix(callerScript)
    Debug.Trace(logCall + " -- advanceQuest()")
    if (myQuest != None)
        ; complate objective
        Debug.Trace(logCall + " DONE Objective: " + currObj) 
        if(currObj > 0)
            myQuest.SetObjectiveCompleted(currObj)
        endif       
        ; advance quest
        Debug.Trace(logCall + " SET  Stage/Objective: " + nextStage + "/" + nextObj)
        if(nextObj > 0)
            myQuest.SetObjectiveDisplayed(nextObj)
        endif 
        if(nextStage > 0)
            myQuest.SetStage(nextStage)
        endif 
    else
        Debug.Trace(logCall + " **ERROR** myQuest is EMPTY") 
        return false      
    endif
    return true
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; This method helps to a quest to be advanced if an item is already taken.
; In the best case, this script is suposed to do nothing, since the quests
; usually should advance when the player takes an item. But this function 
; can be used as a safe-guard in case the player takes the item before he 
; is suposed to. It takes as input parameters the stage and objective state
; the quest is suposed to have when the player aquire the item, and the 
; item object reference.
;
; Input: Quest myQuest - quest where the stage is suposed to change. If this
;                        script is called within the quest, you may use Self. 
;                        If it is called from a script fragment, 
;                        use GetOwningQuest().
; Input: ObjectReference theObject - Object that should be thaken. If the 
;                                    object is stored in an AliasReference,  
;                                    use GetReference() method. It handles
;                                    the case the parameter is null.
; Input: string objectLabel - Just an object label used in the logs for debug.
; Input: int objToComplete - Objective to be complete when the player aquire 
;                            the item.
; Input: int nextObj - Objective to be displayed when the player aquire 
;                      the item.
; Input: int nextStage - Stage to be advanced when the player aquire the item.
; Input: string callerScript - script who called this method. Used only for 
;                              logs for debug..
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function advanceIfAlreadyTaken(Quest myQuest, ObjectReference theObject, string objectLabel, int objToComplete,  int nextObj, int nextStage, string callerScript) global
    string logCall = logPrefix(callerScript)
    Debug.Trace(logCall + " -- advanceIfAlreadyTaken()")
    ; check input
    if (myQuest == None)
        Debug.Trace(logCall + "**ERROR** myQuest IS EMPTY", 2)
        return false
    endif
    if (theObject == None)
        Debug.Trace(logCall + "**ERROR** theObject" + objectLabel + " IS EMPTY", 2)
        return false
    endif
    int countItems = Game.GetPlayer().GetItemCount(theObject)
    ; player has not taken the object => ok
    if (countItems == 0)
        Debug.Trace(logCall + " -- player has not taken the object yet.")
        return true
    endif
    Debug.Trace(logCall + "**WARNING** player already taken the object.", 1)
    ; complate objective
    Debug.Trace(logCall + " DONE Objective: " + objToComplete) 
    if(objToComplete > 0)
        myQuest.SetObjectiveCompleted(objToComplete)
    endif       
    ; advance quest
    Debug.Trace(logCall + " SET  Stage/Objective: " + nextStage + "/" + nextObj)
    if(nextObj > 0)
        myQuest.SetObjectiveDisplayed(nextObj)
    endif 
    if(nextStage > 0)
        myQuest.SetStage(nextStage)
    endif
    return true
Endfunction

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
    if (npc == None)
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
;; REPORT ACTOR OBJECT STATE
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
bool Function areAllActorsRefAliasDead(ReferenceAlias[] npcsArray, string callerScript) global
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
;; CHANGE ACTOR OBJECT STATE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input : Actor npc - actor to be enabled
; Input : string actorName - name of the actor to be enabled. Is used only to 
;         to log information.
; Input : string callerScript - caller script name.  Is used only to log 
;         information.
;
; Enables an actor object. If the actor is dead, it resurrect it. 
; Returns true in case of success. In case of failure returns false and logs
; the error reason. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function enableActorRefAlias(ReferenceAlias npc, string actorName, string callerScript) global
    string loginfo = logPrefix(callerScript)
    if (npc == None) 
        Debug.Trace(loginfo + " **WARNING** CANNOT ENABLE ACTOR ReferenceAlias " + actorName + " Reason:IT IS EMPTY", 1)
        return false
    else
        return enableActor(npc.GetActorReference(), actorName, loginfo)
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
; Returns true in case of success. In case of failure returns false and logs
; the error reason. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function enableActor(Actor npc, string actorName, string callerScript) global
    string loginfo = logPrefix(callerScript)
    if (npc == None)
        Debug.Trace(loginfo + " **WARNING** CANNOT ENABLE ACTOR " + actorName + " Reason:IT IS EMPTY", 1)
        return false
    else
        if (npc.IsEnabled() == false)
            npc.Enable()
        endif
        if(npc.IsDead() == true)
            Debug.Trace(loginfo + " -- NPC " + actorName + " is dead! => Resurrect!")
            npc.Resurrect()
        endif
        return true
    endif
endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: ReferenceAlias obj - Object to be enabled ReferenceAlias.
; Input: string actorName - the name or actor label to be identifed on the logs
; 
; Enables an object using its alias reference, after checking if the reference 
; is empty. It it fails, logs an error message.
; Returns true in case of success. In case of failure returns false and logs
; the error reason. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function enableObjectRefAlias(ReferenceAlias objAlias, string objectName, string callerScript) global
    string loginfo = logPrefix(callerScript)
    if(objAlias != None)
        return enableObject(objAlias.GetReference(), objectName, loginfo)
    else
        Debug.Trace(loginfo + " **WARNING** ReferenceAlias to objAlias <" + objectName + "> is EMPTY!", 1)
        return false
    endif     
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: ObjectReference npc - the object to be enabled
; Input: string objName - the name or actor label to be identifed on the logs
; 
; Enable an ObjectReference after checking if the reference is empty. 
; It it fails,  logs an error message.
; Returns true in case of success. In case of failure returns false and logs
; the error reason. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function enableObject(ObjectReference obj, string objName, string callerScript) global
    string loginfo = logPrefix(callerScript)
    Debug.Trace(loginfo + " -- Enable Object " + objName + " <" + obj + ">")
    if(obj != None)
        if (obj.IsEnabled() == false)
            obj.Enable()
        endif
        return true
    else
        Debug.Trace(loginfo + " **ERROR** ObjectReference obj to <" + objName + "> is EMPTY!", 2)
        return false
    endif   
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: ReferenceAlias npc - the actor passed as a ReferenceAlias.
; Input: string actorName - the name or actor label to be identifed on the logs
; Input: string callerScript - script where this function was callet, used on
;            logs only. 
; 
; Disable an actor after checking if the reference is empty. It it fails, 
; logs an error message.
; Returns true in case of success. In case of failure returns false and logs
; the error reason. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function disableActorRefAlias(ReferenceAlias npc, string actorName, string callerScript) global
    string loginfo = logPrefix(callerScript)
    if(npc != None)
        return disableActor(npc.GetActorReference(), actorName, loginfo)
    else
        Debug.Trace(loginfo + " **ERROR** ReferenceAlias to npc " + actorName + " is EMPTY!", 2)
        return false
    endif     
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Actor npc - the actor to be disabled
; Input: string actorName - the name or actor label to be identifed on the logs
; Input: string callerScript - caller script, to log in case of error
; 
; Disable an actor after checking if the reference is empty. It it fails, 
; logs an error message.
; Returns true in case of success. In case of failure returns false and logs
; the error reason. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function disableActor(Actor npc, string actorName, string callerScript) global
    string loginfo = logPrefix(callerScript)
    Debug.Trace(loginfo + " -- Disable Actor " + actorName + " <" + npc + ">")
    if(npc != None)
        npc.Disable()
        return true
    else
        Debug.Trace(loginfo + " **ERROR** Actor npc " + actorName + " is EMPTY!", 2)
        return false
    endif     
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: ReferenceAlias obj - Object to be disabled ReferenceAlias.
; Input: string actorName - the name or actor label to be identifed on the logs
; Input: string callerScript - caller script, to log in case of error
; 
; Disable an object using its alias reference, after checking if the reference 
; is empty. It it fails, logs an error message.
; Returns true in case of success. In case of failure returns false and logs
; the error reason. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function disableObjectRefAlias(ReferenceAlias objAlias, string objectName, string callerScript) global
    string loginfo = logPrefix(callerScript)
    if(objAlias != None)
        return disableObject(objAlias.GetReference(), objectName, loginfo)
    else
        Debug.Trace(loginfo + " **ERROR** ReferenceAlias to object objAlias <" + objectName + "> is EMPTY!", 2)
        return false
    endif     
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: ObjectReference npc - the object to be disabled
; Input: string objName - the name or actor label to be identifed on the logs
; 
; Disable an ObjectReference after checking if the reference is empty. 
; It it fails,  logs an error message.
; Returns true in case of success. In case of failure returns false and logs
; the error reason. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function disableObject(ObjectReference obj, string objName, string callerScript) global
    string loginfo = logPrefix(callerScript)
    Debug.Trace(loginfo + " -- Disable Object " + objName + " <" + obj + ">")
    if(obj != None)
        obj.Disable()
        return true
    else
        Debug.Trace(loginfo +" **ERROR** ObjectReference to obj " + objName + " is EMPTY!", 2)
        return false
    endif   
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: ReferenceAlias obj - Object to be disabled ReferenceAlias.
; Input: string actorName - the name or actor label to be identifed on the logs
; Input: string callerScript - caller script, to log in case of error
; Return: true in case of success and false in case of error or failure.
; 
; Disable Actor of Reference Alias if actor is dead. Do nothing otherwise. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function disableActorRefAliasIfDead(ReferenceAlias npc, string actorName, string callerScript) global
    string loginfo = logPrefix(callerScript)
    if(npc != None)
        Actor npcActor = npc.GetActorReference()
        if(npcActor.IsDead() == true)
            Debug.Trace(loginfo + " -- Actor " + actorName + " is dead => disable")
            npcActor.Disable()
        endif
        return true
    else
        Debug.Trace(loginfo +" **ERROR** ObjectReference to obj " + actorName + " is EMPTY!", 2)
        return false
    endif  
Endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: ReferenceAlias actorRefAlias - the actor passed as a ReferenceAlias.
; Input: string actorLabel - the name or actor label to be identifed on the logs
; Input: string callerScript - script where this function was callet, used on
;            logs only. 
; 
; This method is just a helper for making an Actor invulnerable, but 
; checking if all the casts worked properly.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function makeRefAliasInvulnerable(ReferenceAlias actorRefAlias, string actorLabel, string callerScript) global
    string loginfo = logPrefix(callerScript)
    if(actorRefAlias == None)
        Debug.Trace(loginfo + " **ERROR** parameter actorRefAlias is EMPTY for actor " + actorLabel, 2)
        return false;
    endif
    Actor actorObj = actorRefAlias.GetActorReference()
    if(actorObj == None)
        Debug.Trace(loginfo + " **ERROR** COULD NOT CAST PARAMETER actorRefAlias<" + actorRefAlias + ">(LABEL: " + actorLabel + ") to and Actor object, it is EMPTY.", 2)
        return false;        
    endif
    ActorBase actorBaseObj = actorObj.GetActorBase()
    if(actorBaseObj == None)
        Debug.Trace(loginfo + " **ERROR** COULD NOT CAST PARAMETER actorRefAlias<" + actorRefAlias + ">(LABEL: " + actorLabel + ") to and ActorBase object, it is EMPTY.", 2)
        return false;            
    endif
    actorBaseObj.SetInvulnerable(true)
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Actor npc - the actor to have its race changed.
; Input: string npcName - the name of the actor. Used for log only.
; Input: string callerScript - the script to script where this function was 
;           called. Used for log only.
;
; Changes an Actor NPC race to the Player race.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function setPlayerRace(Actor npc, string npcName, string callerScript) global
    string loginfo = logPrefix(callerScript)
    if(npc == None)
        Debug.Trace(loginfo + " **ERROR** Provided NPC's actor object is EMPTY. npcName is" + npcName, 2)
        return false;        
    endif
    Race playerRace = Game.GetPlayer().GetRace()
    Debug.Trace(loginfo + " -- Player Race object: " + playerRace)
    npc.SetRace(playerRace)
    Debug.Trace(loginfo + " -- NPC " + npcName + " race was changed to player race.")
EndFunction 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CHANGE ACTOR BAHAVIOR IN THE WORLD
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
        Debug.Trace(loginfo + " **ERROR** CANNOT EXECUTE IDDLE ANIMATION (Actor object is EMPTY, disabled or dead!)", 2)      
    endif
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SCENES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Scene sceneObject - scene object that must be forced to run
; Input: string sceneName -   script name to be logged
; Input: string callerScript - Script wich called this function
;
; Force a scene to run maxTries times. If the quest is already running, it 
; does not start the quest.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function forceRunScene(Scene sceneObject, string sceneName, int maxTries, string callerScript) global
    int i = 0
    bool sceneIsRunning = sceneObject.IsPlaying()
    string loginfo = logPrefix(callerScript)
    if (sceneIsRunning == true)
        Debug.Trace(loginfo + " -- scene is already running")
        return true
    endif
    while (i < maxTries)
        Debug.Trace(loginfo + " -- running scene " + sceneName + " try [" + i + "/" + maxTries + "]")
        sceneObject.ForceStart()
        Utility.Wait(0.5)
        sceneIsRunning = sceneObject.IsPlaying()
        if(sceneIsRunning == true)
            Debug.Trace(loginfo + " -- SCENE <" + sceneName + "> IS RUNNING")
            i = maxTries
        else
            i += 1
        endif
    endWhile
    return sceneIsRunning
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



