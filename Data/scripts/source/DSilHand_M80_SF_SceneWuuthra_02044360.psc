;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 21
Scriptname DSilHand_M80_SF_SceneWuuthra_02044360 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_8
Function Fragment_8(ReferenceAlias akAlias)
;BEGIN CODE
; Wait some time to finish the quest
Debug.Trace("DSilHand_M80_SF -- wait 20 seconds to finish the quest")
GetOwningQuest().SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17(ReferenceAlias akAlias)
;BEGIN CODE
; After 15s it must avance to next pahse step
Debug.MessageBox("DSilHand_M80_ReassembleTime")
GetOwningQuest().SetStage(101)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property fjol  Auto  

WEAPON Property C06BladeOfYsgramor  Auto  
{Wuuthrad Axe object.}
