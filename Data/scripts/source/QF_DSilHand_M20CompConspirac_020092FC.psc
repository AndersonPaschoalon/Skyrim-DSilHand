;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname QF_DSilHand_M20CompConspirac_020092FC Extends Quest Hidden

;BEGIN ALIAS PROPERTY DustXMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DustXMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Farkas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Farkas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fjol
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fjol Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Krev
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Krev Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Debug.Trace("-- Quest M20 stage 5")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; Move Fjol to Dustman's Cairn
Debug.Trace("-- Quest M20 stage 10")
Actor fjol = Alias_Fjol.GetReference() as Actor
fjol.MoveTo(Alias_DustXMarker.GetReference())
fjol.SetPosition(Alias_DustXMarker.GetReference().GetPositionX(), Alias_DustXMarker.GetReference().GetPositionY(), Alias_DustXMarker.GetReference().GetPositionZ())
fjol.Disable()
fjol.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
Debug.Trace("-- Quest M20 stage 30")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
Debug.Trace("-- Quest M20 stage 40")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
Debug.Trace("-- Quest M20 stage 50")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
Debug.Trace("-- Quest M20 stage 60")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Debug.Trace("-- Quest M20 Started")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Debug.Trace("-- Quest M20 stage 20")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
