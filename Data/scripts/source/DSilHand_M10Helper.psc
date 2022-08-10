Scriptname DSilHand_M10Helper extends Quest  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Quest Property C00  Auto  
{Companion Quest Take Up Arms}

Quest Property C00JorrvaskrFight  Auto  
{Companion hidden quest that manages the fight between Athis and Njada Stonearm when you arrive on Jorrvaskr.}

Quest Property C00GiantAttack  Auto  
{Comapanion hidden quest thah manages the Giant Attack to Whi, used to present the Companions}

Faction Property SilverHandFaction  Auto  
{Silver Hand Faction}

Faction Property CompanionsFaction  Auto  
{Companions Faction.}

Faction Property PlayerFaction  Auto  
{Player Faction.}

ReferenceAlias Property hillara  Auto  
{Hillara actor reference alias}

ReferenceAlias Property SENAAR  Auto  
{Sennar actor reference alias}

ReferenceAlias Property Krev  Auto  
{Krev the Skinner actor reference alias}

ReferenceAlias Property GallowsGuard  Auto  
{Driftshade Guard actor reference alias}

ReferenceAlias Property SpyWhiterun  Auto  
{Whiterun Spy actor reference alias.}

ReferenceAlias Property fjol  Auto  
{Fjol actor reference alias}

ReferenceAlias Property Kurdak  Auto  
{Kurdak actor reference alias}

ReferenceAlias Property DriftshadeGuard  Auto  
{Reference for Guard of Driftshade refugee fort.}

ObjectReference Property WerewolfWild1  Auto  
{First Wild werewolf for the quest M60.}

ObjectReference Property WerewolfWild2  Auto  
{Second Wild werewolf for the quest M60.}

ReferenceAlias Property GiantTroll  Auto  
{reference alias of the Giant frost troll on cold rock pass for the quest M10.}

Actor Property CompNord01  Auto  
{Acotr object for the Farkas Shield brother for the quest M40.}

Actor Property CompNord01F  Auto  
{Acotr object for the Farkas Shield brother for the quest M40.}

Actor Property CompNord02  Auto  
{Acotr object for the Njada Shield brother for the quest M50.}

Actor Property CompNord03  Auto  
{Actor object for the Trollsbane Nord for the quest M60.}

Actor Property CompNord04  Auto  
{Actor object for the Rookie circle member with ancient nord armor for the quest M60.}

Actor Property CompNord05  Auto  
{Actor object for the circle member for the quest M80.}

Actor Property CompBretonFire  Auto  
{Actor object for the Fire battlemage breton for the quest M60.}

Actor Property CompBretonFrost  Auto  
{Actor object for the Frost battlemage breton for the quest M80.}

Actor Property CompImp01  Auto  
{Reference for the imperial Companion for the quest M60.}

Actor Property CompImp02  Auto  
{Actor object for the Imperial Companion for the quest M80.}

Actor Property CompRed01  Auto  
{Actor object for the Redguard 01 of the quest M60.}

Actor Property CompRed02  Auto  
{Actor object for the Redguard 02 of the quest M60.}

Actor Property FakeFarkas  Auto  
{Actor object for the Farkas copy of the quest M40. }

Actor Property FakeNjada  Auto  
{Actor object for the copy of Njada used on the quest M50.}

Actor Property FakeAela  Auto  
{Actor object for the Aela copy of the quest M60. }

Actor Property FakeSkjor  Auto  
{Actor object for the Skjor copy of the quest M40. }

Actor Property FakeVilkas  Auto  
{Actor object for the copy of Vilkas used on the quest M80.}

Actor Property FakeTorvar  Auto  
{Actor object for the copy of Torvar used on the quest M80.}

Actor Property FakeKodlak  Auto  
{Actor object for the copy of the actor KodlakWhitemane used on the quest M80.}

Actor Property FakeVignar  Auto  
{Actor object for the copy of Torvar used on the quest M80.}

Actor Property FakeBrill  Auto  
{Actor object for the copy of Torvar used on the quest M80.}

