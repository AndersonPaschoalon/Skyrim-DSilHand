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

Quest Property DSilHand_iM90Trigger  Auto  
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
; On read event.
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
        Debug.Trace(THIS_FILE + " -- Force Moving Journal to Player inventory")
        Game.GetPlayer().AddItem(Frag05.GetReference(), 1, false)
        ; **BUGFIX** move this journal to the player inventory as well
        ObjectReference journalObject = GetReference()
        if (journalObject != None)
            Debug.Trace(THIS_FILE + " -- moving Kodlak journal to player inventory")
            Game.GetPlayer().AddItem(journalObject, 1, false)
        else
            Debug.Trace(THIS_FILE + "**WARNING** journalObject = GetReference() IS EMPTY", 1)
        endif
        ; Advences the pre-m90 misc quest
        DSilHand_iM90Trigger.Start()
        DSilHand_iM90Trigger.SetStage(QUEST_STAGE_MISCPREM90_SETUP)
    endif
EndEvent






