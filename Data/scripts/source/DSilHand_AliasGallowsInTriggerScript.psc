Scriptname DSilHand_AliasGallowsInTriggerScript extends ReferenceAlias  
{DSilHand_AliasGallowsInTriggerScript Script to notify the player has just entered on Gallows rock, on the Quest M60 (Retaliation). }

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Quest Property DSilHand_M60Retaliation  Auto  
;{DSilHand_M60Retaliation Quest reference to start the next stage when the Dragonborn enters on Gallows Rock fort during the companion invasion. }

;Quest Property DSilHand_M50WolfAmbush  Auto  
;{DSilHand_M50WolfAmbush reference to the last Quest. The Last quest (M50) must be completed to enable the trigger activation.}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  NENBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

String THIS_FILE = "(DSilHand_AliasGallowsInTriggerScript.psc) "
Int M50_FINAL_STAGE = 40

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: player
; 
; Advances the quest M60 to the next stage (Stage 20), so the NPCs will be
; moved and all the setup will be prepared. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnTriggerEnter(ObjectReference akTriggerRef)
;    if(DSilHand_M50WolfAmbush != None)
        ; The last quest must be completed to enable this trigger to be activated
;        if( (akTriggerRef == Game.GetPlayer()) && (DSilHand_M50WolfAmbush.GetStage() >= M50_FINAL_STAGE ))
            Debug.Trace(THIS_FILE + " -- The player activated the trigger DSilHand_AliasGallowsInTriggerScript!")
            if(GetOwningQuest() != None)
                ; In the case the quest did not started yet -- this should not happen!
                if(GetOwningQuest().GetStage() == 0)
                    Debug.Trace(THIS_FILE + " **WARNING** DSilHand_M60Retaliation did not started in the usual way!!")
                    GetOwningQuest().Start()
                endif
                ; Complete Objective 10 in case the player did not talked with the Guard
                GetOwningQuest().SetObjectiveCompleted(10);
                ; Advances the quest
                Debug.Trace(THIS_FILE + " -- Stage:20, ObjectiveDisplayed:20")
                GetOwningQuest().SetStage(20)
                GetOwningQuest().SetObjectiveDisplayed(20)
            else
                Debug.Trace(THIS_FILE + " **ERROR** DSilHand_M60Retaliation quest reference is EMPTY!!")
            endif
;        endif
;    else
        Debug.Trace(THIS_FILE + " **ERROR** DSilHand_M50WolfAmbush quest reference is EMPTY!!")
;    endif
EndEvent
