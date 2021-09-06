;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname DSilHand_M80_PF_TravelArmisticeSpeech Extends Package Hidden

;BEGIN FRAGMENT Fragment_3
Function Fragment_3(Actor akActor)
;BEGIN CODE
Debug.Trace("(DSilHand_M80_PF) OnStart: Starting Package DSilHand_M80SceneTravelArmisticeSpeech..." )
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(Actor akActor)
;BEGIN CODE
Debug.Trace("(DSilHand_M80_PF) On End: Finalizing Package DSilHand_M80SceneTravelArmisticeSpeech..." )
DSilHand_M80Helper m80Helper = (GetOwningQuest() as DSilHand_M80Helper)
if(m80Helper != None)
    m80Helper.completeActionSceneTravelArmisticeSpeech()
else
    Debug.Trace("(DSilHand_M80_PF) **ERROR** DSilHand_M80Helper IS EMPTY!", 2)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
