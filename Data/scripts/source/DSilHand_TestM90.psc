Scriptname DSilHand_TestM90 extends ObjectReference  

Quest Property DSilHand_M90HonYsgramor  Auto  

Faction Property SilverHandFaction  Auto  

Faction Property CompanionsFaction  Auto  

Faction Property PlayerFaction  Auto  

Quest Property DSilHand_A01Troubleshoot  Auto  

Event OnActivate(ObjectReference akActionRef)
    DSilHand_A01Troubleshoot.SetStage(90)    
;    Debug.MessageBox("You Have Joined the Silver Hands!")
;    Game.GetPlayer().AddToFaction(SilverHandFaction) 
;    SilverHandFaction.SetAlly(CompanionsFaction)
;    ;SilverHandFaction.SetAlly(GuardFactionWhiterun)
;    ;SilverHandFaction.SetAlly(IsGuardFaction)
;    ;SilverHandFaction.SetAlly(DragonsreachBasementGuards)
;    Debug.MessageBox("DSilHand_TestM90");
;    DSilHand_M90HonYsgramor.Start()
;    DSilHand_M90HonYsgramor.SetStage(10)
;    DSilHand_M90HonYsgramor.SetObjectiveDisplayed(10)
EndEvent





