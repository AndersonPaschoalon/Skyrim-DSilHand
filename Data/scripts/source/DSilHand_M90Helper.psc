Scriptname DSilHand_M90Helper extends Quest  
{Routines helper for quest M90.}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Actor Property KodlakSovngarde  Auto  
{Reference to the Kodlak object at Sovngarde}

ObjectReference Property dunGlenmorilAspirantMarker  Auto  
{Object reference enabler for all for the default withces on the dungeon}

ObjectReference Property DSilHand_glenmorilWitches  Auto  
{Object reference enabler of all the witches used on the quest M90}

ReferenceAlias Property KodlaksGhost  Auto  
{Reference Alias to Kodlak's Ghost}

WEAPON Property C06BladeOfYsgramor  Auto  
{Wuulthad weapon object}

ReferenceAlias Property fjol  Auto  
{Fjol reference alias}

ReferenceAlias Property ShieldOfYsgramor  Auto  
{Reference Alias  to Shield of Ysgramor}

Int Property countWitchHeads  Auto  
{Number of collected witch heads on the quest M90}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Member variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Consts
String THIS_FILE = "(DSilHand_M90Helper.psc) "
int KODLACK_WAITING_TIME = 10


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Public Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; (1) prepare the witches on Glenmoril Coven
; (2) prepare Ysgramor Tomb (Ygramour shield and Kodlack ghost)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function setupQuestWorldElements()
    Debug.Trace(THIS_FILE + " -- setupQuestWorldElements()")
    setupGlenmorilCoven()
    resetWitchCounter()
    setupYsgramorTomb()
EndFunction 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; Returns: Witch Head counter value.
; 
; Increment the collected Witch's Heads counter. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
int Function collectWitchHead()
    Debug.Trace(THIS_FILE + " -- collectWitchHead():" + countWitchHeads)
    countWitchHeads += 1
    return countWitchHeads    
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; Returns: Witch Head counter value.
; 
; Returns the collected Witch's Heads counter value. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
int Function getCollectedWitchHeads()
    Debug.Trace(THIS_FILE + " -- getCollectedWitchHead():" + countWitchHeads)
    return countWitchHeads    
EndFunction



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; Make Kodlak ghost desapear after some waiting time.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function saveKodlakSoul()
    Debug.Trace(THIS_FILE + " -- saveKodlakSoul()")
    ; make ghost look at the player
    Actor kodlakActor = KodlaksGhost.GetActorReference()
    if(kodlakActor != None)
        Debug.Trace(THIS_FILE + " --  kodlakActor.SetLookAt()")
        kodlakActor.SetLookAt(Game.GetPlayer(), true)
    else
        Debug.Trace(THIS_FILE + " **ERROR** kodlakActor FROM KodlaksGhost.GetActorReference() IS EMPTY", 2) 
    endif
    ; wait some time
    Debug.Trace(THIS_FILE + " -- wait " + KODLACK_WAITING_TIME + " seconds...")
    Utility.Wait(KODLACK_WAITING_TIME)
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; This method is responsible for prepare all the after quest settings, such
; as:
; (1) Send Kodlack to Sovngarde
; (2) Enable the Hagravens on Glenmoril Coven (using 
;     dunGlenmorilAspirantMarker)
; (3) Register for Update the startup of quest about the Totens of Hircine
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function finalizeQuest()
    Debug.Trace(THIS_FILE + " -- finalizeQuest()")
    ; Send Kodlack on Sovngarde
    enableKodlakSovngarde()
    ; Enable default Witches
    if(dunGlenmorilAspirantMarker != None)
        dunGlenmorilAspirantMarker.Enable()
    else
        Debug.Trace(THIS_FILE + " **WARNING** Error Enabling dunGlenmorilAspirantMarker, object is EMPTY!", 1)
    endif
    ; Disable DSilHand witches from M90
    if(dunGlenmorilAspirantMarker != None)
        DSilHand_glenmorilWitches.Disable()
    else
        Debug.Trace(THIS_FILE + " **WARNING** Error on Disabling DSilHand_glenmorilWitches, object is EMPTY!", 1)
    endif 
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Private Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input:  void
; Return: returns true if the DSilHand_glenmorilWitches where successefully 
;         disabled, return false otherwise.
; 
; This method should prepare Glenmoril Coven for the quest:
; (1) It must disable the Hagraven through dunGlenmorilAspirantMarker
; (2) It must eneble all the DSilHand witches
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function setupGlenmorilCoven()
    Debug.Trace(THIS_FILE + " -- setupGlenmorilCoven()")
    ; Disable default Witches
    if(dunGlenmorilAspirantMarker != None)
        dunGlenmorilAspirantMarker.Disable()
    else
        Debug.Trace(THIS_FILE + " **WARNING** Error disabling dunGlenmorilAspirantMarker, object is EMPTY!", 1)
    endif
    ; Enable DSilHand witches from M90
    if(dunGlenmorilAspirantMarker != None)
        DSilHand_glenmorilWitches.Enable()
    else
        Debug.Trace(THIS_FILE + " **WARNING** Error Enabling DSilHand_glenmorilWitches, object is EMPTY!", 1)
        return false
    endif 
    return true
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; Returns: Witch Head counter value.
; 
; Sets the witch head's counter to zero (0).
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
int Function resetWitchCounter()
    Debug.Trace(THIS_FILE + " -- resetWitchCounter()")
    countWitchHeads = 0
    Debug.Trace(THIS_FILE + " -- countWitchHeads:" + countWitchHeads)
    return countWitchHeads
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; Give Wuulthrad Weapon to player.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function giveWuulthradToPlayer()
    Debug.Trace(THIS_FILE + " -- giveWuulthradToPlayer()")
    ; check if Fjol has Wuulthrad
    bool fjolHasWuulthrad = false
    Actor fjolObj = fjol.GetActorReference()
    if (fjolObj != None)
        int countAxe = fjolObj.GetItemCount(C06BladeOfYsgramor)
        if(countAxe > 0)
            Debug.Trace(THIS_FILE + " -- fjolObj.GetItemCount(C06BladeOfYsgramor):" + countAxe)
            fjolHasWuulthrad = true
        endif
    endif
    Debug.Trace(THIS_FILE + " -- fjolHasWuulthrad:" + fjolHasWuulthrad)
    ; Give the axe to the player
    if(fjolHasWuulthrad == true)
        Debug.Trace(THIS_FILE + " -- CHANGE WUULTHRAD TO PLAYER INVENTORY")
        fjolObj.RemoveItem(C06BladeOfYsgramor, 1, false, Game.GetPlayer())
    else
        Debug.Trace(THIS_FILE + "**WARNING** FJOL DOES NOT HAVE ANYMORE WUULTHRAD => SPAWN A NEW ON ON THE PLAYER INVENTORY.", 1)
        Game.GetPlayer().AddItem(C06BladeOfYsgramor)
    endif
    Debug.Trace(THIS_FILE + " -- Game.GetPlayer().EquipItem(C06BladeOfYsgramor)")
    Game.GetPlayer().EquipItem(C06BladeOfYsgramor)
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function setupYsgramorTomb()
    Debug.Trace(THIS_FILE + " -- setupYsgramorTomb()")
    ; Enable Ysgramor Shield
    DSilHand_Utils.enableObjectRefAlias(ShieldOfYsgramor, "ShieldOfYsgramor", THIS_FILE) 
    ; Enable Kodlack Ghost
    DSilHand_Utils.enableActorRefAlias(KodlaksGhost, "KodlaksGhost", THIS_FILE) 
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; Enable the Glowing Kodlak at Sovngarde, representing his soul after being 
; freed.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function enableKodlakSovngarde()
    Debug.Trace(THIS_FILE + " -- enableKodlakSovngarde()")
    DSilHand_Utils.enableActor(KodlakSovngarde, "KodlakSovngarde", THIS_FILE)
EndFunction


