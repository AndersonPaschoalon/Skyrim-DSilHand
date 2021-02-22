Scriptname DSilHand_AliasCompImp1Script extends ReferenceAlias  
{DSilHand_AliasCompImp1Script Script for the Companion Imperial invader.}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Quest Property DSilHand_M60Retaliation  Auto  
;{DSilHand_M60Retaliation reference to the quest M60.}

;DSilHand_M60Helper Property m60Helper Auto
;{DSilHand_M60Helper reference to the helper script.}

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
    Debug.MessageBox(THIS_FILE + "  -- Event OnDeath of Bret1")
    Debug.MessageBox("GetOwningQuest().GetStage():" + GetOwningQuest().GetStage())
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

