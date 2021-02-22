Scriptname DSilHand_CompanionRookieNord04Script extends ObjectReference  


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Actor theActor -  actor to be killed
; 
; Private: Force kill a essential actor. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Bool Function killEssentialActor()
    Debug.MessageBox("-- function killEssential called from CompanionRookieNord04Script ")
    Debug.Trace("-- function killEssential called from CompanionRookieNord04Script ")
    Actor currentActor = Self.GetSelfAsActor()
    ActorBase akActorBase =  currentActor.GetBaseObject() as ActorBase
    akActorBase.SetEssential(0)
    Bool res = currentActor.Kill()
    Debug.Trace("-- CompanionRookieNord04Script  kill:" + res)
    return res
endFunction


Event OnEnterBleedout()
    Debug.Trace("We entered bleedout...")
endFunction