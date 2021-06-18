Scriptname DSilHand_AliasCompImp1Script extends ReferenceAlias  
{DSilHand_AliasCompImp1Script Script for the Companion Imperial invader.}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

String THIS_FILE = "(DSilHand_AliasCompImp1Script.psc) "

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: actor killer
; 
; Starts M60 quest, and advance to the stage 10 if all Companions invaders 
; outside are dead.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnDeath(Actor akKiller)
    DSilHand_M60Helper m60Helper = (GetOwningQuest() as DSilHand_M60Helper)
    bool allCompOutDead = m60Helper.invadersOutsideAreDead()
    if(allCompOutDead == true)
          Debug.Trace(THIS_FILE + " -- All Invaders are dead!")
          ; Starts quest and advante to the next stage
          GetOwningQuest().Start()
          GetOwningQuest().SetStage(10)
          GetOwningQuest().SetObjectiveDisplayed(10)  
    endif
EndEvent

