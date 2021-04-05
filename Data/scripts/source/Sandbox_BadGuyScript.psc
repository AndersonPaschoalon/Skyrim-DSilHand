Scriptname Sandbox_BadGuyScript extends ObjectReference  
{Functions and event related to the bad guy on Sandbox}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Script properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Quest Property Sandbox_BillyBobAdventure  Auto  
{Sandbox_BillyBobAdventure Quest}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Script Events
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Event OnDeath(Actor akKiller)
    Debug.MessageBox("akKiller:" + akKiller);
    Debug.MessageBox("GetStage:" + Sandbox_BillyBobAdventure.GetStage());
    if(Sandbox_BillyBobAdventure.GetStage() == 10)
        Sandbox_BillyBobAdventure.SetObjectiveCompleted(10)
        Sandbox_BillyBobAdventure.SetObjectiveDisplayed(20, true, true)
        Sandbox_BillyBobAdventure.SetStage(20)
        Debug.MessageBox("GetStage:" + Sandbox_BillyBobAdventure.GetStage());
    Endif
Endevent 