Scriptname TestMod02_StartBillyBobAdventure extends ObjectReference  
{TestMod02_StartBillyBobAdventure}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Quest Property TestMod02_BillyBobAdventure  Auto  
{TestMod02_BillyBobAdventure}

Int triggerRunOnce = 0
String SRC_NAME = "(TestMod02_StartBillyBobAdventure.psc) "

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Events
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Event OnTriggerEnter(ObjectReference akTriggerRef)
    if(akTriggerRef == Game.GetPlayer())
        if(triggerRunOnce == 0)
            Debug.MessageBox(SRC_NAME + "OnTriggerEnter -> Starting TestMod02_BillyBobAdventure Quest...")
            Debug.Trace(SRC_NAME + "Starting TestMod02_BillyBobAdventure Quest...")
            TestMod02_BillyBobAdventure.Start()
            triggerRunOnce = 1
        endif            
    endif
EndEvent

Event OnTriggerLeave(ObjectReference akTriggerRef)
    if(akTriggerRef == Game.GetPlayer())
        if(triggerRunOnce == 0)
            Debug.MessageBox(SRC_NAME + "OnTriggerLeave-> Starting TestMod02_BillyBobAdventure Quest...")
            Debug.Trace(SRC_NAME + "Starting TestMod02_BillyBobAdventure Quest...")
            TestMod02_BillyBobAdventure.Start()
            triggerRunOnce = 1
        endif            
    endif
EndEvent



