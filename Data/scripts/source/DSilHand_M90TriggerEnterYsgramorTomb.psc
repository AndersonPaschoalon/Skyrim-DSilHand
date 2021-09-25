Scriptname DSilHand_M90TriggerEnterYsgramorTomb extends ReferenceAlias  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ReferenceAlias Property fjol  Auto  
{Reference alias to Fjol on this quest}

Scene Property DSilHand_M90_SceneOpenTomb  Auto  
{Scene where Fjol to to the statue and activates it}

WEAPON Property C06BladeOfYsgramor  Auto  
{Wuulthrad axe reference, to ensure Fjol is holding one. }


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Object Consts
String THIS_FILE = "(DSilHand_M90TriggerEnterYsgramorTomb.psc) "
int STAGE_FJOL_ACTIVATE_STATUE = 20

; Object state
bool alreadyActivated = false


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: ObjectReference akTriggerRef
;
; Handler the event OnTriggerEnter()
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function handlerEnterTomb(ObjectReference akTriggerRef)
    Debug.Trace(THIS_FILE + " -- handlerEnterTomb()")
    ObjectReference fjolObject = fjol.GetReference()
    if(fjolObject == None)
        Debug.Trace(THIS_FILE + "**ERROR** ERROR LOADING fjolObject from fjol ReferenceAlias")
        return  
    endif
    Debug.Trace(THIS_FILE + "  * GetOwningQuest().GetStage():" + GetOwningQuest().GetStage())
    Debug.Trace(THIS_FILE + "  * alreadyActivated:" + alreadyActivated)
    if(GetOwningQuest().GetStage() == STAGE_FJOL_ACTIVATE_STATUE && fjolObject == akTriggerRef && alreadyActivated == false)
        alreadyActivated = true
        Debug.Trace(THIS_FILE + " -- FJOL ENTERED THE TRIGGER AT THE RIGHT TIME!")
        ; Ensure Fjol is caring Wuulthrad Axe
        int countAxe =  fjolObject.GetItemCount(C06BladeOfYsgramor)
        if(countAxe == 0)
            Debug.Trace(THIS_FILE + "**WARNING** -- FJOL IS NOT HOLDING THE AX. ADD TO ENSURE THE SCENE RUNS WELL.", 1)
            fjolObject.AddItem(C06BladeOfYsgramor)
        endif
        ; Start Statue activation scene
        Debug.Trace(THIS_FILE + " --  DSilHand_M90_SceneOpenTomb.Start()")
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

