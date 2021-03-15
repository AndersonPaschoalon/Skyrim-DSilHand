Scriptname TestMod02_BadGuyScript extends ObjectReference  
{Functions and event related to the bad guy on TestMod02}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Script properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Quest Property TestMod02_BillyBobAdventure  Auto  
{TestMod02_BillyBobAdventure Quest}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Script Events
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Event OnDeath(Actor akKiller)
    Debug.MessageBox("akKiller:" + akKiller);
    Debug.MessageBox("GetStage:" + TestMod02_BillyBobAdventure.GetStage());
    if(TestMod02_BillyBobAdventure.GetStage() == 10)
        TestMod02_BillyBobAdventure.SetObjectiveCompleted(10)
        TestMod02_BillyBobAdventure.SetObjectiveDisplayed(20, true, true)
        TestMod02_BillyBobAdventure.SetStage(20)
        Debug.MessageBox("GetStage:" + TestMod02_BillyBobAdventure.GetStage());
    Endif
Endevent 