Actor Property FakeAthis  Auto  
{Actor object for the copy of Torvar used on the quest M80.}

Actor Property FakeRia  Auto  
{Actor object for the copy of Torvar used on the quest M80.}

Actor Property FakeTilma  Auto  
{Actor object for the copy of Torvar used on the quest M80.}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Member variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
String THIS_FILE = "(DSilHand_M10Helper.psc) "
int STAGE_FAIL_QUEST = 100
int C00_FAILED_STAGE = 90
int C00_FAILED_OBJECTIVE = 90
int C00JORRVASKRFIGHT_LASTSTAGE = 100
int C00GIANTATTACK_LASTSTAGE = 200


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Public Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
;
; This function is called after the player joined the silver hand.
; This function does the setup on factions and quest if the player joined 
; the silver hands. 
; This function is triggered when the player join the silver hand. 
; It does the follow procedures:
; (1) Disable the companions quest, after the player joined the Silver Hand.
; (2) Join the Silver hand Quest.
; (3) Make the Companions agressive to the player.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function setupSilverHandJoin()
    Debug.Trace(THIS_FILE + " -- DISABLE C00")
    disable_C00()
    Debug.Trace(THIS_FILE + " -- DISABLE C00JorrvaskrFight")
    disable_C00JorrvaskrFight()
    Debug.Trace(THIS_FILE + " -- DISABLE C00GiantAttack")
    disable_C00GiantAttack()
    Debug.Trace(THIS_FILE + " -- JOIN THE SILVER HANDS")
    joinSilverHand()
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; This function is called when the FAILED stage is set. 
; Disable the Silver Hand quest if the player has joined the companions. 
; This function must be trigered by the Quest C00 after the player joined the 
; companion. When the player join the Companions, the quest C00 must set the 
; stage of the quest DSilHand_m10 to the stage 100, that runs this function.
; It does the follow procedures:
; (1) Make the Silver Hand Faction agressive 
; (2) Disable the Silver Hand Unique actors
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function setupCompanionsJoin() 
    Debug.Trace(THIS_FILE + " -- setupCompanionsJoin()")    
    afterjoinCompanions()
    disableSilverhandUniqueActors()
    ; Bugfix for mod compatibility
    DSilHand_M40CompConspiracy.CompleteQuest()
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; This function is activated on the M10 initialization. 
; It prepare the enviroment for the questline happen fine. 
; (1) Change the relationshipt between the player and the Silver Hand faction.
;     They will startup as ally, so they will not atack each other. 
;     It was not changed on the creation kit plugin to avoid incompatibilities
;     with other mods. 
; (2) Disable all the Actors that will be used later on, but are not imortal. 
;     M10 (Giant Frot Troll, Krev the Skinner), M40 (Fake Karkas, CompNord01),
;     M50 (CompNord02), M60 (Fake Aela, Fake Skjor, CompNord03, CompNord04, 
;     CompImp01, CompBretonFire, CompRed01, CompRed02, WildWereworf1, 
;     WildWerewolf2), M80 (CompNord05, CompBretonFrost, FakeDrunk, FakeKodlack, 
;     FakeVirkas) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function dSilHandSetup()
    Debug.Trace(THIS_FILE + " -- dSilHandSetup()")  
    Debug.Trace(THIS_FILE + "    (1) Change the relationship between the PlayerFaction and the SilverHandFaction")  
    if(SilverHandFaction != None && PlayerFaction != None)
        Debug.Trace(THIS_FILE + "    SilverHandFaction.SetAlly(PlayerFaction)")  
        SilverHandFaction.SetAlly(PlayerFaction)
    endif
    Debug.Trace(THIS_FILE + "    (2) disable all actors that will be used later on...")  
    ; disable wild werewolves on Gallows Rock ans the forst troll on Cold rock pass
    DSilHand_Utils.disableObject(WerewolfWild1, "WerewolfWild1", THIS_FILE)
    DSilHand_Utils.disableObject(WerewolfWild2, "WerewolfWild2", THIS_FILE)
    DSilHand_Utils.disableActorRefAlias(GiantTroll, "GiantTroll", THIS_FILE)
    ; disable companions actors 
    DSilHand_Utils.disableActor(CompNord01, "CompNord01", THIS_FILE)
    DSilHand_Utils.disableActor(CompNord01F , "CompNord01F", THIS_FILE)
    DSilHand_Utils.disableActor(CompNord02, "CompNord02", THIS_FILE)  
    DSilHand_Utils.disableActor(CompNord03, "CompNord03", THIS_FILE)  
    DSilHand_Utils.disableActor(CompNord04, "CompNord04", THIS_FILE)  
    DSilHand_Utils.disableActor(CompNord05, "CompNord05", THIS_FILE) 
    DSilHand_Utils.disableActor(CompBretonFire, "CompBretonFire", THIS_FILE)  
    DSilHand_Utils.disableActor(CompBretonFrost, "CompBretonFrost", THIS_FILE) 
    DSilHand_Utils.disableActor(CompImp01, "CompImp01", THIS_FILE) 
    DSilHand_Utils.disableActor(CompImp02, "CompImp02", THIS_FILE) 
    DSilHand_Utils.disableActor(CompRed01, "CompRed01", THIS_FILE) 
    DSilHand_Utils.disableActor(CompRed02, "CompRed02", THIS_FILE)  
    DSilHand_Utils.disableActor(FakeFarkas, "FakeFarkas", THIS_FILE)
    DSilHand_Utils.disableActor(FakeNjada, "FakeNjada", THIS_FILE)
    DSilHand_Utils.disableActor(FakeAela, "FakeAela", THIS_FILE)
    DSilHand_Utils.disableActor(FakeSkjor , "FakeSkjor", THIS_FILE)  
    DSilHand_Utils.disableActor(FakeVilkas , "FakeVilkas", THIS_FILE)  
    DSilHand_Utils.disableActor(FakeTorvar , "FakeTorvar", THIS_FILE)  
    DSilHand_Utils.disableActor(FakeKodlak , "FakeKodlak", THIS_FILE)  
    DSilHand_Utils.disableActor(FakeBrill , "FakeBrill", THIS_FILE)  
    DSilHand_Utils.disableActor(FakeVignar , "FakeVignar", THIS_FILE)  
    DSilHand_Utils.disableActor(FakeTilma , "FakeTilma", THIS_FILE)  
    DSilHand_Utils.disableActor(FakeRia , "FakeRia", THIS_FILE)  
    DSilHand_Utils.disableActor(FakeAthis , "FakeAthis", THIS_FILE)    
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Fail if player is already a Companions member.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function failIfPlayerIsCompanions()
    Debug.Trace(THIS_FILE + " -- failIfPlayerIsCompanions()")
    bool retVal = Game.GetPlayer().IsInFaction(CompanionsFaction)
    if(retVal == true)
        Debug.Trace(THIS_FILE + "    Player is already a Companion, force the quest to FAIL")
        SetStage(STAGE_FAIL_QUEST)
    endif
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Private Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Disable the quest C00 Take Up Arms.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function disable_C00()
    ; According to C00KodlakJoinUpStartTopic on C00, if the quest level is smaller than 10
    ; you can still join the companions
    ; Set to a shutdown stage
    ; (new) Stage 90 
    ; Stage 50  [Objective 50] Follow Farkas to your quarters
    ; Stage 100 [] I have joined the Companions, the legendary warrior band of Whiterun.
    Debug.Trace(THIS_FILE + " --  C00.SetStage()")
    C00.SetStage(C00_FAILED_STAGE)
    Debug.Trace(THIS_FILE + " -- C00.SetObjectiveFailed()")
    C00.SetObjectiveFailed(C00_FAILED_OBJECTIVE)
    C00.Stop()
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Disable C00JorrvaskrFight. If the current quest stage is smaller than the 
; last (that means, if the fight did not happened yet), it set it to the last 
; (so the fight will not happen).
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function disable_C00JorrvaskrFight()
    Debug.Trace(THIS_FILE + " -- disable_C00JorrvaskrFight()")
    int currentStage = C00JorrvaskrFight.GetStage()
    Debug.Trace(THIS_FILE + " -- currentStage:<" + currentStage + ">")
    if (currentStage < C00JORRVASKRFIGHT_LASTSTAGE)
        Debug.Trace(THIS_FILE + " -- 00JorrvaskrFight.SetStage(" + C00JORRVASKRFIGHT_LASTSTAGE + ")")
        C00JorrvaskrFight.SetStage(C00JORRVASKRFIGHT_LASTSTAGE)
        C00JorrvaskrFight.Stop()
    endif
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Disable C00GiantAttack. If the current quest stage is smaller than the 
; last (that means, if the fight did not happened yet), it set it to the last 
; (so the fight will not happen).
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function disable_C00GiantAttack()
    Debug.Trace(THIS_FILE + " -- disable_C00GiantAttack()")
    int currentStage = C00GiantAttack.GetStage()
    Debug.Trace(THIS_FILE + " -- currentStage:<" + currentStage + ">")
    if (currentStage < C00GIANTATTACK_LASTSTAGE)
        Debug.Trace(THIS_FILE + " -- 00JorrvaskrFight.SetStage(" + C00GIANTATTACK_LASTSTAGE + ")")
        C00GiantAttack.SetStage(C00GIANTATTACK_LASTSTAGE)
        C00GiantAttack.Stop()
    endif
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Join the Silver Hand faction. Add the party to the Silver Hands, and make the
; Companions agressive to the player. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function joinSilverHand()
    Debug.Trace(THIS_FILE + " -- joinSilverHand()")
    Debug.Trace(THIS_FILE + " -- Add player to Silver Hand Faction")
    Game.GetPlayer().AddToFaction(SilverHandFaction)
    Debug.Trace(THIS_FILE + " -- Set the Companions enemy to the Silver Hand Factin")
    CompanionsFaction.SetEnemy(SilverHandFaction)
    Debug.Trace(THIS_FILE + " -- Make the Companions enemy to the Player Faction")
    CompanionsFaction.SetEnemy(PlayerFaction)
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; After joining the companions, make the SilverHandFaction agressive to the 
; player.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function afterjoinCompanions()
    Debug.Trace(THIS_FILE + " -- afterjoinCompanions()")
    SilverHandFaction.SetEnemy(PlayerFaction)
    Debug.Trace(THIS_FILE + " -- Set the Companions enemy to the Silver Hand Factin")
    CompanionsFaction.SetEnemy(SilverHandFaction)    
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; After joining the companions, disable Silver hand unique actors. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function disableSilverhandUniqueActors()
    Debug.Trace(THIS_FILE + " -- disableSilverhandUniqueActors()") 
    ; Disable Hillara
    DSilHand_Utils.disableActorRefAlias(hillara, "Hillara", THIS_FILE)
    ; Disable Sennar
    DSilHand_Utils.disableActorRefAlias(SENAAR, "Sennar", THIS_FILE)
    ; Disable Krev
    DSilHand_Utils.disableActorRefAlias(Krev, "Krev", THIS_FILE)
    ; Disable Fjol
    DSilHand_Utils.disableActorRefAlias(Fjol, "Fjol", THIS_FILE)    
    ; Disable Gallows Guard
    DSilHand_Utils.disableActorRefAlias(GallowsGuard, "GallowsGuard", THIS_FILE)
    ; Disable Driftshade Guard
    DSilHand_Utils.disableActorRefAlias(DriftshadeGuard, "DriftshadeGuard", THIS_FILE)
    ; Disable Whiterun Spy 
    DSilHand_Utils.disableActorRefAlias(SpyWhiterun, "SpyWhiterun", THIS_FILE)
    ; Disable Kurdak
    DSilHand_Utils.disableActorRefAlias(Kurdak, "Kurdak", THIS_FILE)    
endFunction










Quest Property DSilHand_M40CompConspiracy  Auto  
