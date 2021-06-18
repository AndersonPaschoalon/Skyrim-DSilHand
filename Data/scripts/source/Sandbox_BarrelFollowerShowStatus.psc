Scriptname Sandbox_BarrelFollowerShowStatus extends ObjectReference  

Actor Property actorFollower  Auto  

Faction Property PotentialFollowerFaction  Auto  

Faction Property CurrentFollowerFaction  Auto  

Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("Show Follower Status")
    int facRankP = actorFollower.GetFactionRank(PotentialFollowerFaction)
    int facRankC = actorFollower.GetFactionRank(CurrentFollowerFaction)
    Debug.MessageBox("PotentialFollowerFaction:" + facRankP)
    Debug.MessageBox("CurrentFollowerFaction:" + facRankC)
endEvent




