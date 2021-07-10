;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DSilHand_S01_TIF__0203F791 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Show a message box about the training.
Debug.Trace("(DSilHand_S01_TIF) -- Kurdak teaches you how to forge and improove silver weapons.")
Debug.MessageBox("Kurdak teaches you how to forge and improove silver weapons.");
Debug.Trace("(DSilHand_S01_TIF) -- Now you will be able to craft silver swords on the forge, improve them on the grindstone and enchant them. ")
Debug.MessageBox("Now you will be able to craft silver swords on the forge, improve them on the grindstone and enchant them.");

; Complete quest objective
; complete obj 10
Debug.Trace("(DSilHand_S01_TIF) -- SetObjectiveComplete(10)")
GetOwningQuest().SetObjectiveCompleted(10)
; set stage 20
Debug.Trace("(DSilHand_S01_TIF) -- SetStage(20)")
GetOwningQuest().SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
