Scriptname DSilHand_M40AliasFarkasScript extends ReferenceAlias  
{Farkas script to enable werewolf transformation}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SPELL Property WerewolfChangeFX  Auto  
Race Property WerewolfBeastRace  Auto  
ReferenceAlias Property Nord01  Auto  


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

String THIS_FILE = "(DSilHand_M40AliasFarkasScript.psc) "
Int nBleedout = -1
Bool enableTransformation = False
Int STAGE_AFTER_BATTLE = 40
Int OBJECTIVE_KILL_FARKAS = 30
Int OBJECTIVE_KILL_FARKAS_NEXT = 40

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Public: This method must be executed to enable Werewolf transformation and force 
; kill the actor after he is transformed
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function enableWerewolfTransformation()
    enableTransformation = True
    nBleedout = 0
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Actor theActor -  actor to be killed
; 
; Private: Force kill a essential actor. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function killEssential2(Actor theActor)
    ActorBase akActorBase =  theActor.GetBaseObject() as ActorBase
    akActorBase.SetEssential(0)
    ;akActorBase.SetProtected(False)
    ;akActorBase.SetInvulnerable(False)
    theActor.Kill()
    if(theActor.IsDead() != True)
        Debug.Trace(THIS_FILE + " **ERROR** Failed to execute theActor.Kill()")
        theActor.KillEssential()
    endif
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Private: Transform current actor into a werewolf
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function castWerewolfTransformation(Actor currentActor)
    Debug.Trace(THIS_FILE + " -- castWerewolfTransformation()")
    ; Dispell all effects
    currentActor.DispelAllSpells()
    currentActor.GetActorBase().SetInvulnerable(true)
    ; Cast Werewolf Change
    WerewolfChangeFX.Cast(currentActor)
    Utility.Wait(3.0)
    ; Change race to Werewolf
    currentActor.SetRace(WerewolfBeastRace)
    ; remove invulnerability
    currentActor.GetActorBase().SetInvulnerable(false)
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Private: Logs Script state
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function logCurrentState()
    Debug.Trace(THIS_FILE + "    * nBleedout:<" + nBleedout + ">")
    Debug.Trace(THIS_FILE + "    * enableTransformation:<" + enableTransformation + ">")    
Endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Inicializar
Event OnInit()
    ; set private flags to enable werewolf transformation
    enableWerewolfTransformation()
    Debug.Trace("GetActorRef():<" + GetActorRef() + ">")
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Activate werewolf trasformation after the first bleedout.  Force the actor 
; to be killed on the second
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnEnterBleedout()
    Debug.Trace(THIS_FILE + "We entered bleedout...")
    Actor currentActor = GetActorRef()
    ; Enable transformation
    if(enableTransformation == True)
        nBleedout = nBleedout + 1
        ; activate transformation
        if(nBleedout == 1)
            Debug.Trace(THIS_FILE + " -- Activate Werewolf Transformation after 1st bleedout...")
            ; retrieve the actor full health
            int actorFullHealth = (currentActor.GetBaseAV("Health") as Int)
            ; restore actor health
            currentActor.RestoreAV("Health", actorFullHealth )
            ; Do transform into werewolf
            castWerewolfTransformation(currentActor)
        elseif (nBleedout == 2) ; force kill
            Debug.Trace(THIS_FILE + " -- 2nd bleedout, force to kill the character.")
            killEssential2(currentActor)
        else ; base case
            Debug.Trace(THIS_FILE + " -- This should not happen: nBleedout:" + nBleedout)
        endif
    endif
EndEvent


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: killer
; 
; Advances the quest M40 to the next stage if FARKAS and his shield brother are
; dead. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnDeath(Actor akKiller)
    if(Nord01 != None)
        if(Nord01.GetActorRef().IsDead())
            GetOwningQuest().SetObjectiveCompleted(OBJECTIVE_KILL_FARKAS)
            GetOwningQuest().SetObjectiveDisplayed(OBJECTIVE_KILL_FARKAS_NEXT)
            GetOwningQuest().SetStage(STAGE_AFTER_BATTLE)
        else
            Debug.Trace(THIS_FILE + " -- Farkas Shield Brother (Nord01) is not Dead yet...")
        endif  
    else 
        Debug.Trace(THIS_FILE + "**WARNING** ReferenceAlias Nord01 IS NULL", 1)
    endif
endEvent



