;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_R00_TIF__0206597D Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Debug.Trace(THIS_FILE + "-- runs startsRadiantQuest()")
DSilHand_R00Helper r00Helper = (GetOwningQuest() as DSilHand_R00Helper)
; nextR00Stage -> 50:Alone, 60:pair, 70:group
; questGiverId -> 1:Hillara 2:Senaar
r00Helper.startsRadiantQuest(70, 2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

String Property THIS_FILE  Auto  
