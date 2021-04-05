Scriptname Sandbox_TriggerTest01 extends ObjectReference  
{Sandbox_TriggerTest01}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Actor Property DragourMinion01  Auto  
{DragourMinion01}
Actor Property DragourMinion02  Auto  
{DragourMinion02}
Int Property runTriggerTwice = 0 Auto  
{runTriggerTwice}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Events
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Event OnTriggerEnter(ObjectReference akTriggerRef)
    if(akTriggerRef == Game.GetPlayer())
        if(runTriggerTwice < 2)
            Debug.MessageBox("runTriggerTwice:" + runTriggerTwice)
            if( !(DragourMinion01.IsEnabled() || DragourMinion02.IsEnabled()))
                Debug.MessageBox("Look Back!!!")
                DragourMinion01.Enable()
                DragourMinion02.Enable()
            else
                Debug.MessageBox("Take Care!")
            endif
        endif
        runTriggerTwice = runTriggerTwice + 1               
    endif
EndEvent








