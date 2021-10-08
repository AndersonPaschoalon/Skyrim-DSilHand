;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DSilHand_M80_PF_GiveWuuthradToFjol Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
Debug.Trace("(DSilHand_M80_PF) -- On Beguin:kurdak will give the axe to fjol")
akActor.EquipItem(C06BladeOfYsgramor, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(Actor akActor)
;BEGIN CODE
Debug.Trace("(DSilHand_M80_PF) -- On End: Kurdak gave the axe to fjol")
akActor.RemoveItem(C06BladeOfYsgramor, 1, false, fjol.GetActorReference())

Debug.Trace("(DSilHand_M80_PF) -- On End: play Idle take on Fjol object")
DSilHand_Utils.playIdleHelper(fjol, "Fjol", IdleTake, "IdleTake (Fjol take Wuuthrad from Kurdak)", "DSilHand_M80_SF")
; playIdleHelper is non-blocking
Utility.Wait(2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

WEAPON Property C06BladeOfYsgramor  Auto  

ReferenceAlias Property fjol  Auto  

Idle Property IdleTake  Auto  
