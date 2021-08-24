Scriptname DSilHand_M80AliasKurdak extends ReferenceAlias  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ReferenceAlias Property xMarkerSkyforgeBlacksmith  Auto  
{}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
String THIS_FILE = "(DSilHand_M80AliasKurdak.psc) "
int STAGE_GOSKYFORGE = 100
bool alreadyActivated = false

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; This event is activated when Kurdak leaver Jorrvaskr after you found the  
; last Wuultrack fragment. Using this script the teleport will happen 
; automatic, so the player will have lass trouble waiting for all chars to
; arrive at Skyforge.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    if (GetOwningQuest().GetStage() == STAGE_GOSKYFORGE && alreadyActivated == false)
        ; this must happen once, and cant not be recursive
        alreadyActivated = true
        Debug.Trace(THIS_FILE + " -- moving Kurdak to the last M80 scene location....")
        Debug.MessageBox("Self trick" + (Self as ReferenceAlias))
        DSilHand_Utils.moveSingleNpcRefAlias((Self as ReferenceAlias), xMarkerSkyforgeBlacksmith, "Kurdak", THIS_FILE)
    endIf
endEvent

