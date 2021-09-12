Scriptname DSilHand_M90TriggerEnterYsgramorTomb extends ReferenceAlias  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ReferenceAlias Property fjol  Auto  
{Reference alias to Fjol on this quest}

Scene Property DSilHand_M90_SceneOpenTomb  Auto  
{Scene where Fjol to to the statue and activates it}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

String THIS_FILE = "(DSilHand_M90TriggerEnterYsgramorTomb.psc) "
int STAGE_FJOL_ACTIVATE_STATUE = 20

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: ObjectReference akTriggerRef
;
; Handler the event OnTriggerEnter()
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function handlerEnterTomb(ObjectReference akTriggerRef) 
    ObjectReference fjolObject = fjol.GetReference()
    if(fjolObject == None)
        Debug.Trace(THIS_FILE + "**ERROR** ERROR LOADING fjolObject from fjol ReferenceAlias")
        return  
    endif
    if(GetOwningQuest().GetStage() == STAGE_FJOL_ACTIVATE_STATUE && fjolObject == akTriggerRef)
        Debug.Trace(THIS_FILE + " -- FJOL ENTERED THE TRIGGER AT THE RIGHT TIME!")
        ; Ensure Fjol is caring Wuulthrad Axe
        ; TODO
        ; Start Statue activation scene
        DSilHand_M90_SceneOpenTomb.Start()
    else
        Debug.Trace(THIS_FILE + " Ysgramor Tomb Enter => akTriggerRef:" + akTriggerRef + ", M90(Stage):" + GetOwningQuest().GetStage())
    endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Actor who entes on the Cave Bonechill Passage. 
; 
; Calls bonechillDSIlHandM50EventHandler()
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnTriggerEnter(ObjectReference akTriggerRef)
    Debug.Trace(THIS_FILE + " --  OnTriggerEnter()")
    handlerEnterTomb(akTriggerRef)    
EndEvent









