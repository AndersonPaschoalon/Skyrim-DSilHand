;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_R00_TIF__020669CE Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Senaar give to the player the accumulated reward from the last contracts
Debug.Trace(THIS_FILE + " -- Senaar: r00Helper.giveRewardToPlayer()")
DSilHand_R00Helper r00Helper = (GetOwningQuest() as DSilHand_R00Helper)
r00Helper.giveRewardToPlayer()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

String Property THIS_FILE  Auto  
