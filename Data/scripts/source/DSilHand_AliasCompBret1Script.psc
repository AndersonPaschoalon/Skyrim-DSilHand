Scriptname DSilHand_AliasCompBret1Script extends ReferenceAlias  
{DSilHand_AliasCompBret1Script reference alias script}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;DSilHand_M60Helper Property m60Helper Auto
;{DSilHand_M60Helper reference to the helper script.}

;Quest Property DSilHand_M60Retaliation  Auto  
;{DSilHand_M60Retaliation reference to the quest M60}

String THIS_FILE = "(DSilHand_AliasCompBret1Script.psc) "

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

;Event OnDeath(Actor akKiller)
;      Debug.Trace(THIS_FILE + "  -- Event OnDeath of Imp1")
;      bool allCompOutDead = m60Helper.invadersOutsideAreDead()
;      if(allCompOutDead == true)
;            Debug.Trace(THIS_FILE + " -- All Invaders are dead!")
;            ; Starts quest and advante to the next stage
;            DSilHand_M60Retaliation.Start()
;            DSilHand_M60Retaliation.SetStage(10)
;            DSilHand_M60Retaliation.SetObjectiveDisplayed(10)
;      endif
;EndEvent

