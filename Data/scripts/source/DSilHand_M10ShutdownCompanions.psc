Scriptname DSilHand_M10ShutdownCompanions extends Quest  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Quest Property C00  Auto  
{Quest Take Up Arms}

Quest Property C00JorrvaskrFight  Auto  
{Fight when you arrive on Jorrvaskr between Athis and Njada Stonearm}

Faction Property SilverHandFaction  Auto  
{Silver Hand Faction}

Faction Property CompanionsFaction  Auto  
{Companions Faction}

Faction Property PlayerFaction  Auto  
{Player Faction}

ReferenceAlias Property hillara  Auto  
{Hillara actor reference alias}

ReferenceAlias Property SENAAR  Auto  
{Sennar actor reference alias}

ReferenceAlias Property Krev  Auto  
{Krev the Skinner actor reference alias}

ReferenceAlias Property GallowsGuard  Auto  
{Gallows Guard actor reference alias}

ReferenceAlias Property DriftshadeGuard  Auto  
{Driftshade Guard actor reference alias}

ReferenceAlias Property SpyWhiterun  Auto  
{Whiterun Spy actor reference alias}

ReferenceAlias Property fjol  Auto  
{Krev actor reference alias}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Member variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
String THIS_FILE = "DSilHand_M10ShutdownCompanions.psc"
int C00_FAILED_STAGE = 90
int C00_FAILED_OBJECTIVE = 90
int C00JORRVASKRFIGHT_LASTSTAGE = 100


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Public Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
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
    Debug.Trace(THIS_FILE + " -- JOIN THE SILVER HANDS")
    joinSilverHand()
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Disable the Silver Hand quest if the player has joined the companions. 
; This function must be trigered by the Quest C00 after the player joined the 
; companion. When the player join the Companions, the quest C00 must set the 
; stage of the quest DSilHand_m10 to the stage 100, that runs this function.
; It does the follow procedures:
; (1) Make the Silver Hand Faction agressive 
; (2) Disable the Silver Hand Unique actors
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function setupCompanionsJoin() 
    Debug.Trace(THIS_FILE + " -- setupCompanionsJoin")    
    afterjoinCompanions()
    disableCompanionsActors()
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Private Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
;
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
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; After joining the companions, disable Silver hand unique actors. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function disableCompanionsActors()
    Debug.Trace(THIS_FILE + " -- disableCompanionsActors()")
    
    ; Disable Fjol
    Debug.Trace(THIS_FILE + " -- Disable Fjol")
    if(fjol != None)
        SpyWhiterun.GetActorReference().Disable()
    else
        Debug.Trace(THIS_FILE + " **ERROR** Reference to acotor Fjol is EMPTY!", 2)
    endif   

    ; Disable Hillara
    Debug.Trace(THIS_FILE + " -- Disable HIllara!")
    if(hillara != None)
        hillara.GetActorReference().Disable()
    else
        Debug.Trace(THIS_FILE + " **ERROR** Reference to acotor HIllara is EMPTY!", 2)
    endif 

    ; Disable Sennar
    Debug.Trace(THIS_FILE + " -- Disable Sennar")
    if(SENAAR != None)
        SENAAR.GetActorReference().Disable()  
    else
        Debug.Trace(THIS_FILE + " **ERROR** Reference to acotor Sennar is EMPTY!", 2)
    endif 

    ; Disable Krev
    Debug.Trace(THIS_FILE + " -- Disable Krev the Skinner")
    if(Krev != None)
        Krev.GetActorReference().Disable() 
    else
        Debug.Trace(THIS_FILE + " **ERROR** Reference to acotor Krev is EMPTY!", 2)
    endif 

    ; Disable Gallows Guard
    Debug.Trace(THIS_FILE + " -- Disable GallowsGuard")
    if(GallowsGuard != None)
        GallowsGuard.GetActorReference().Disable() 
    else
        Debug.Trace(THIS_FILE + " **ERROR** Reference to acotor GallowsGuard is EMPTY!", 2)
    endif 

    ; Disable Driftshade Guard
    Debug.Trace(THIS_FILE + " -- Disable DriftshadeGuard")
    if(DriftshadeGuard != None)
        DriftshadeGuard.GetActorReference().Disable()
    else
        Debug.Trace(THIS_FILE + " **ERROR** Reference to acotor DriftshadeGuard is EMPTY!", 2)
    endif 

    ; Disable Whiterun Spy 
    Debug.Trace(THIS_FILE + " -- Disable SpyWhiterun")
    if(SpyWhiterun != None)
        SpyWhiterun.GetActorReference().Disable()
    else
        Debug.Trace(THIS_FILE + " **ERROR** Reference to acotor SpyWhiterun is EMPTY!", 2)
    endif     
    
endFunction






