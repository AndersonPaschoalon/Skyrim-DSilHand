Scriptname TestMod02_HelloWorld extends ObjectReference  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Script properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Int Property testIntVal = 0 Auto  
{This is a test property}

GlobalVariable Property TestMod02_testGlobalVar  Auto  
{test the TestMod02_testGlobal on the script scope.}

Faction Property SilverHandFaction  Auto  

Faction Property PlayerFaction  Auto  

Int varNotProp 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Script Events
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: none
;
; Runs on object is loaded by the game
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnInit()
    Debug.MessageBox("OnInit: TestMod02_HelloWorld")
    Debug.Trace("#######################################################")
    Debug.Trace("# TestMod02_HelloWorld")
    Debug.Trace("#######################################################")

    ; Test Logs
    ; Output "Hello World" to the log
    Debug.Trace("Hello, World!")
    ; Output "Hello World" to the log at error severity
    Debug.Trace("Hello, World!", 2)

    ; Test types
    Int val = 10
    String str = "Hey dude, val:"
    String combo = str + val
    Debug.Trace(combo)

    ; Test scope
    initVarNotProp(0)
    Debug.MessageBox("02. varNotProp:" + varNotProp)
    Debug.MessageBox("03. getVarNotProp():" + getVarNotProp())
    ; Globals
    TestMod02_testGlobalVar.SetValue(314)
    Debug.MessageBox("04. TestMod02_testGlobalVar.GetValue():" + TestMod02_testGlobalVar.GetValue())

EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: akActionRef
;
; Runs on the player open the barrel container. Than it makes the player 
; joins the Silverhand faction
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("OnActivate Ok");
    Debug.MessageBox("SilverHandFaction:" + SilverHandFaction.GetFormID());
    Debug.MessageBox("SilverHandFaction:" + SilverHandFaction);
    Game.GetPlayer().AddToFaction(SilverHandFaction)
    ;  This is best used in conjunction with AddToFaction as members of factions that oppose 
    ; the PlayerFaction may have a high Aggression level, and you must use this function and 
    ; set the value to 3 for making them friends.
    PlayerFaction.SetReaction(SilverHandFaction, 3)
    Debug.MessageBox("Player Joined the Silverhand!!!");
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: 
;
; Runs on the player hits the barrel with any atack. It make the player be
; removed from the Silverhand faction is the player is on the faction
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack,  bool abBashAttack, bool abHitBlocked)
    Debug.MessageBox("Hit ok!");
    Debug.Trace("Game.GetPlayer():" + Game.GetPlayer());
    Debug.Trace("akAggressor:" + akAggressor);
    if(Game.GetPlayer().IsInFaction(SilverHandFaction))
        Game.GetPlayer().RemoveFromFaction(SilverHandFaction)
        Debug.MessageBox("You are not silver hand anymore :'( '");
    endIf
    Debug.MessageBox("We were hit by " + akAggressor);
    Debug.Trace("We were hit by " + akAggressor)
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Script functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: int value
;
; Initializes varNotProp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function initVarNotProp(Int val)
    varNotProp = 2 + val
Endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: int value
;
; Input value to be set
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function setTestIntVal(int value)
    testIntVal = value
Endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: int value
;
; return testIntVal outside of the function
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Int Function getTestIntVal()
    return testIntVal
Endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: int value
;
; tries to return varNotProp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Int Function getVarNotProp()
    return varNotProp
Endfunction

