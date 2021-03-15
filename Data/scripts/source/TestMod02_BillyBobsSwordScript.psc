Scriptname TestMod02_BillyBobsSwordScript extends ObjectReference  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Script properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Quest Property TestMod02_BillyBobAdventure  Auto  
{TestMod02_BillyBobAdventure}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Script Events
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Event OnInit()
    Debug.MessageBox("OnInit Billy Sword");
Endevent

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
    Debug.MessageBox("OnContainerChanged");
    if( akNewContainer == Game.GetPlayer() )
        Debug.Trace("BillyBobsSword was moved to the player inventory!!!")
        TestMod02_BillyBobAdventure.SetObjectiveCompleted(20)
        TestMod02_BillyBobAdventure.SetObjectiveDisplayed(30)
        TestMod02_BillyBobAdventure.SetStage(30)
    endIf
EndEvent


