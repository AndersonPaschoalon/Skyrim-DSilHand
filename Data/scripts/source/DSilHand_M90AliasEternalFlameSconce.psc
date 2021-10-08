Scriptname DSilHand_M90AliasEternalFlameSconce extends ReferenceAlias  
{Script foir the alias to the object C06EternalFlameScript}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

MiscObject Property WitchHead  Auto  
{Reference to the WitchHead object.}

Scene Property DSilHand_M90_SceneExtraction  Auto  
{Extraction scene, used to startup the }

VisualEffect Property WerewolfExtractVFX  Auto  
{WerewolfExtractVFX scene effect}

Message Property DSilHand_BurnWitchHeadsQuestion  Auto  
{Question: Do you want to burn the Wotches heads?}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Member variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Consts
String THIS_FILE = "(DSilHand_M90AliasEternalFlameSconce.psc) "
int NUMBER_OF_WITCH_HEADS = 5
int STAGE_BURN_WITCH_HEADS = 20
int STAGE_KILL_WOLF_SPIRIT = 30
int MENU_YES = 0
int MENU_NO = 1


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Private Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Burn the wiches head on the Harbinger Flame, and advance the quest to the 
; next stage.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function playerBurnWitchHeads()
    int mnuAns = DSilHand_BurnWitchHeadsQuestion.Show()
    if (mnuAns == MENU_YES)
        GoToState("Done")
        Debug.Trace(THIS_FILE + " -- Activating flame of the harbinger; removing head and starting extraction")
        Game.GetPlayer().RemoveItem(WitchHead, NUMBER_OF_WITCH_HEADS)
        Debug.Trace(THIS_FILE + " -- DSilHand_M90_SceneExtraction.Start()")
        DSilHand_M90_SceneExtraction.Start()
        Debug.Trace(THIS_FILE + " -- SetObjectiveCompleted/Displayed:" + STAGE_BURN_WITCH_HEADS  + "/" + STAGE_KILL_WOLF_SPIRIT)
        Debug.Trace(THIS_FILE + " -- SetStage:" + STAGE_KILL_WOLF_SPIRIT) 
        GetOwningQuest().SetObjectiveCompleted(STAGE_BURN_WITCH_HEADS)
        GetOwningQuest().SetStage(STAGE_KILL_WOLF_SPIRIT)
        GetOwningQuest().SetObjectiveDisplayed(STAGE_KILL_WOLF_SPIRIT)
    else
        Debug.Trace(THIS_FILE + " -- PLAYER CHOOSE TO NOT BURN NOW. DO NOTHING!")
    endif
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Events
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Ready for quest activation
auto State Waiting
	Event OnActivate(ObjectReference akActivator)
        Debug.Trace(THIS_FILE + " Activating Eternal Flame!!! State Waiting")
        Debug.Trace(THIS_FILE + " -- State Waiting OnActivate()")
		if (Game.GetPlayer() == akActivator)
            Debug.Trace(THIS_FILE + " -- Number of WitchHeads")
			if ( (GetOwningQuest().GetStage() == STAGE_BURN_WITCH_HEADS) && (Game.GetPlayer().GetItemCount(WitchHead) > 0) )
                playerBurnWitchHeads()
			endif
		endif
	EndEvent
EndState

; No more activation
State Done
	Event OnActivate(ObjectReference akActivator)
        Debug.Trace(THIS_FILE + " Activating Eternal Flame!!! State Done")
        Debug.Trace(THIS_FILE + " -- State Done OnActivate()")
	EndEvent
EndState

; so existing saves will still function after Waiting/Done states were added
Event OnActivate(ObjectReference akActivator)
    Debug.Trace(THIS_FILE + " Activating Eternal Flame!!! State None")
    Debug.Trace(THIS_FILE + " -- State Default OnActivate()")
	GoToState("Waiting")
	GetReference().Activate(akActivator)
EndEvent


