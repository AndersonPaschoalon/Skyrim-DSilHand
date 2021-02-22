Scriptname DSilHand_DrunkenEntranceTrigger extends ObjectReference  
{Trigger for the entrance on the tavern "The Drunken Huntsman" }


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GlobalVariable Property DSilHand_hasQuestStarted  Auto  
{Tells if the main quest of the Silver hand have been started yet.}

Quest Property DSilHand_M10SilverHunt  Auto  
{First quest of the Silver Hand questline.}

Actor Property WhiterunSpy  Auto  
{Silverhand Spy on Whiterun.}


String THIS_FILE = "(DSilHandDrunkenEntranceTrigger.pcs)  "
Float GLOBAL_TRUE = 1.0
Float GLOBAL_FALSE = 0.0
; Number of times the Spy have talked about daedra and dogs 
; (if you have not starte the quest yet)... Its max value
; is defined by MAX_SPY_TALK.
Int hasTheSpyTalked = 0
Int MAX_SPY_TALK = 5 

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
    Debug.Trace("firstMetConversation: DSilHand_M10SilverHunt.GetStage():" + DSilHand_M10SilverHunt.GetStage())
    ; update globals
    updateGlobals()
    Float hasQuestStartedVal = DSilHand_hasQuestStarted.GetValue()
    ; procedure if the quest have not started yet
    ; Debug.MessageBox("TODO: The character should engage a conversation with you")
    ; TODO the spy should start talking about dirty dogs and daedra
    if(hasQuestStartedVal != GLOBAL_TRUE)
        if(hasTheSpyTalked < MAX_SPY_TALK)
            hasTheSpyTalked = hasTheSpyTalked + 1
            Debug.Trace(THIS_FILE + "TODO: Make the SPY talk!")
        endif
    endif
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
        Debug.Trace(THIS_FILE + "DSilHand_M10SilverHunt:<" + DSilHand_M10SilverHunt + ">");
        Debug.Trace(THIS_FILE + "Starting Quest!");
        Bool ret = DSilHand_M10SilverHunt.Start() 
        Debug.Trace(THIS_FILE + "ret = " + ret);
        DSilHand_hasQuestStarted.SetValue(GLOBAL_TRUE)
        Debug.Trace(THIS_FILE + "DSilHand_M10SilverHunt:<" + DSilHand_M10SilverHunt + ">");
        Debug.Trace(THIS_FILE + "-- quest DSilHand_M10SilverHunt started, DSilHand_hasQuestStarted set as TRUE")
    endif
Endfunction