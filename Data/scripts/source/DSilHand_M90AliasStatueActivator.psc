Scriptname DSilHand_M90AliasStatueActivator extends ReferenceAlias  


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


WEAPON Property BladeOfYsgramor  Auto  
{Weapon object BladeOfYsgramor}

ObjectReference Property TombDoor  Auto  
{Object reference to the Tomb door to be opened after the statue activation}

ObjectReference Property BladeInstance  Auto  
{Object Reference to the Blade instance enabled on Ysgramor statue}

Actor Property ysgramorBladeOwner  Auto  
{Actor whose is carring the Ysgramor Axe (player or Fjol)}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Member variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Consts
String THIS_FILE = "(DSilHand_M90AliasStatueActivator.psc) "


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Private Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function activateStatue(ObjectReference akActivator)
    Debug.Trace(THIS_FILE + " -- activateStatue()")
    if (ysgramorBladeOwner == akActivator)
        ;if (akActivator.GetItemCount(BladeOfYsgramor) > 0)
            NorPortcullisSCRIPT doorScript = TombDoor as NorPortcullisSCRIPT
            if (TombDoor.IsDisabled())
                return
            endif
            akActivator.RemoveItem(BladeOfYsgramor, 1)
            GoToState("Blade")
        ;endif
    endif
EndFunction 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; Open the Ysgramor tomb door.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function openTombDoor()
    Debug.Trace(THIS_FILE + " -- openTombDoor()")
    BladeInstance.Enable()
    TombDoor.PlayAnimation("open")
    Utility.Wait(7)
    TombDoor.Disable(true)
EndFunction 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; Recover Ysgramor axe to its owner.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function recoverYsgramourAxe(ObjectReference akActivator)
    Debug.Trace(THIS_FILE + " -- recoverYsgramourAxe()")
    if (ysgramorBladeOwner == akActivator)
        if(akActivator == Game.GetPlayer())
            Debug.Trace(THIS_FILE + " You gave Wuulthrad back to Fjol")
        endif
        ysgramorBladeOwner.AddItem(BladeOfYsgramor, 1)
        ; forget it, don't close the door once it's been opened
        GoToState("Done") 
    endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Events
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

auto State NoBlade
    ; initialize statue
	Event OnBeginState()
        Debug.Trace(THIS_FILE + " -- OnBeginState()")
		BladeInstance.Disable()
		TombDoor.Enable(true)
	EndEvent
    ; activate statue
	Event OnActivate(ObjectReference akActivator)
        Debug.Trace(THIS_FILE + " -- OnActivate()")
        activateStatue(akActivator)
	EndEvent
EndState

State Blade

	Event OnBeginState()
        Debug.Trace(THIS_FILE + " -- OnBeginState()")
        openTombDoor()
	EndEvent
	
	Event OnActivate(ObjectReference akActivator)
        Debug.Trace(THIS_FILE + " -- OnActivate()")
        recoverYsgramourAxe(akActivator)
	EndEvent
    
EndState

State Done
	Event OnBeginState()
        Debug.Trace(THIS_FILE + " -- OnBeginState()")        
		BladeInstance.Disable()
	EndEvent
EndState

