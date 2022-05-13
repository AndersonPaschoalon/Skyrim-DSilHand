Scriptname DSilHand_S02Helper extends Quest  
{Script helper for the quest S02 Iconoclastic Revenge.}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


ReferenceAlias Property fjol  Auto  
{Reference Alias to Fjol Actor}

ReferenceAlias Property Totem1  Auto  
{Reference Alias to Totem1}

ReferenceAlias Property Totem2  Auto  
{Reference Alias to Totem2}

ReferenceAlias Property Totem3  Auto  
{Reference Alias to Totem3}

ReferenceAlias Property Chest1  Auto  
{Reference Alias to Chest1}

ReferenceAlias Property Chest2  Auto  
{Reference Alias to Chest2}

ReferenceAlias Property Chest3  Auto  
{Reference Alias to Chest3}

Actor Property ClearspringTarnTroll  Auto  
{Enemy of the first Totem.}

Actor Property CragwallowActor01  Auto  
{Cragwallow's Totem Owner.}

Actor Property CragwallowActor02  Auto  
{Cragwallow's Totem Owner.}

Actor Property MorvunskarActor01  Auto  
{Darklight Tower's Totem Owner.}

Actor Property MorvunskarActor02  Auto  
{Darklight Tower's Totem Owner.}

WEAPON Property DSilHand_LunarSilverSword  Auto  
{Lunar Silver Sword.}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Member variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Consts
String THIS_FILE = "(DSilHand_S02Helper.psc) "


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Public Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; Move the Totem1 object in the Chest1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function prepareFirstTotem()
    Debug.Trace(THIS_FILE + " -- prepareFirstTotem()")
    bool ret = DSilHand_Utils.moveObjectToContainer(Totem1, Chest1, "Totem1", "Chest1", THIS_FILE) 
    if(ret == false)
        Debug.Trace(THIS_FILE + "**WARNING** could not complete moveObjectToContainer() on First Totem", 1)
    endif
    ; ensure enemies are alive
    ClearspringTarnTroll.Resurrect()
Endfunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; Move the Totem2 object in the Chest2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function prepareSecondTotem()
    Debug.Trace(THIS_FILE + " -- prepareSecondTotem()")
    bool ret = DSilHand_Utils.moveObjectToContainer(Totem2, Chest2, "Totem2", "Chest2", THIS_FILE)
    if(ret == false)
        Debug.Trace(THIS_FILE + "**WARNING** could not complete moveObjectToContainer() on Second Totem", 1)
    endif
    ; ensure enemies are alive
    CragwallowActor01.Resurrect()
    CragwallowActor02.Resurrect()    
Endfunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; Move the Totem3 object in the Chest3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function prepareThirdTotem()
    Debug.Trace(THIS_FILE + " -- prepareThirdTotem()")
    bool ret = DSilHand_Utils.moveObjectToContainer(Totem3, Chest3, "Totem3", "Chest3", THIS_FILE) 
    if(ret == false)
        Debug.Trace(THIS_FILE + "**WARNING** could not complete moveObjectToContainer() on Third Totem", 1)
    endif
    ; ensure enemies are alive
    MorvunskarActor01.Resurrect()
    MorvunskarActor02.Resurrect()            
Endfunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; Player burn the Hircine Totems.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function playerBurnTotems()
    Debug.Trace(THIS_FILE + " -- playerBurnTotems()")
    ObjectReference objTotem1 = Totem1.GetReference()
    ObjectReference objTotem2 = Totem2.GetReference()
    ObjectReference objTotem3 = Totem3.GetReference()
    Game.GetPlayer().RemoveItem(objTotem1, 1)
    Game.GetPlayer().RemoveItem(objTotem2, 1)
    Game.GetPlayer().RemoveItem(objTotem3, 1)        
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; Give a Lunar Silver sword to the player as a reward.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function playerReward()
    Debug.Trace(THIS_FILE + " -- playerReward()")
    Game.GetPlayer().AddItem(DSilHand_LunarSilverSword)
EndFunction


