Scriptname TestMod02_HellSkeever extends ObjectReference  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Actor Property TestMod02_HeelSkeever  Auto  
{Heel Skeever actor variable}

Actor Property Player  Auto  

Int counter

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Event OnInit()
    ; Debug on init
    Debug.MessageBox("OnInit: TestMod02_HellSkeever")

    ; updates Player variable
    Player = Game.GetPlayer()
    counter = 0
    Float timeToWait = 0.3;
    ;RegisterForUpdateGameTime(timeToWait) 
    RegisterForSingleUpdateGameTime(timeToWait) 
Endevent


Event OnUpdateGameTime()
    Debug.MessageBox("OnUpdateGameTime: TestMod02_HellSkeever")
    ; Move hellskeever to player after update game time
    TestMod02_HeelSkeever.MoveTo(Player)
    HeelSkeeverBreaksLoose()
Endevent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function HeelSkeeverBreaksLoose()
    counter = counter + 1
    if(counter < 3)
        Debug.MessageBox("HeelSkeeverBreaksLoose: [" + counter + "]")
        Debug.MessageBox("TestMod02_HeelSkeever.IsDead():" + TestMod02_HeelSkeever.IsDead())
        ;if(TestMod02_HeelSkeever.IsDead())
            TestMod02_HeelSkeever.Resurrect()
            Debug.MessageBox("Hell Skeever Ressurected!")
        ; EndIF
        TestMod02_HeelSkeever.MoveTo(Player)
        RegisterForSingleUpdateGameTime(0.3)        
    endif
Endfunction





