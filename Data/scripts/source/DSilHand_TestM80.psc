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

String THIS_FILE = "(DSilHand_TestM80.psc) "

Event OnActivate(ObjectReference akActionRef)
    Debug.Trace(THIS_FILE + " OnActivate()");
    Debug.Trace(THIS_FILE + "%% Join the right factions");
    Debug.MessageBox("You Have Joined the Silver Hands!")
    ;Game.GetPlayer().AddToFaction(SilverHandFaction)
    ;CompanionsFaction.SetEnemy(SilverHandFaction)
    ;CompanionsFaction.SetEnemy(PlayerFaction)
    Debug.Trace(THIS_FILE + "%% setup quest stages ");
    Debug.MessageBox("DSilHand_TestM80");
    DSilHand_M10SilverHunt.Start()
    DSilHand_M10SilverHunt.SetStage(60)
    DSilHand_M10SilverHunt.SetObjectiveCompleted(60)
    DSilHand_M80AssaultJor.Start()
    DSilHand_M80AssaultJor.SetStage(10)
    DSilHand_M80AssaultJor.SetObjectiveDisplayed(10)
    Debug.Trace(THIS_FILE + "%% disable dead actors ");
    AelaTheHuntress.Disable()
    Skjor.Disable()
    Njada.Disable()
    Farkas.Disable()
EndEvent




