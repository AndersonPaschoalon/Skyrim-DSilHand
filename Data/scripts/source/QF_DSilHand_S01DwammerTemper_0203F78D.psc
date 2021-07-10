;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_DSilHand_S01DwammerTemper_0203F78D Extends Quest Hidden

;BEGIN ALIAS PROPERTY Kurdak
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Kurdak Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Complete the quest. Increment smitting skills
Debug.Trace("(DSilHand_S01:20) -- Complete the quest!");

; Remove the items from  player inventory
Debug.Trace("(DSilHand_S01:20) -- start: Remove Items from player inventory!----------------");
Game.GetPlayer().RemoveItem(FireSalts, 20, false, Alias_Kurdak.GetReference())
Game.GetPlayer().RemoveItem(DwarvenOil, 20, false, Alias_Kurdak.GetReference())
Game.GetPlayer().RemoveItem(IngotQuicksilver, 20, false, Alias_Kurdak.GetReference())
Game.GetPlayer().RemoveItem(VoidSalts, 10, false, Alias_Kurdak.GetReference())
Debug.Trace("(DSilHand_S01:20) -- end: Remove Items from player inventory!----------------");

; 1x
Utility.Wait(1.0)
Game.IncrementSkill("Smithing")
; 2x
Utility.Wait(1.0)
Game.IncrementSkill("Smithing")
; 3x
Utility.Wait(1.0)
Game.IncrementSkill("Smithing")
; 4x
Utility.Wait(1.0)
Game.IncrementSkill("Smithing")
; 5x
Utility.Wait(1.0)
Game.IncrementSkill("Smithing")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Debug.Trace("(DSilHand_S01:0) -- S01 starting quest");
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Debug.Trace("(DSilHand_S01:10) -- S01 stage 10");
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Ingredient Property DwarvenOil  Auto  

Ingredient Property FireSalts  Auto  

Ingredient Property VoidSalts  Auto  

MiscObject Property IngotQuicksilver  Auto  
