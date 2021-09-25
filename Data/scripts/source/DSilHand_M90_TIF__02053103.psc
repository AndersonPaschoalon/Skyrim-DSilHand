;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_M90_TIF__02053103 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; You accepted the Silver Hand's leadership from Fjol
; Now, the quest must be completed,
; and the leadership script executed!
string THIS_FILE = "(DSilHand_M90_TIF)"

; execute leadership script 
DSilHand_M90Helper m90Helper = (GetOwningQuest() as DSilHand_M90Helper)
Debug.Trace(THIS_FILE + " -- m90Helper.makePlayerSilverHandLeader():false")
m90Helper.playerSilverHandLeadership(false)

; complete objectives
Debug.Trace(THIS_FILE + " -- SetObjectiveCompleted 50")
Debug.Trace(THIS_FILE + " -- SetStage 60")
GetOwningQuest().SetObjectiveCompleted(50)
GetOwningQuest().SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
