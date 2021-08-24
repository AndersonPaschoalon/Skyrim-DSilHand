Scriptname DSilHand_M80AliasKodlaksJournal extends ReferenceAlias  
{DSilHand: Script for Kodlaks Journal.}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ReferenceAlias Property Frag05  Auto  
{ReferenceAlias to the last Wuuthrad fragment, wich was inside Kodlack diary}

ReferenceAlias Property Desk  Auto  
{ReferenceAlias to the Desk where Kodlak stored his diary}

Quest Property DSilHand_mi03preHonYsgramor  Auto  
{Quest object DSilHand_mi03preHonYsgramor, wich trigger the last quest}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
String THIS_FILE = "(DSilHand_M80AliasKodlaksJournal.psc) "
int QUEST_STAGE_FRAMENT = 80
int QUEST_STAGE_MISCPREM90_SETUP = 10


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
;
; Input 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnRead()
    if (GetOwningQuest().GetStage() == QUEST_STAGE_FRAMENT)
        Debug.Trace(THIS_FILE + " --OnRead() : player readed Kodlack diary. The Fragment must be added to the player inventory!")
        ; Enable Wuultrad last frament
        Debug.Trace(THIS_FILE + " -- Enable Wuuthrad last frament Frag05")
        DSilHand_Utils.enableObjectRefAlias(Frag05, "Frag05", THIS_FILE)
        ; Show player message
        Debug.MessageBox("Once you opened the diary you've realized the last Wuuthrad fragment felt into the floor. You grabed it to your inventory.");
        ; Move the fragment to player inventory
        ; the quest stages and objectives will be updated on the OnContainerChanged() event of the fragment
        Desk.GetReference().RemoveItem(Frag05.GetReference(), 1, false)
        Game.GetPlayer().AddItem(Frag05.GetReference(), 1, false)
        ; Advences the pre-m90 misc quest
        DSilHand_mi03preHonYsgramor.Start()
        DSilHand_mi03preHonYsgramor.SetStage(QUEST_STAGE_MISCPREM90_SETUP)
    endif
EndEvent






