;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname DSilHand_M30_QF_ScholarFragment Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nelacar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nelacar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Frag03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Frag03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Satchel
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Satchel Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY fjol
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_fjol Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LetterNelacar2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LetterNelacar2 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Debug.Trace(THIS_FILE + "#STAGE 50")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
Debug.Trace(THIS_FILE + "#STAGE 40")

; Advances quest stage if item is already taken -- this should not happen, but just in case
; objToComplete - 40
; nextObj - 50
; nextStage - 50
DSilHand_Utils.advanceIfAlreadyTaken(Self, Alias_Frag03.GetReference(), "Frag03", 40,  50, 50, THIS_FILE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; Nelecar gives to Dragonborn a letter
Debug.Trace(THIS_FILE + "#STAGE 30")

Debug.Trace(THIS_FILE + " -- Add Item LetterNelacar2 to the players inventory");
if(Alias_LetterNelacar2 != None)
    Game.GetPlayer().AddItem(Alias_LetterNelacar2.GetReference())
    Debug.MessageBox("Nelacar just smiles, and gives you a letter.")
else 
    Debug.Trace(THIS_FILE + " ** ERROR**  Alias_LetterNelacar2 is NULL", 2);
endif

; Enables reference for the fragment
Debug.Trace(THIS_FILE + " -- Alias_Frag03.GetReference().Enable() ");
Alias_Frag03.GetReference().Enable()

; Move the Fragment to the right chest
DSilHand_Utils.moveObjectToContainer(Alias_Frag03, Alias_Satchel, "Frag03", "Satchel", THIS_FILE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; In this stage you go talk to Fjol
Debug.Trace(THIS_FILE + "#STAGE 10")
DriftshadeMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Startup stage

Debug.Trace(THIS_FILE + "#STAGE 00")
Alias_Frag03.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; END stage of M30 Quest. Give to Dragonborn a Silver tempered Greadsword 
Debug.Trace(THIS_FILE + "#STAGE 60")

; Remove Quest Items
Debug.Trace(THIS_FILE + "-- Remove Frag03")
Game.GetPlayer().RemoveItem(Alias_Frag03.GetReference())
Debug.Trace(THIS_FILE + "-- Remove Letter")
Game.GetPlayer().RemoveItem(Alias_LetterNelacar2.GetReference())

; Add Reward
Debug.Trace(THIS_FILE + "-- add DSilHand_TemperedSilverGreatsword")
Game.GetPlayer().AddItem(DSilHand_TemperedSilverGreatsword)

; Starts next quest
Debug.Trace(THIS_FILE + "-- Set temp stage -> Enables Driftshade Trigger")
Debug.Trace(THIS_FILE + "--  M40 -> Stage:5")
DSilHand_M40CompConspiracy.SetStage(5)

; Starts misc quest mi20preDwammerTempering
Debug.Trace(THIS_FILE + "-- Starts misc quest mi20preDwammerTempering")
DSilHand_iS01Trigger.SetStage(10)
DSilHand_iS01Trigger.SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; Go talk to Nelacar
Debug.Trace(THIS_FILE + "#STAGE 20")
WinterholdMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

WEAPON Property DSilHand_TemperedSilverGreatsword  Auto  
{Receive this Weapon after completing the DSilHand_M30 Quest.}

Quest Property DSilHand_M40CompConspiracy  Auto  
{Next quest reference}

Book Property DSilHand_LetterNelacar  Auto  
{DEPRECATED}

; Quest Property DSilHand_mi20preDwammerTempering  Auto  
; {Object to misc quest DSilHand_mi20preDwammerTempering}

Quest Property DSilHand_iS01Trigger  Auto  
{Object reference to the miscelaneos quest, responsible for trigger the side quest S01. }

String Property THIS_FILE  Auto  
{File name to be used on the logs.}

ObjectReference Property DriftshadeMarker  Auto  

ObjectReference Property WinterholdMarker  Auto  
