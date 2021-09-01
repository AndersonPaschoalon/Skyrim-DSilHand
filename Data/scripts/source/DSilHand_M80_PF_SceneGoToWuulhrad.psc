;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DSilHand_M80_PF_SceneGoToWuulhrad Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
Debug.Trace("(DSilHand_M80_PF) -- On Beguin: Equip Wuulthrad and go to speach")
akActor.EquipItem(C06BladeOfYsgramor, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(Actor akActor)
;BEGIN CODE
Debug.Trace("(DSilHand_M80_PF) -- On End: Equip Wuulthrad and go to speach")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

WEAPON Property C06BladeOfYsgramor  Auto  
