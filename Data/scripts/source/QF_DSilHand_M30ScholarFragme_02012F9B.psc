;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_DSilHand_M30ScholarFragme_02012F9B Extends Quest Hidden

;BEGIN ALIAS PROPERTY Satchel
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Satchel Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY fjol
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_fjol Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nelacar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nelacar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Frag03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Frag03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LetterNelacar2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LetterNelacar2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Debug.Trace("(DSilHand_M30:50) -- Quest M30 at Stage:50")
;Alias_Fjol.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; END stage of M30 Quest. Give to Dragonborn a Silver tempered Greadsword 

; Remove Quest Items
Debug.Trace("(DSilHand_M30:60) -- Remove Frag03")
Game.GetPlayer().RemoveItem(Alias_Frag03.GetReference())
Debug.Trace("(DSilHand_M30:60) -- Remove Letter")
Game.GetPlayer().RemoveItem(Alias_LetterNelacar2.GetReference())

; Add Reward
Debug.Trace("(DSilHand_M30:60) -- add DSilHand_TemperedSilverGreatsword")
Game.GetPlayer().AddItem(DSilHand_TemperedSilverGreatsword)

; Starts next quest
Debug.Trace("(DSilHand_M30:60) -- Set temp stage -> Enables Driftshade Trigger")
Debug.Trace("(DSilHand_M30:60) --  M40 -> Stage:5")
DSilHand_M40CompConspiracy.SetStage(5)

; Starts misc quest mi20preDwammerTempering
Debug.Trace("(DSilHand_M30:60) -- Starts misc quest mi20preDwammerTempering")
DSilHand_mi20preDwammerTempering.SetStage(10)
DSilHand_mi20preDwammerTempering.SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; Nelecar gives to Dragonborn a letter
Debug.Trace("(DSilHand_M30:30) -- Add Item LetterNelacar2 to the players inventory");
if(Alias_LetterNelacar2 != None)
    Game.GetPlayer().AddItem(Alias_LetterNelacar2.GetReference())
    Debug.MessageBox("Nelacar just smiles, and gives you a letter.")
else 
    Debug.Trace("(DSilHand_M30:30) ** ERROR**  Alias_LetterNelacar2 is NULL", 2);
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Debug.Trace("(DSilHand_M30:0) -- starting DSilHand_M30")
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

Quest Property DSilHand_mi20preDwammerTempering  Auto  
{Object to misc quest DSilHand_mi20preDwammerTempering}
