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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Member variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Consts
String THIS_FILE = "(DSilHand_M90AliasEternalFlameSconce.psc) "
int NUMBER_OF_WITCH_HEADS = 5
int STAGE_BURN_WITCH_HEADS = 20


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Private Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Burn the wiches head on the Harbinger Flame.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function playerBurnWitchHeads()
    GoToState("Done")
    Debug.Trace(THIS_FILE + " -- Activating flame of the harbinger; removing head and starting extraction")
    Game.GetPlayer().RemoveItem(WitchHead, NUMBER_OF_WITCH_HEADS)
    Debug.Trace(THIS_FILE + " -- DSilHand_M90_SceneExtraction.Start()")
    DSilHand_M90_SceneExtraction.Start()
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Events
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Ready for quest activation
auto State Waiting
	Event OnActivate(ObjectReference akActivator)
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
        Debug.Trace(THIS_FILE + " -- State Done OnActivate()")
	EndEvent
EndState

; so existing saves will still function after Waiting/Done states were added
Event OnActivate(ObjectReference akActivator)
    Debug.Trace(THIS_FILE + " -- State Default OnActivate()")
	GoToState("Waiting")
	GetReference().Activate(akActivator)
EndEvent










