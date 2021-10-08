Scriptname DSilHand_S02AliasEternalFlame extends ReferenceAlias  
{Alias script for the Ethernal Flame manipulation.}

Message Property DSilHand_BurnTotemQuestion  Auto  
{Menu to ask to the player if he want to butn the totems now or not.}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Consts
String THIS_FILE = "(DSilHand_S02AliasEternalFlame.psc) "
int STAGE_BURN_TOTEMS = 40
int STAGE_AFTER_BURN = 50
int MENU_YES = 0
INT MENU_NO = 1


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PRIVATE METHODS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Ethernal flame activator.
;
; Handler the Ethernal Flame activation to burn the Hircine totems. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function burnTotemsHandler(ObjectReference akActivator)
    Debug.Trace(THIS_FILE + " S02 Stage:" + GetOwningQuest().GetStage() + "/" + STAGE_BURN_TOTEMS)
    Debug.Trace(THIS_FILE + " S02 akActivator:" + akActivator)
    if ( (GetOwningQuest().GetStage() == STAGE_BURN_TOTEMS) && (Game.GetPlayer() == akActivator) )
        int mnuAns = DSilHand_BurnTotemQuestion.Show()
        if (mnuAns == MENU_YES)
            Debug.Trace(THIS_FILE + " burnTotemsHandler()")
            DSilHand_S02Helper s02Helper = (GetOwningQuest() as DSilHand_S02Helper)
            if(s02Helper != None)
                s02Helper.playerBurnTotems()
            else
                Debug.Trace(THIS_FILE + "**ERROR** CAST OF DSilHand_S02Helper SCRIPT FAILED!")
            endif
            ; ADVANCES THE QUEST
            DSilHand_Utils.advanceQuest(GetOwningQuest(), STAGE_BURN_TOTEMS, STAGE_AFTER_BURN, STAGE_AFTER_BURN, THIS_FILE)
        else
            Debug.Trace(THIS_FILE + " -- PLAYER CHOOSE TO NOT BURN NOW. DO NOTHING!")
        endif
    endif
EndFunction 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; so existing saves will still function after Waiting/Done states were added
Event OnActivate(ObjectReference akActivator)
    Debug.Trace(THIS_FILE + " OnActivate()")
    burnTotemsHandler(akActivator)
EndEvent



