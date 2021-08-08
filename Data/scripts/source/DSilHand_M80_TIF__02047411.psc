;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DSilHand_M80_TIF__02047411 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Debug.Trace("(DSilHand_M80_TIF) -- Advances to STAGE 61" )
GetOwningQuest().SetStage(61)

Debug.Trace("(DSilHand_M80_TIF) --DSilHand_M80Helper.prepareSceneVignarArmstice()" )
DSilHand_M80Helper m80Helper = (GetOwningQuest() as DSilHand_M80Helper)
if(m80Helper != None)
    m80Helper.prepareSceneVignarArmstice()
else
    Debug.Trace("(DSilHand_M80_TIF) **ERROR** DSilHand_M80Helper IS EMPTY!", 2)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
