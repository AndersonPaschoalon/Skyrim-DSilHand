;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_DSilHand_M50WolfAmbush_020092FD Extends Quest Hidden

;BEGIN ALIAS PROPERTY GallowsTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GallowsTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PreM60xMarkerImp1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PreM60xMarkerImp1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CompNord2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CompNord2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Krev
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Krev Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CompImp1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CompImp1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CompNor2XMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CompNor2XMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Njada
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Njada Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PreM60xMarkerBret1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PreM60xMarkerBret1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CompBret1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CompBret1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NjadaXMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NjadaXMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CaveTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CaveTrigger Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; Kill Njada Stonearm and her Shield Brother Objective completed
Debug.Trace("(DSilHand_M50:30) -- M50 Objective 20 completed")

; Teleport the companions rokies to Gallows entrance
Debug.Trace("(DSilHand_M50:30) -- M50 preM60: teleport the companions rookies to Gallows Rock entrace")
DSilHand_Utils.moveSingleNpcRefAlias(Alias_CompBret1, Alias_PreM60xMarkerBret1, "Alias_CompBret1", "(DSilHand_M50:30)") 
DSilHand_Utils.moveSingleNpcRefAlias(Alias_CompImp1, Alias_PreM60xMarkerImp1, "Alias_CompImp1", "(DSilHand_M50:30)") 

; ------------------
; Teleport the companions rokies to Gallows entrance
;Debug.Trace("(DSilHand_M50:30) -- M50 preM60: teleport the companions rookies to Gallows Rock entrace")
;Actor bret1 = Alias_CompBret1.GetReference() as Actor
;Actor imp1 = Alias_CompImp1.GetReference() as Actor
;ObjectReference markB1 =  Alias_PreM60xMarkerImp1.GetReference()
;ObjectReference markI1 = Alias_PreM60xMarkerBret1.GetReference()
;
;Debug.Trace("(DSilHand_M50:30) --  Check preM60 actors")
;Debug.Trace("(DSilHand_M50:30) --  bret1:<" + bret1 + ">")
;Debug.Trace("(DSilHand_M50:30) --  imp1:<" +  imp1 + ">")
;Debug.Trace("(DSilHand_M50:30) --  markB1:<" +  markB1 + ">")
;Debug.Trace("(DSilHand_M50:30) --  markI1:<" + markI1+ ">")
;
;; Teleport  Rookie Breton1
;bret1.MoveTo(markB1)
;bret1.SetPosition(markB1.GetPositionX(), markB1.GetPositionY(), markB1.GetPositionZ())
;bret1.Disable()
;bret1.Enable()
;
;; Teleport Rookie Imperial1
;imp1.MoveTo(markI1)
;imp1.SetPosition(markI1.GetPositionX(), markI1.GetPositionY(), markI1.GetPositionZ())
;imp1.Disable()
;imp1.Enable()
;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Debug.Trace("(DSilHand_M50:40) -- Quest M60 Completed")

;; Change DSilHand_M60Retaliation to the Setup Stage
;DSilHand_M60Retaliation.Start()
;Debug.Trace("-- Starting Quest M60")
;Debug.Trace(" -- DSilHans_M60:<" + DSilHand_M60Retaliation.GetStage() + ">")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Starts DSilHand_M50WolfAmbush Quest
Debug.Trace("(DSilHand_M50:0) -- Starts DSilHand_M50WolfAmbush Quest ")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

;Quest Property DSilHand_M60Retaliation  Auto  
;{DSilHand_M60Retaliation reference to quest, to update to the "Setup Stage 1".}
