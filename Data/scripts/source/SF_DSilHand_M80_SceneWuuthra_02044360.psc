;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 19
Scriptname SF_DSilHand_M80_SceneWuuthra_02044360 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_17
Function Fragment_17(ReferenceAlias akAlias)
;BEGIN CODE
;WARNING: Script name in fragment (DSilHand_M80_SF_SceneWuuthra_02044360) does not match auto-generated script (SF_DSilHand_M80_SceneWuuthra_02044360)
;Source NOT loaded
Debug.MessageBox("DSilHand_M80_ReassembleTime")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8(ReferenceAlias akAlias)
;BEGIN CODE
; Wait some time to finish the quest
Debug.Trace("DSilHand_M80_SF -- wait 10 seconds to finish the quest")
GetOwningQuest().SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property fjol  Auto  

WEAPON Property C06BladeOfYsgramor  Auto  
{Wuuthrad Axe object.}
