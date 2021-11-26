Scriptname DSilHand_RadiantOnDeath extends ReferenceAlias  
{This script is used to advance the radiant quests from the mod DSilHand.}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Quest Property DSilHand_R00Contoller  Auto  
{Quest object pointing to the Radiant's quests controller.}

Int Property StageToSet  Auto  
{Stage to advance current quest.}

Int Property preReqStage  Auto  
{(optional) Stage that must be set for this script to run. Default: -1 (no pre-req)}

Int Property ObjectiveToComplete  Auto  
{Objective to be completed.}

Int Property ObjectiveToSet = -1 Auto  
{Objective to be set.}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Consts
String THIS_FILE = "(DSilHand_RadiantOnDeath.psc) "
int R00CONTROLLER_AFTERDEATH_STAGE = 100


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  PRIVATE FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: None
; Output: None
;
; If the reference actor dies in the right time, than proceed to the next
; stage of the quest, and advances the controller quest as well.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function onDeathHandler()
    Debug.Trace(THIS_FILE + " -- onDeathHandler()")
    int currStage = GetOwningQuest().GetStage()
    Debug.Trace(THIS_FILE + "    StageToSet:<" + StageToSet + ">")
    Debug.Trace(THIS_FILE + "    preReqStage:<" + preReqStage + ">")
    Debug.Trace(THIS_FILE + "    ObjectiveToComplete:<" + ObjectiveToComplete + ">")
    Debug.Trace(THIS_FILE + "    ObjectiveToSet:<" + ObjectiveToSet + ">")
    ; if no pre-req (-1) or pre-req is set, then proceed
    if (preReqStage == -1) || (preReqStage == currStage)
        ; Advances controller quest
        if(DSilHand_R00Contoller != None)
            Debug.Trace(THIS_FILE + " -- Advances DSilHand_R00Contoller")
            DSilHand_R00Contoller.SetStage(R00CONTROLLER_AFTERDEATH_STAGE)
        endif
        ; Stage to advance current quest 
        if(StageToSet != -1)
            Debug.Trace(THIS_FILE + " -- Advances quest to Stage " + StageToSet)
            GetOwningQuest().SetStage(StageToSet)
        endif
        ; Objective to be completed
        if(ObjectiveToComplete != -1)
            Debug.Trace(THIS_FILE + " -- Advances quest objective to " + ObjectiveToComplete)
            GetOwningQuest().SetObjectiveCompleted(ObjectiveToComplete)
        endif
        ; Objective to be displayed
        if(ObjectiveToSet != -1)
            Debug.Trace(THIS_FILE + " -- Display objective to " + ObjectiveToSet)
            GetOwningQuest().SetObjectiveDisplayed(ObjectiveToSet)
        endif
    endif
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: killer
; 
; Advances the quest M50 to the next stage if Njada and har shield brother are
; dead. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnDeath(Actor akKiller)
    Debug.Trace(THIS_FILE + " -- OnDeath()")
    onDeathHandler()
endEvent




