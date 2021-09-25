Scriptname DSilHand_M90AliasWitchHead extends ReferenceAlias  
{Script to deal with the Witch decaptation events on the quest M90.}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ActorBase Property baseActor  Auto  
{The ActorBase object form wich the witch was generated}

String Property witchHeadLabel  Auto  
{Label to identify the withch head on the log (this is an optional paramenter)}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Member variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Consts
String THIS_FILE = "(DSilHand_M90AliasWitchHead.psc) "
int NUMBER_OF_WITCHES = 5
; DEBUG VALUE
;int NUMBER_OF_WITCHES = 1
int STAGE_KILL_WITCHES = 10
int STAGE_BURN_WITCH_HEADS = 20


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Private Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Advances the quest to the stage where the player must burn the Witches heads
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function advancesQuestStage()
    Debug.Trace(THIS_FILE + " -- advancesQuestStage() for " + witchHeadLabel)
    GetOwningQuest().SetObjectiveCompleted(STAGE_KILL_WITCHES)
    GetOwningQuest().SetStage(STAGE_BURN_WITCH_HEADS)
    GetOwningQuest().SetObjectiveDisplayed(STAGE_BURN_WITCH_HEADS)
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Handler to witch container change event.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function handlerHeadContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
    Debug.Trace(THIS_FILE + " -- handlerHeadContainerChanged() for " + witchHeadLabel)
    DSilHand_M90Helper m90Helper = (GetOwningQuest() as DSilHand_M90Helper)
    ObjectReference witchHeadObj = GetReference()
    if(witchHeadObj != None && m90Helper != None)
        Debug.Trace(THIS_FILE + " -- Decapit Witch procedure for witch head " + witchHeadLabel + "...")
        ; replace the witch by a decapted witch
        if (akNewContainer == Game.GetPlayer())
            Utility.Wait(0.1)
            if (akOldContainer.GetBaseObject() == baseActor)
                ; decapit procedure
                ObjectReference body = witchHeadObj.GetLinkedRef()
                Debug.Trace(THIS_FILE + " -- Collecting head; new body is " + body)
                body.MoveTo(akOldContainer)
                body.Enable()
                akOldContainer.RemoveAllItems(body)
                akOldContainer.Delete()
                ; increment witch head counter
                m90Helper.collectWitchHead()
            endif
        endif
        ; advance the quest in case the player have depcated all the witches
        int countWitchHead = m90Helper.getCollectedWitchHeads()
        Debug.Trace(THIS_FILE + " -- Witch Head counter: " + countWitchHead + "/" + NUMBER_OF_WITCHES)
        if (countWitchHead >= NUMBER_OF_WITCHES) 
            advancesQuestStage()
        endif
    else
        Debug.Trace(THIS_FILE + " **ERROR** OBJECT TO THE WITCH HEAD IS NULL <" + witchHeadLabel + ">", 2) 
        Debug.Trace(THIS_FILE + " **WARNING** ADVANCES THE QUEST SO IT WILL NOT GET STUCKED <" + witchHeadLabel + ">", 1) 
        Debug.Trace(THIS_FILE + " **WARNING**  witchHeadObj<:" + witchHeadObj + ">")
        Debug.Trace(THIS_FILE + " **WARNING**  m90Helper<:" + m90Helper + ">")
        advancesQuestStage()
    endif
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Events
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; OnContainerChanged() witch head event
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
    Debug.Trace(THIS_FILE + " -- OnContainerChanged()")
    handlerHeadContainerChanged(akNewContainer, akOldContainer)
EndEvent

