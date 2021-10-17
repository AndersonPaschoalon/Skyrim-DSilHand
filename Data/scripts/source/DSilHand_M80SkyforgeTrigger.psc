Scriptname DSilHand_M80SkyforgeTrigger extends ReferenceAlias  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Scene Property DSilHand_M80_SceneWuuthradReassemble  Auto  
{Final Quest Scene}

ReferenceAlias Property Fjol  Auto  
{Haknrm reference alias}

ReferenceAlias Property Haknrm  Auto  
{Haknrm reference alias}

ReferenceAlias Property hillara  Auto  
{Hillara reference alias}

ReferenceAlias Property Kurdak  Auto  
{Kurdak reference alias}

ReferenceAlias Property Kylmir  Auto  
{kylmir reference alias}

ReferenceAlias Property SENAAR  Auto  
{Senaar reference alias}

ReferenceAlias Property Irronkas  Auto  
{Irronkas reference alias}

ReferenceAlias Property xMarkerSkyforgeBlacksmith  Auto  
{1st blacksmith marker -- where Kurdak is placed to reforge Wuulthrad}

ReferenceAlias Property xMarkerSkyforgeBlacksmith2  Auto  
{2nd Blacksmit xmarker -- where Fjol is placed to wait Kurdak to finish the reassemble}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; consts
String THIS_FILE = "(DSilHand_M80SkyforgeTrigger.psc) "
int LAST_M80_SCENE_START = 100
int OBJ_M80_GOTOSKYFORGE = 100
int OBJ_JOIN_WUUTHRAD_REASSEMBLY = 110
int LAST_M80_STAGE = 110
int BUGFIX_WAIT_TIME_IF_SCENE_BREAKS = 5 ; wait 5 hours in the game!
; state
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
            ; **BUGFIX**
            createAlarmBugfix(BUGFIX_WAIT_TIME_IF_SCENE_BREAKS)
        endif
    endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; **BUGFIX** safenet alarm in case the last scene breaks. 
;
; Input: alarmWaitTime wait time
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function createAlarmBugfix(int alarmWaitTime)
    float waitTimeFloat = alarmWaitTime
    Debug.Trace(THIS_FILE + " -- createAlarmBugfix(): [" + waitTimeFloat + "]gameHours") 
    RegisterForSingleUpdateGameTime(waitTimeFloat)
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; **BUGFIX** safenet alarm handler in case the last scene breaks. 
;
; Input: void
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function bugfixAlarmHandler()
    Debug.Trace(THIS_FILE + " -- bugfixAlarmHandler()") 
    int currentQuestStage = GetOwningQuest().GetStage()
    if (currentQuestStage < LAST_M80_STAGE)
        Debug.Trace(THIS_FILE + "**WARNING** THE QUEST CURRENT STAGE <" + currentQuestStage + "> IS SMALLER THAN THE EXPECTED <" + LAST_M80_STAGE + ">", 1) 
        Debug.Trace(THIS_FILE + "**WARNING** FORCE THE QUEST TO BE ADVANCED TO THE LAST STAGE!!", 2)
        GetOwningQuest().SetStage(LAST_M80_STAGE)
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
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; **BUGFIX** This is just a safe net, in case the last Scene Breaks. Sometimes
; for some unknown reason, the Wuulthrad reassemble scene breaks on the last
; stage, and the characters get stucked on the skyforge, clapping forever.
; This usually shoudld DO NOTHING. But in case the last scene breaks, it will
; force the quest to progress and get completed. But it will be triggered 
; just a loong time after, to avoid breaking the scene. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnUpdateGameTime()
    Debug.Trace(THIS_FILE + " -- OnUpdateGameTime()") 
    bugfixAlarmHandler()
EndEvent

