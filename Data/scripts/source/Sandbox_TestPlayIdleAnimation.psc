Scriptname Sandbox_TestPlayIdleAnimation extends ObjectReference  

Idle Property IdleApplaud1  Auto  

Idle Property IdleApplaud2  Auto  

Idle Property IdleApplaud3  Auto  

Idle Property IdleApplaud4  Auto  

Idle Property IdleApplaud5  Auto  

Actor Property Act01  Auto  

Actor Property Act02  Auto  

Actor Property Act03  Auto  

Actor Property Act04  Auto  

Actor Property Act05  Auto  

Actor Property Act06  Auto  

Idle Property IdleApplaud6  Auto  


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

Function playIdleHelper(Actor actorObj, string actorName, Idle akIdle, string idleDescription, string callerScript) 
    ;Actor actorObj = aliasActor.GetReference() as Actor
    if (actorObj != None) && (actorObj.IsEnabled() == true) && (actorObj.IsDead() == false)
        if actorObj.PlayIdle(akIdle)
            Debug.Trace(callerScript + " -- idle animation (" + idleDescription + ") is running for Actor " + actorName + "...")
        else
            Debug.Trace(callerScript + " ** ERROR: Something went wrong on idle animation (" + idleDescription + ") for the Actor " + actorName + "...", 2)
            Debug.Trace(callerScript + " **  Idle akIdle:<" +  akIdle + ">")
            logActorStatus(actorObj, actorName, 2, callerScript)
        endIf    
    else
        Debug.Trace(callerScript + " **ERROR** CANNOT EXECUTE IDDLE ANIMATION (Actor object is EMPTY, disabled or dead!)", 2)      
    endif
EndFunction


Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("Test  Play Idle Applaud")
    playIdleHelper(Act01, "Act01", IdleApplaud1, "IdleApplaud1", "Sandbox_TestPlayIdleAnimation") 
    playIdleHelper(Act02, "Act02", IdleApplaud2, "IdleApplaud2", "Sandbox_TestPlayIdleAnimation") 
    playIdleHelper(Act03, "Act03", IdleApplaud3, "IdleApplaud3", "Sandbox_TestPlayIdleAnimation") 
    playIdleHelper(Act04, "Act04", IdleApplaud4, "IdleApplaud4", "Sandbox_TestPlayIdleAnimation") 
    playIdleHelper(Act05, "Act05", IdleApplaud5, "IdleApplaud5", "Sandbox_TestPlayIdleAnimation") 
    playIdleHelper(Act06, "Act06", IdleApplaud6, "IdleApplaud6", "Sandbox_TestPlayIdleAnimation") 
endEvent

