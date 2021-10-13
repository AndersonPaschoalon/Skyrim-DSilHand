Scriptname DSilHand_TestM80 extends ObjectReference  

Quest Property DSilHand_M80AssaultJor  Auto  

Faction Property SilverHandFaction  Auto  

Faction Property CompanionsFaction  Auto  

Faction Property PlayerFaction  Auto  

Quest Property DSilHand_M10SilverHunt  Auto  

Actor Property AelaTheHuntress  Auto  

Actor Property Skjor  Auto  

Actor Property Njada  Auto  

Actor Property Kodlak  Auto  

Actor Property Farkas  Auto  

Quest Property DSilHand_A01Troubleshoot  Auto  

String THIS_FILE = "(DSilHand_TestM80.psc) "

Event OnActivate(ObjectReference akActionRef)
    DSilHand_A01Troubleshoot.SetStage(80)
EndEvent






