Scriptname DSilHand_AdvanceQuestOnPlayerAcquire extends ReferenceAlias  
{Sets a quest stage when this item is put in the player's inventory.}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

int Property stageToSet auto
{Set this stage when the player picks up this item.}

int Property preReqStage = -1 auto
{(Optional)Stage that must be set for this script to run. Default: NONE}

int Property objCompleted = -1 auto
{(Optional) Quest objective to be complleted. Default: NONE}

int Property objDisplayed = -1 auto
{(Optional) Quest objective to be displayed. Default: NONE}

Quest Property myQST auto
{(Optional) Quest upon which to set stage. Default is the Alias's owning quest.}

String Property questLabel  Auto  
{(Optional) A quest label do helps identify it on the logs.}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PRIVATE METHODS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; conss
string THIS_FILE = "(DSilHand_AdvanceQuestOnPlayerAcquire.PSC) "

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; A helper function to handle the player's object accisition, handling the
; proper actions on the properties.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function handlePlayerAcquire()
    Debug.Trace(THIS_FILE + "handlePlayerAcquire() ON QUEST " + questLabel + " => stageToSet:" + stageToSet + ", objCompleted:" + objCompleted + ", objDisplayed:" + objDisplayed)
	Quest qst = myQST
	if (qst == None)
		qst = GetOwningQuest()
	endif
	if ( (preReqStage == -1) || (qst.GetStage() >= preReqStage) )
		; Complete objective
		if (objCompleted != -1)
			qst.SetObjectiveCompleted(objCompleted)
		endif				
		; actually set the next stage
		qst.SetStage(stageToSet)
		; set new objective
		if (objDisplayed != -1)
			qst.SetObjectiveDisplayed(objDisplayed)
		endif				
		GoToState("inactive")
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; object is waiting to be taken
auto State waiting	

	Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
		if (Game.GetPlayer() == akNewContainer)
			handlePlayerAcquire()
		endif
	EndEvent

EndState

; object was already taken
State inactive
EndState

