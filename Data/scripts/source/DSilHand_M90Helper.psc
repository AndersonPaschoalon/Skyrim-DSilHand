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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Member variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Consts
String THIS_FILE = "(DSilHand_M90Helper.psc) "

; state
int countWitchDeaths = 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Public Methods
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
;
; This method must be called when a Witch is killed, so we may keep track of 
; how many have died. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Function sinalizeWitchKill()
;    Debug.Trace(THIS_FILE + " -- sinalizeWitchKill()")
;    countWitchDeaths += 1
;    Debug.Trace(THIS_FILE + " -- countWitchDeaths:<" +  countWitchDeaths + ">"))
;EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; Return: numver of witches that have been killed.
; 
; Returns the number of killed withches.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;int Function countKilledWitches()
;    Debug.Trace(THIS_FILE + " -- countKilledWitches() countWitchDeaths:<" +  countWitchDeaths + ">")
;    return countWitchDeaths
;EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Function f()
;EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Function f()
;EndFunction

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
; Input: void
;
; Enable the Glowing Kodlak at Sovngarde, representing his soul after being 
; freed.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function enableKodlakSovngarde()
    Debug.Trace(THIS_FILE + " -- enableKodlakSovngarde()")
    DSilHand_Utils.enableActor(KodlakSovngarde, "KodlakSovngarde", THIS_FILE)
EndFunction


