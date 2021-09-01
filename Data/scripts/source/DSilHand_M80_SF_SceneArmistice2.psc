;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DSilHand_M80_SF_SceneArmistice2 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; This script runs at the beguin of the SceneArmistice2
Debug.Trace("(DSilHand_M80_SF) -- Begin: SceneArmistice2")
; bugfix : force Fjol to act!
fjol.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; This script runs at the end of the SceneArmistice2
Debug.Trace("(DSilHand_M80_SF) -- End: SceneArmistice2")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property fjol  Auto  
