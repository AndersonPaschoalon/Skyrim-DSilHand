Scriptname DSilHand_M50GallowsTrigger extends ReferenceAlias  
{DSilHand_AliasGallowsTriggerScript Script for M50 Quest}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Quest Property DSilHand_M50WolfAmbush  Auto  
{DSilHand_M50WolfAmbush reference}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
String THIS_FILE = "(DSilHand_AliasGallowsTriggerScript.psc) "
Bool completeQuest = false 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: player
; 
; Complete the quest M50 when the player arrives back to Gallows Rock.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnTriggerEnter(ObjectReference akTriggerRef)
    ; TODO checar se e o jogador que entra em gallows rock...
    if(DSilHand_M50WolfAmbush != None)
        if(DSilHand_M50WolfAmbush.GetStage() == 30 && completeQuest == false)
            DSilHand_M50WolfAmbush.SetObjectiveCompleted(30)
            DSilHand_M50WolfAmbush.SetStage(40)
            Debug.Trace(THIS_FILE + " -- QUEST M50 COMPLETED!!")
            completeQuest = true
        endif
    else
        Debug.Trace(THIS_FILE + " **ERROR** DSilHand_M50WolfAmbush Quest Reference is NULL");
    endif
EndEvent

