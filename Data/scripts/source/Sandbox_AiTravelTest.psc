Scriptname Sandbox_AiTravelTest extends ObjectReference  

Quest Property Sandbox_AiTravelDemo  Auto  

Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("Tutorial Ai Travel Test")

    int curStage = Sandbox_AiTravelDemo.GetStage()
    Debug.MessageBox("Quest  Sandbox_AiTravelDemo Stage:"  + curStage)
    if(curStage == 0)
        Debug.MessageBox("1. Set Stage 10")
        Sandbox_AiTravelDemo.SetStage(10)
        ;;Sandbox_FollowerActor02Ref.SetPlayerTeamMate(true)
    elseif (curStage == 10)
        Debug.MessageBox("2. Set Stage 20")
        Sandbox_AiTravelDemo.SetStage(20)
    elseif (curStage == 20)
        Debug.MessageBox("3. Set Stage 30")
        Sandbox_AiTravelDemo.SetStage(30)        
    elseif (curStage == 30)
        Debug.MessageBox("4. Set Stage 0")
        Sandbox_AiTravelDemo.Reset()
        Sandbox_AiTravelDemo.SetStage(0)        
    endif
    
endEvent


