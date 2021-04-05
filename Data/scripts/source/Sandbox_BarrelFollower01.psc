Scriptname Sandbox_BarrelFollower01 extends ObjectReference 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; THIS TUTORIAL SHOW HOW TO MAKE A DEFAULT FOLLOWER, WHO YOU MAY REQUEST 
;; HELP, WILL FOLLOWS YOU, AND YOU MAY SAND HIM BACK TO HOME... AND REQUEST
;; HIS HELP AGAIN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Faction Property PotentialFollowerFaction  Auto  

Actor Property Sandbox_Follower01  Auto  


Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("Tutorial Follower Dark Fox")

    int facRank = Sandbox_Follower01.GetFactionRank(PotentialFollowerFaction)
    Debug.MessageBox("PotentialFollowerFaction:" + facRank)

    if(facRank == 0)
        Debug.MessageBox("PotentialFollowerFaction -> set 0")
        Sandbox_Follower01.SetFactionRank(PotentialFollowerFaction, -1)
    else
        Debug.MessageBox("PotentialFollowerFaction -> set -1")
        Sandbox_Follower01.SetFactionRank(PotentialFollowerFaction, 0)
    endif

endEvent


