Scriptname DSilHand_DriftshadeEntranceTrigger extends ObjectReference  


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Quest Property DSilHand_M10SilverHunt  Auto  
{First quest of the Silver Hand questline.}

GlobalVariable Property DSilHand_hasQuestStarted  Auto  
{Tells if the main quest of the Silver hand have been started yet.}

Actor Property DriftshadeGuard  Auto  
{Driftshade refugee guard}

String THIS_FILE = "(DSilHand_DriftshadeEntranceTrigger.pcs)  "
Float GLOBAL_TRUE = 1.0
Float GLOBAL_FALSE = 0.0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Actor who entes on the trigger-box close to the Gallows Rock entrance. 
; 
; This is script is executed when the player entes on Gallows Rock
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnTriggerEnter(ObjectReference akTriggerRef)
    if( akTriggerRef == Game.GetPlayer())
        firstMetConversation()
    endif
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Actor who entes on the trigger-box close to the Gallows Rock entrance. 
; 
; This is script is executed when the player entes on Gallows Rock
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Event OnTriggerLeave(ObjectReference akTriggerRef)
;    if( akTriggerRef == Game.GetPlayer())
;        firstMetConversation()
;    endif
;EndEvent


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: none
; 
; First met conversation
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function firstMetConversation()
    Debug.Trace(THIS_FILE + "firstMetConversation")

    ; update globals
    updateGlobals()

    ; TODO Make the Gallows Guard Draw his weapon 
    ; TODO Close Gallows main entrance
    ; TODO make the guard start a conversation
    Debug.Trace(THIS_FILE + "OnTriggerEnter: Player")
    Debug.Trace(THIS_FILE + "GallowsGuard <" + DriftshadeGuard + ">.DrawWeapon()" )
    DriftshadeGuard.DrawWeapon(); https://www.creationkit.com/index.php?title=ForceGreet_(Procedure) 
    Debug.Trace(THIS_FILE + " Close Gallows Rock Door" )
    ; GallowsRockDoor.SetOpen()
Endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: none
; 
; Update this script Globals: 
; - DSilHand_hasQuestStarted: check if the fist quest have already been started
;   This Global variable may be changed by a trigger on Gallows Rock, 
;   Driftshade Refugee, or The Drunken Huntsman
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function updateGlobals()
    Debug.Trace(THIS_FILE + "-- updateGlobals()")
    Float hasQuestStartedVal = DSilHand_hasQuestStarted.GetValue()
    Debug.Trace(THIS_FILE + " DSilHand_hasQuestStarted:<" + hasQuestStartedVal + ">")
    if(hasQuestStartedVal == GLOBAL_FALSE)
        ; Quest have not been started yet
        ;Debug.MessageBox("Starting Quest!");
        DSilHand_M10SilverHunt.Start()
        DSilHand_hasQuestStarted.SetValue(GLOBAL_TRUE)
        Debug.Trace(THIS_FILE + "-- quest DSilHand_M10SilverHunt started, DSilHand_hasQuestStarted set as TRUE")
    endif
Endfunction

