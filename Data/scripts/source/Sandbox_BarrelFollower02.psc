Scriptname Sandbox_BarrelFollower02 extends ObjectReference  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; THIS TUTORIAL SHOW HOW TO MAKE A QUEST FOLLOWER.
;; HE WILL JUST FOLLOW YOU, ON THE QUEST
;; BUT WILL NOT HAVE INVENTORY
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Quest Property Sandbox_Follower02  Auto  
Actor Property Sandbox_FollowerActor02Ref  Auto  

Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("Tutorial Follower 02")
    int curStage = Sandbox_Follower02.GetStage()
    Debug.MessageBox("Quest  Sandbox_Follower02 Stage:"  + curStage)
    if(curStage == 0)
        Debug.MessageBox("Set Stage 10")
        Sandbox_Follower02.SetStage(10)
        Sandbox_FollowerActor02Ref.SetPlayerTeamMate(true)
    elseif (curStage == 10)
        Debug.MessageBox("Set Stage 20")
        Sandbox_Follower02.SetStage(20)
    elseif (curStage == 20)
        Debug.MessageBox("Set Stage 0")
        Sandbox_Follower02.Reset()
        Sandbox_Follower02.SetStage(0)        
    endif
endEvent



