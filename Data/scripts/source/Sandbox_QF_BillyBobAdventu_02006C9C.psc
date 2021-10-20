;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname Sandbox_QF_BillyBobAdventu_02006C9C Extends Quest Hidden

;BEGIN ALIAS PROPERTY Billy
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Billy Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BadGuy
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BadGuy Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BillySword
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BillySword Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
SetObjectiveCompleted(30)
Alias_Billy.GetReference().AddItem(Alias_BillySword.GetReference())
Game.GetPlayer().AddItem(Gold001, 1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20,True,True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Alias_BadGuy.GetReference().Enable()
Alias_BadGuy.GetReference().AddItem(Alias_BillySword.GetReference())
SetObjectiveDisplayed(10,True,True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30,True,True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
Debug.MessageBox(Alias_BadGuy.GetReference())
Debug.MessageBox(Alias_Billy.GetReference())
Debug.MessageBox(Alias_BillySword.GetReference())
Alias_BadGuy.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


MiscObject Property Gold001  Auto  
