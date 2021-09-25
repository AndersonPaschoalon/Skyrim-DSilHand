;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_M90_TIF__02053102 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; You accepted the Silver Hand's leadership from Fjol
; Now, the quest must be completed,
; and the leadership script executed!
string THIS_FILE = "(DSilHand_M90_TIF)"

; complete objectives
int currStage = GetOwningQuest().GetStage()
if(currStage < 60)
    Debug.Trace(THIS_FILE + " -- SetObjectiveCompleted 50")
    Debug.Trace(THIS_FILE + " -- SetStage 60")
    GetOwningQuest().SetObjectiveCompleted(50)
    GetOwningQuest().SetStage(60)
else
    Debug.Trace(THIS_FILE + " current stage is 60, quest already completed!")
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
