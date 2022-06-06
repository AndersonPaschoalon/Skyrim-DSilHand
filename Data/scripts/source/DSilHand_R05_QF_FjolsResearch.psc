;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname DSilHand_R05_QF_FjolsResearch Extends Quest Hidden

;BEGIN ALIAS PROPERTY LocationMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BookLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_BookLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY fjol
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_fjol Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HoldingChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HoldingChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BookContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BookContainer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Book
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Book Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; The player have found the book. It is time to deliver it to Fjol
Debug.Trace(THIS_FILE + " #Stage 20")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; Radiant quest enabled
Debug.Trace(THIS_FILE + " #Stage 5")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; startup stage
Debug.Trace(THIS_FILE + " #Stage 0")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE DSilHand_R05Helper
Quest __temp = self as Quest
DSilHand_R05Helper kmyQuest = __temp as DSilHand_R05Helper
;END AUTOCAST
;BEGIN CODE
; You delivered the book. Quest completed
Debug.Trace(THIS_FILE + " #Stage 30")

; remove the book from your inventory
Game.GetPlayer().RemoveItem(Alias_Book.GetReference(), 1)

; create an alarm to restart the quest in 10-20 days
kmyQuest.finalizeQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; Fjol gives you the quest
Debug.Trace(THIS_FILE + " #Stage 10")

; Start the quest for the player
Start()

; Move the book from the holding chest to the boos chest (BookContainer)
Alias_BookContainer.GetReference().AddItem(Alias_Book.GetReference())

; Update objective
SetObjectiveDisplayed(10)

; add location to map
Alias_LocationMarker.GetReference().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

String Property THIS_FILE  Auto  
{This file name.}
