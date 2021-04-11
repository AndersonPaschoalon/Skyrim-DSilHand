Scriptname DSilHand_AliasNjadaScript extends ReferenceAlias  
{DSilHand_AliasNjadaScript Script for quest M50}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Alias Property NjadaShield  Auto  ; DONT USE IT

Quest Property DSilHand_M50WolfAmbush  Auto  

ReferenceAlias Property NjadaRef  Auto   ; DONT USE IT

ReferenceAlias Property NjadaShieldRef  Auto  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

String THIS_FILE = "(DSilHand_AliasNjadaScript.psc) "

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
    if(NjadaShieldRef != None)
        if(NjadaShieldRef.GetActorRef().IsDead())
            DSilHand_M50WolfAmbush.SetObjectiveCompleted(20)
            DSilHand_M50WolfAmbush.SetObjectiveDisplayed(30)
            DSilHand_M50WolfAmbush.SetStage(30)
        else
            Debug.Trace(THIS_FILE + " -- Njada Shield Brother (DSilHand_CompanionRokieNord02) is not Dead yet...")
        endif  
    else 
        Debug.Trace(THIS_FILE + "**ERROR** ReferenceAlias NjadaShieldRef IS NULL")
    endif
endEvent

