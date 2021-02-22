Scriptname DSilHand_M60AliasCompNord4Script extends ReferenceAlias  
{DSilHand_M60AliasCompNord4Script Test script for werewolf transformation. }

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SPELL Property WerewolfChangeFX  Auto  
{WerewolfChangeFX werewolf spell}
Race Property WerewolfBeastRace  Auto  
{WerewolfBeastRace werewolf race reference.}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
String THIS_FILE = "(DSilHand_M60AliasCompNord4Script.psc) "
Int nBleedout = -1
Bool enableTransformation = False


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
    Debug.Trace(THIS_FILE + " enableWerewolfTransformation() called!")
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
    theActor.Kill()
    if(theActor.IsDead() != True)
        Debug.Trace(THIS_FILE + " **ERROR** Failed to execute theActor.Kill()")
        theActor.KillEssential()
    endif
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Private: Transform current actor into a werewolf, following the procedure: 
; (1) Dispell all effects (2) Set invulnerable (3) Restore actor health
; (4) Cast werewolf spell (5)  Change race (6) Unset invulnerability
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function castWerewolfTransformation(Actor currentActor)
    Debug.Trace(THIS_FILE + " -- castWerewolfTransformation()")
    ; Dispell all effects
    currentActor.DispelAllSpells()
    ; invulnerable
    currentActor.GetActorBase().SetInvulnerable(true)
    ; restore actor health
    int actorFullHealth = (currentActor.GetBaseAV("Health") as Int)
    currentActor.RestoreAV("Health", actorFullHealth )
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
; Input: void
; 
; Private: Procedure to turn the actor into a werewolf on the fight. He will
; keep fighting as a human, until he starts to bleedout or die. Than, he will
; be recovered, set as invulnerable and beguin to transform yourself 
; into a werewolf. When he finishes, he will be set as vulnerable once again, 
; and might be killed.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function turnWerewolfProcedute()
    Debug.Trace("    Entered OnEnterBleedout or OnDying...")
    Actor currentActor = GetActorRef()
    ; Enable transformation
    if(enableTransformation == True)
        nBleedout = nBleedout + 1
        ; activate transformation
        if(nBleedout == 1)
            Debug.Trace(THIS_FILE + " -- Activate Werewolf Transformation after 1st bleedout...")
            ; Do transform into werewolf
            castWerewolfTransformation(currentActor)
        elseif (nBleedout == 2) ; force kill
            Debug.Trace(THIS_FILE + " -- 2nd bleedout, force to kill the character.")
            killEssential2(currentActor)
        else ; base case
            Debug.Trace(THIS_FILE + " -- This should not happen: nBleedout:" + nBleedout)
        endif
    endif    
Endfunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Private: advances quest to the next stage if all invaders are dead.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function advenceQuestStage()
    DSilHand_M60Helper scriptHelper  = (GetOwningQuest() as DSilHand_M60Helper)
    Debug.Trace(THIS_FILE + " -- scriptHelper:<" + scriptHelper + ">")
    if(scriptHelper != None)
        scriptHelper.advanceStageKillInvaders()
    endif
Endfunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Execute function to enable werewolf transformation.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnInit()
    ; set private flags to enable werewolf transformation
    enableWerewolfTransformation()
    Debug.Trace("GetActorRef():<" + GetActorRef() + ">")
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Activate werewolf trasformation after the first bleedout  or OnDying.  Force 
; the actor to be killed on the second
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnEnterBleedout()
    Debug.Trace(THIS_FILE + " -- turnWerewolfProcedute()")
    turnWerewolfProcedute()
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: the actor killer
; 
; Activate werewolf trasformation after the first bleedout or OnDying.  Force 
; the actor  to be killed on the second.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnDying(Actor akKiller)
    Debug.Trace(THIS_FILE + " -- OnDying: turnWerewolfProcedute()")
    turnWerewolfProcedute()
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: akKiller - The Actor that killed this one.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnDeath(Actor akKiller)
    Debug.Trace(THIS_FILE + " -- OnDeath: advenceQuestStage()")
    advenceQuestStage()
EndEvent


