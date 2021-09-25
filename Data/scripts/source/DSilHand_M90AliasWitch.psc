Scriptname DSilHand_M90AliasWitch extends ReferenceAlias  
{Script to deal with the Witches decaptation on the quest M90.}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ReferenceAlias Property HEAD  Auto  
{Reference Alias to the actual witch head the body is pointing to.}

String Property WitchLabel  Auto  
{Label wich wil be used as Alias identifier for the Witch on the logs. It is an optional parameter and will not cause any error if not filled}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Member variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Consts
String THIS_FILE = "(DSilHand_M90AliasWitch.psc) "


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Private Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; Handler to wich death, to put an witchhead inside her inventory.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function handlerWitchDeath()
    Actor witchObj = GetActorReference()
    ObjectReference headObject = HEAD.GetReference()
    if(witchObj != None)
        if(headObject != None)
            witchObj.AddItem(headObject)
        else
            Debug.Trace(THIS_FILE + "**ERROR** on " + WitchLabel + " CANNOT CAST ReferenceAlias TO ObjectReference OBJECT.", 2)
            Debug.Trace(THIS_FILE + "**ERROR** on " + WitchLabel + " (ReferenceAlias) HEAD:<" + HEAD + ">", 2)
        endif
    else
        Debug.Trace(THIS_FILE + "**ERROR** on " + WitchLabel + " CANNOT CAST ReferenceAlias TO Actor OBJECT.", 2)
        Debug.Trace(THIS_FILE + "**ERROR** on " + WitchLabel + " (ObjectReference) GetReference:<" + GetReference() + ">", 2)
    endif
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Events
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Event OnDeath(Actor akKiller)
    Debug.Trace(THIS_FILE + " -- Event OnDeath() of witch <" + WitchLabel + ">")
    handlerWitchDeath()
endEvent

