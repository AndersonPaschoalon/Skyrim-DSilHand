Scriptname Sandbox_BarrelSetAiPkg extends ObjectReference  

Quest Property Sandbox_SetAiToNpc  Auto  


Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("Test  BarrelSetAiPkg")
    int curStage = Sandbox_SetAiToNpc.GetStage()
    Debug.MessageBox("Quest  Sandbox_SetAiToNpc Stage:"  + curStage)
    if(curStage == 0)
        Debug.MessageBox("Set Stage 10")
        Sandbox_SetAiToNpc.SetStage(10)
        ;;Sandbox_FollowerActor02Ref.SetPlayerTeamMate(true)
    elseif (curStage == 10)
        Debug.MessageBox("Set Stage 20")
        Sandbox_SetAiToNpc.SetStage(20)
    elseif (curStage == 20)
        Debug.MessageBox("Set Stage 0")
        Sandbox_SetAiToNpc.Reset()
        Sandbox_SetAiToNpc.SetStage(0)        
    endif
endEvent


