Scriptname DSilHand_A03Helper extends Quest  
{Helper script to execute comands and actions.}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ObjectReference Property xMarker_YsgramorStatue  Auto  
{Enable parent for Ysgramor Statue}

ObjectReference Property xMarker_Manequim  Auto  
{Enable parent for Manequim}

ObjectReference Property xMarker_WeaponRacks  Auto  
{Enable parent for Weapon Racks}

ObjectReference Property xMarker_Forniture  Auto  
{Enable parent for Forniture}

ObjectReference Property xMarker_Storage  Auto  
{Enable parent for Storage}

ObjectReference Property xMarker_Decoration  Auto  
{Enable parent for Decoration}

MiscObject Property Gold001  Auto  
{Enable parent for Gold001}

Cell Property HouseInterior  Auto  
{The cell were the player house is located.}

Faction Property PlayerFaction  Auto  
{The player faction.}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Member variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Consts
String THIS_FILE = "(DSilHand_A03Helper.psc) "
int PRICE_FORNITURE = 2500 ;
int PRICE_STORAGE = 1500 ;
int PRICE_DECORATION = 2500 ; 
int PRICE_WEAPONRACK = 1500 ;
int PRICE_MANEQUIM = 3000 ; 
int PRICE_YSGRAMORSTATUE = 8500 ; 
int STAGE_ENABLE_HOUSE_ENHANCEMENTS = 10
int STAGE_ENHANCEMENTS_COMPLETED = 20


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Public Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; Output: true in case of success, false in case of failure
;
; Enable the forniture xmarker, and take out the price.
; GetGold Condition Function must be called to check if the player has 
; requested gold.
; GetDisabled must be called in the xMarker to check if the player has already
; bought the itens or not.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function enableForniture()
    Debug.Trace(THIS_FILE + " -- enableForniture()")
    Game.GetPlayer().RemoveItem(Gold001, PRICE_FORNITURE)
    bool retVal = DSilHand_Utils.enableObject(xMarker_Forniture,      "xMarker_Forniture ",    THIS_FILE)
    ; advances the stage if the player has all the enhancements
    updateStageIfAllEnabled()      
    return retVal
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; Output: true in case of success, false in case of failure
;
; Enable the storage xmarker and take out the price.
; GetGold Condition Function must be called to check if the player has 
; requested gold.
; GetDisabled must be called in the xMarker to check if the player has already
; bought the itens or not.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function enableStorage()
    Debug.Trace(THIS_FILE + " -- enableStorage()")
    Game.GetPlayer().RemoveItem(Gold001, PRICE_STORAGE)
    bool retVal = DSilHand_Utils.enableObject(xMarker_Storage,        "xMarker_Storage",       THIS_FILE)
     ; advances the stage if the player has all the enhancements
     updateStageIfAllEnabled()   
    return retVal
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; Output: true in case of success, false in case of failure
;
; Enable the storage xmarker and take out the price.
; GetGold Condition Function must be called to check if the player has 
; requested gold.
; GetDisabled must be called in the xMarker to check if the player has already
; bought the itens or not.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function enableDecoration()
    Debug.Trace(THIS_FILE + " -- enableDecoration()")
    Game.GetPlayer().RemoveItem(Gold001, PRICE_DECORATION)
    bool retVal = DSilHand_Utils.enableObject(xMarker_Decoration,     "xMarker_Decoration",    THIS_FILE)
    ; advances the stage if the player has all the enhancements
    updateStageIfAllEnabled()    
    return retVal
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; Output: true in case of success, false in case of failure
;
; Enable the manequim and weapon hacks xmarker and take out the price.
; GetGold Condition Function must be called to check if the player has 
; requested gold.
; GetDisabled must be called in the xMarker to check if the player has already
; bought the itens or not.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function enableWeaponRacks()
    Debug.Trace(THIS_FILE + " -- enableWeaponRacks()")
    Game.GetPlayer().RemoveItem(Gold001, PRICE_WEAPONRACK)
    bool retVal = DSilHand_Utils.enableObject(xMarker_WeaponRacks,       "xMarker_WeaponRacks",       THIS_FILE)
    ; advances the stage if the player has all the enhancements
    updateStageIfAllEnabled()    
    return retVal
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; Output: true in case of success, false in case of failure
;
; Enable the manequim  hacks xmarker and take out the price.
; GetGold Condition Function must be called to check if the player has 
; requested gold.
; GetDisabled must be called in the xMarker to check if the player has already
; bought the itens or not.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function enableManequim()
    Debug.Trace(THIS_FILE + " -- enableManequim()")
    Game.GetPlayer().RemoveItem(Gold001, PRICE_MANEQUIM)
    bool retVal = DSilHand_Utils.enableObject(xMarker_Manequim,       "xMarker_Manequim",       THIS_FILE)
    ; advances the stage if the player has all the enhancements
    updateStageIfAllEnabled()    
    return retVal
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; Output: true in case of success, false in case of failure
;
; Enable the ysgramour statue and take out the price.
; GetGold Condition Function must be called to check if the player has 
; requested gold.
; GetDisabled must be called in the xMarker to check if the player has already
; bought the itens or not.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function enableYsgramorStatue()
    Debug.Trace(THIS_FILE + " -- enableYsgramorStatue()")
    Game.GetPlayer().RemoveItem(Gold001, PRICE_YSGRAMORSTATUE)
    bool retVal = DSilHand_Utils.enableObject(xMarker_YsgramorStatue, "xMarker_YsgramorStatue", THIS_FILE)
    ; advances the stage if the player has all the enhancements
    updateStageIfAllEnabled()
    return retVal
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; Output: true in case of success, false in case of failure
;
; This methods encapsulate the player house aquisition procedure, and enable
; the house enhancements, setting the stage of the A03 quest to 10. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function playerAcquireHouse()
    Debug.Trace(THIS_FILE + " -- playerAcquireHouse()")
    ; Increment Game statistics
    Game.IncrementStat("Houses Owned")
    ; Enable the house enhancements
    bool retVal = SetStage(STAGE_ENABLE_HOUSE_ENHANCEMENTS)
    ; Make The player own the cell
    HouseInterior.SetFactionOwner(playerfaction)
    ; advances the stage if the player has all the enhancements
    updateStageIfAllEnabled()
    ; Return true in case of success, false in case of failure
    return retVal
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Private Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; Output:
; 
; This methods checks the player has bought all the house enhancements.
; If he has done so, advance the stage, so the dialogs with Senaar are not
; to be available anymore.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
Function updateStageIfAllEnabled()
    if (xMarker_YsgramorStatue.IsEnabled() && \
        xMarker_Manequim.IsEnabled() && \
        xMarker_WeaponRacks.IsEnabled() && \
        xMarker_Forniture.IsEnabled() && \
        xMarker_Storage.IsEnabled() && \
        xMarker_Decoration.IsEnabled())
        Debug.Trace(THIS_FILE + " ** All enhancements enabled, advancing to stage 20")
        SetStage(STAGE_ENHANCEMENTS_COMPLETED)
    endif
EndFunction






