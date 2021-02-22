Scriptname DSilHand_WerewolfFight extends ObjectReference  
{DSilHand_WerewolfFight for transforming actor into werewolf.}

;Actor Property DSilHand_FakeFarkas  Auto  
SPELL Property WerewolfChangeFX  Auto  
Race Property WerewolfBeastRace  Auto  

;Actor currentActor
String THIS_FILE = "(DSilHand_WerewolfFight.psc) "
Int nBleedout = -1
Bool enableTransformation = False

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
    theActor.Kill()
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Private: Transform current actor into a werewolf
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function castWerewolfTransformation(Actor currentActor)
    Debug.MessageBox("Test-02")
    Debug.Trace(THIS_FILE + " -- castWerewolfTransformation()")
    currentActor.GetActorBase().SetInvulnerable(true)
    WerewolfChangeFX.Cast(currentActor)
    Utility.Wait(3)
    currentActor.SetRace(WerewolfBeastRace)
    currentActor.GetActorBase().SetInvulnerable(false)
    currentActor.UnequipAll()
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
    Debug.MessageBox("OnInit Event.")
    ; isto procisa ser chamado antes
    enableWerewolfTransformation()
    ;currentActor = Self.GetSelfAsActor()
    Debug.MessageBox("Self.GetSelfAsActor():<" + Self.GetSelfAsActor()+ ">")
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Activate werewolf trasformation after the first bleedout.  Force the actor 
; to be killed on the second
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnEnterBleedout()
    Debug.MessageBox("We entered bleedout...")
    Actor currentActor = Self.GetSelfAsActor()
    ; Enable transformation
    if(enableTransformation == True)
        nBleedout = nBleedout + 1
        ; activate transformation
        if(nBleedout == 1)
            Debug.MessageBox(THIS_FILE + " -- Activate Werewolf Transformation after 1st bleedout...")
            castWerewolfTransformation(currentActor)
        elseif (nBleedout >= 2) ; force kill
            Debug.MessageBox(THIS_FILE + " -- 2nd bleedout, force to kill the character.")
            killEssential2(currentActor)
        else ; base case
            Debug.MessageBox(THIS_FILE + " -- This should not happen: nBleedout:" + nBleedout)
        endif
    endif
EndEvent
