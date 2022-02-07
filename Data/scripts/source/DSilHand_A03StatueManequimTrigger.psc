Scriptname DSilHand_A03StatueManequimTrigger  extends ReferenceAlias  


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ObjectReference Property AxeChest  Auto  
{Chest for the Ysgramor Axe}

ObjectReference Property Statue  Auto  
{Ysgramor Statue}

ObjectReference Property StatueAxe  Auto  
{The Axe displayed by the statue.}

WEAPON Property C06BladeOfYsgramor  Auto  
{The Ysgramor Axe weapon object}

ObjectReference Property StatueAxeEnableParent  Auto 
{Enable parent of Ysgramour' Statue Axe.}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Member variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Consts
String THIS_FILE = "(DSilHand_A03StatueManequimTrigger.psc) "


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Private Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; Output: void
; 
; Ensure the Statue Axe is disabled
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function initializeStatue()
    Debug.Trace(THIS_FILE + " -- initializeStetue()")
    DSilHand_Utils.disableObject(StatueAxeEnableParent, "StatueAxeEnableParent", THIS_FILE)
Endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; Output: void
; 
; Moves the Player Axe to the chest, and activate the statue axe
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function initBlade()
    Debug.Trace(THIS_FILE + " -- initBlade()")
    ; do nothing?
Endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; Output: void
; 
; Wait a small time, and to the noblade state.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function activateBlade()
    Debug.Trace(THIS_FILE + " -- activateBlade()")
    Utility.Wait(0.5)
    GoToState("NoBlade")
Endfunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; Output: void
; 
; Disable the statue axe and move the axe from the chest to the player 
; inventory.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function initNoBlade()
    Debug.Trace(THIS_FILE + " -- initNoBlade()")
    ; Disable statue Axe
    DSilHand_Utils.disableObject(StatueAxeEnableParent, "StatueAxeEnableParent", THIS_FILE)
    ; Move axe from chest to player inventory
    AxeChest.RemoveItem(C06BladeOfYsgramor, 1, false, Game.GetPlayer())
    ; Equipe the axe
    Game.GetPlayer().EquipItem(C06BladeOfYsgramor)
Endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; Output: void
; 
; Check if the player is holding the axe. If he is, remove the weapon from
; the player's inventory placing it at the Axe Chest, activate teh statue axe 
; and than go to the Blade state.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function activateNoBlade()
    Debug.Trace(THIS_FILE + " -- activateNoBlade()")
    Weapon currWeapon = Game.GetPlayer().GetEquippedWeapon()
    if(currWeapon == C06BladeOfYsgramor)
        ; remove weapon from player inventory
        Game.GetPlayer().RemoveItem(currWeapon, 1, false, AxeChest)
        ; activate statue axe
        DSilHand_Utils.enableObject(StatueAxeEnableParent, "StatueAxeEnableParent", THIS_FILE)
        ; go to the blade state
        GoToState("Blade")
    else
        Debug.Notification("You must have Wuuthrad in your inventory to activate this statue.")
        Debug.Trace(THIS_FILE + " -- activateNoBlade() -- You must have Wuuthrad in your inventory to activate this statue.")
    endif
Endfunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Events
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Empty State

Event OnInit()
    Debug.Trace(THIS_FILE + " -- OnBeginState()  @State Default")
    ; Ensure the Statue Axe is disabled
    initializeStatue()
EndEvent
	
; activate statue
Event OnActivate(ObjectReference akActivator)
    if (Game.GetPlayer() == akActivator)
        Debug.Trace(THIS_FILE + " -- OnActivate() @State Default")
        ; Check if the player is holding the axe. If he is, Moves the Player 
        ; Axe to the chest, and activate the statue axe and go to the Blade state.
        ; Otherwise, do nothing
        activateNoBlade()
    endif
EndEvent
	
; Blade State

State Blade

	; initialize blade placement
	Event OnBeginState()
        Debug.Trace(THIS_FILE + " -- OnBeginState() @State Blade")
        initBlade()
	EndEvent
	
	; activate statue
	Event OnActivate(ObjectReference akActivator)
        if (Game.GetPlayer() == akActivator)
            Debug.Trace(THIS_FILE + " -- OnActivate()  @State Blade")
            ; Wait a small time, and to the noblade state
            activateBlade()
        endif
	EndEvent
    
EndState


; Blade NoBlade

State NoBlade

	; initialize blade placement
	Event OnBeginState()
        Debug.Trace(THIS_FILE + " -- OnBeginState() @State NoBlade")
        ; disable the statue axe and move the axe from the chest to the player inventory
        initNoBlade()
	EndEvent
	
	; activate statue
	Event OnActivate(ObjectReference akActivator)
        if (Game.GetPlayer() == akActivator)
            Debug.Trace(THIS_FILE + " -- OnActivate()  @State NoBlade")
            ; Check if the player is holding the axe. If he is, go to the Blade state.
            activateNoBlade()
        endif
	EndEvent
    
EndState









