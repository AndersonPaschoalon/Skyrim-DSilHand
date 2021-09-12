Scriptname DSilHand_M80SkyforgeTrigger extends ReferenceAlias  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Scene Property DSilHand_M80_SceneWuuthradReassemble  Auto  
{Final Quest Scene}

ReferenceAlias Property Fjol  Auto  
{}

ReferenceAlias Property Haknrm  Auto  
{}

ReferenceAlias Property hillara  Auto  
{}

ReferenceAlias Property Kurdak  Auto  
{}

ReferenceAlias Property Kylmir  Auto  
{}

ReferenceAlias Property SENAAR  Auto  
{}

ReferenceAlias Property Irronkas  Auto  
{}

ReferenceAlias Property xMarkerSkyforgeBlacksmith  Auto  
{}

ReferenceAlias Property xMarkerSkyforgeBlacksmith2  Auto  
{}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

String THIS_FILE = "(DSilHand_M80SkyforgeTrigger.psc) "
int LAST_M80_SCENE_START = 100
int OBJ_M80_GOTOSKYFORGE = 100
int OBJ_JOIN_WUUTHRAD_REASSEMBLY = 110
bool playerIsIn = false
bool fjolIsIn = false 
bool kurdakIsIn = false 
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
Function reassembleTriggerHandler(ObjectReference akTriggerRef)
    Debug.Trace(THIS_FILE + " -- reassembleTriggerHandler()")
    if(GetOwningQuest().GetStage() == LAST_M80_SCENE_START)
        ; check if the actors are ready for the scene
        if (akTriggerRef == Game.GetPlayer() && playerIsIn == false)
            Debug.Trace(THIS_FILE + " -- PLAYER is whatching")
            playerIsIn = true
            if(fjolIsIn == false)
                DSilHand_Utils.moveSingleNpcRefAlias(Fjol, xMarkerSkyforgeBlacksmith2, "Fjol", THIS_FILE)
                fjolIsIn = true
            endif
            if(kurdakIsIn == false)
                DSilHand_Utils.moveSingleNpcRefAlias(Kurdak, xMarkerSkyforgeBlacksmith, "Kurdak", THIS_FILE)
                kurdakIsIn = true
            endif
        elseif (akTriggerRef == Fjol.GetReference() && fjolIsIn == false)
            Debug.Trace(THIS_FILE + " -- Fjol is whatching")
            fjolIsIn = true 
        elseif (akTriggerRef == Kurdak.GetReference() && kurdakIsIn == false)
            Debug.Trace(THIS_FILE + " -- Kurdak is whatching")
            kurdakIsIn = true 
        endif

        if( alreadyActivated   == false && \
            fjolIsIn           == true && \
            kurdakIsIn         == true && \
            playerIsIn         == true )
            ; Activate only ONCE
            alreadyActivated = true
            Debug.Trace(THIS_FILE + " -- Complete Objective " + OBJ_M80_GOTOSKYFORGE)
            GetOwningQuest().SetObjectiveCompleted(OBJ_M80_GOTOSKYFORGE)
            GetOwningQuest().SetObjectiveDisplayed(OBJ_JOIN_WUUTHRAD_REASSEMBLY)
            Debug.Trace(THIS_FILE + " -- STARTING SCENE DSilHand_M80_SceneWuuthradReassemble")
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
    reassembleTriggerHandler(akTriggerRef)
    ;startWulthradReassembleScene(akTriggerRef)     
EndEvent




