;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__02048458 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Here, the Armistice Scene is advanced to its last stage, where Athis go away 
; saying it was THIS close...
Debug.Trace("(DSiLHand_M80_TIF) -- advances to the Last SceneArmistice2 phase...")
GetOwningQuest().SetStage(63)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
