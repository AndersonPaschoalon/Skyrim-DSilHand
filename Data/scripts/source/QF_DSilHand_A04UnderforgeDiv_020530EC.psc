;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_DSilHand_A04UnderforgeDiv_020530EC Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
string THIS_FILE = "(DSilHand_A04UnderforgeDivines.psc) "
Debug.Trace(THIS_FILE + "#Stage 10")

; Unlock the door, flagging the cell on the other side as public
Debug.Trace(THIS_FILE + " -- Unlock Underforge Door")
; Tells the door to handle activation normally
UnderforgeDoor.BlockActivation(false)
; Open the door and make inside public
UnderforgeDoor.Lock(false, true)
Game.GetPlayer().AddPerk(PlayerUnderforceAccessPerk)

; Enable Shrines
Debug.Trace(THIS_FILE + " -- Enable Shrines")
EnableShrinesMarkers.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; Evaluate if this feature is viable!
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property UnderforgeDoor  Auto  

ObjectReference Property EnableShrinesMarkers  Auto  

Perk Property PlayerUnderforceAccessPerk  Auto  
