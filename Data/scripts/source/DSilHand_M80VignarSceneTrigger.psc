Scriptname DSilHand_M80VignarSceneTrigger extends ReferenceAlias  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Scene Property DSilHand_M80_SceneArmistice  Auto  
{Scene Object, trigered when Vignar crosses the trigger.}

ReferenceAlias Property Vignar  Auto  
{Vignar object}

ReferenceAlias Property FakeVignar  Auto  
{Vignar actor copy for the quest}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
String THIS_FILE = "(DSilHand_M80VignarSceneTrigger.psc) "
int VIGNAR_SCENE_START_STAGE = 60

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void 
;
; Handle the trigger activation. If M80 quest stage is 60, it will start the 
; Scene.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function vignarSceneTriggerHandler(ObjectReference akTriggerRef)
    Debug.Trace(THIS_FILE + " -- OnTriggerEnter: vignarSceneTriggerHandler")
    ; Only activates if is the Player at M50 Stage 10
    Debug.Trace(THIS_FILE + " -- OnTriggerEnter: using FakeVignar object")
    ReferenceAlias vignarRef = FakeVignar ; Vignar/FakeVignar
    Actor vignarActorObj 
    if(vignarRef != None)
        vignarActorObj = vignarRef.GetActorReference()
        if(akTriggerRef == vignarActorObj && GetOwningQuest().GetStage() == VIGNAR_SCENE_START_STAGE)
            Debug.Trace(THIS_FILE + " -- Vignar entered on the trigger after Jarrskar battle.")
            Debug.Trace(THIS_FILE + " -- Start Vignar Scene!")
            Debug.MessageBox("DSilHand_M80_SceneArmistice.Start()")
            DSilHand_M80_SceneArmistice.Start()
        endif
    else
        Debug.Trace(THIS_FILE + " **ERROR** Vignar Reference is EMPTY!", 2)
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
    vignarSceneTriggerHandler(akTriggerRef)     
EndEvent



