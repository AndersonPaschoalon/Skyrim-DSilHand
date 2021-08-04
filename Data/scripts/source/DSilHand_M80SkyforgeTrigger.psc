Scriptname DSilHand_M80SkyforgeTrigger extends ReferenceAlias  

Scene Property DSilHand_M80_SceneWuuthradReassemble  Auto  
{Final Quest Scene}



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
String THIS_FILE = "(DSilHand_M80_SceneWuuthradReassemble.psc) "
int LAST_M80_SCENE_START = 110
Bool alreadyActivated = false


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void 
;
; Handle the trigger activation. If M80 quest stage is 60, it will start the 
; Scene.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function startWulthradReassembleScene(ObjectReference akTriggerRef)
    Debug.Trace(THIS_FILE + " -- startWulthradReassembleScene()")
    ; Only activates if is the Player at M58 Stage 110
    if( akTriggerRef == Game.GetPlayer() && GetOwningQuest().GetStage() == LAST_M80_SCENE_START)
        Debug.Trace(THIS_FILE + "-- Player entered on Skyforge trigger for Wuulthrad reassemble.")
        if(alreadyActivated == false)
            ; Activate only ONCE
            alreadyActivated = true
            DSilHand_M80_SceneWuuthradReassemble.Start()
        endif
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
    startWulthradReassembleScene(akTriggerRef)     
EndEvent

