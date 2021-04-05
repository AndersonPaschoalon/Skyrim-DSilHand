Scriptname Sandbox_HellSkeever extends ObjectReference  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Actor Property Sandbox_HeelSkeever  Auto  
{Heel Skeever actor variable}

Actor Property Player  Auto  

Int counter

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Event OnInit()
    ; Debug on init
    Debug.MessageBox("OnInit: Sandbox_HellSkeever")

    ; updates Player variable
    Player = Game.GetPlayer()
    counter = 0
    Float timeToWait = 0.3;
    ;RegisterForUpdateGameTime(timeToWait) 
    RegisterForSingleUpdateGameTime(timeToWait) 
Endevent


Event OnUpdateGameTime()
    Debug.MessageBox("OnUpdateGameTime: Sandbox_HellSkeever")
    ; Move hellskeever to player after update game time
    Sandbox_HeelSkeever.MoveTo(Player)
    HeelSkeeverBreaksLoose()
Endevent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function HeelSkeeverBreaksLoose()
    counter = counter + 1
    if(counter < 3)
        Debug.MessageBox("HeelSkeeverBreaksLoose: [" + counter + "]")
        Debug.MessageBox("Sandbox_HeelSkeever.IsDead():" + Sandbox_HeelSkeever.IsDead())
        ;if(Sandbox_HeelSkeever.IsDead())
            Sandbox_HeelSkeever.Resurrect()
            Debug.MessageBox("Hell Skeever Ressurected!")
        ; EndIF
        Sandbox_HeelSkeever.MoveTo(Player)
        RegisterForSingleUpdateGameTime(0.3)        
    endif
Endfunction





Actor Property Sandbox_HellSkeever  Auto  
