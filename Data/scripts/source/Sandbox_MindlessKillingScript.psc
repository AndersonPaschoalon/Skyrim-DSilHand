Scriptname Sandbox_MindlessKillingScript extends Quest  

ImageSpaceModifier Property MindControlSm  Auto  

Function beginMindControl()
    MindControlSm.Apply()
EndFunction


Function endMindControl()
    MindControlSm.Remove()
EndFunction


