Scriptname Sandbox_Scene2TutorialScript extends Quest  

Int Property DeathTime  Auto  
{Set to 2880 seconds since it is a day in the gameplay}

Int Property PoisonTick  Auto  
{Tick poison every 10 seconds}

ImageSpaceModifier Property poisonedSM  Auto  
{Shows the player getting hit by a poison effect}


Int timer = 0

Function beginPoisoned()
    timer = 0
    GoToState("Poisoned")
    ; this function makes the script have a "On Update Event" every PoisonTick seconds.
    ; that means, the "OnUpdate" event will be called every PoisonTick seconds
    RegisterForUpdate(PoisonTick)
EndFunction


Function endPoisoned()
    GoToState("")
    UnregisterForUpdate()
EndFunction

State Poisoned 
    Event OnUpdate()
        ; change the screen effect to hit poison
        poisonedSM.Apply()
        timer += PoisonTick
        if (timer > DeathTime)
            Game.GetPlayer().Kill()
        endif
    EndEvent
EndState





