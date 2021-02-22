Scriptname DSilHand_AliasCompNord2Script extends ReferenceAlias  
{DSilHand_AliasCompNord2Script script for quest M50}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Alias Property Njada  Auto  ; DONT USE IT

Quest Property DSilHand_M50WolfAmbush  Auto  

ReferenceAlias Property NjadaRef  Auto  

String THIS_FILE = "(DSilHand_AliasCompNord2Script.psc) "

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
    if(NjadaRef != None)
        if(NjadaRef.GetActorRef().IsDead())
            DSilHand_M50WolfAmbush.SetObjectiveCompleted(20)
            DSilHand_M50WolfAmbush.SetObjectiveDisplayed(30)
            DSilHand_M50WolfAmbush.SetStage(30)
        else
            Debug.Trace(THIS_FILE + " -- Njada is not Dead yet...")
        endif        
    else 
        Debug.Trace(THIS_FILE + " **ERROR** Njada ReferenceAlias is NULL")
    endif
endEvent

