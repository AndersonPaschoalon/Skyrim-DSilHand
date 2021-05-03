Scriptname Sandbox_CustomAiTestHelper extends Quest  

;
; Properties
;

ReferenceAlias Property theon  Auto  

ReferenceAlias Property balon  Auto  

SPELL Property TransformationSpell  Auto  

Race Property SkeeverRace  Auto  


;
; Member variables
;

Race originalTheonRace


;
; Functions
;

Function theonToSkeever()
    Debug.Trace(" -- Theon to Skeever")
    originalTheonRace = Theon.GetActorReference().GetRace()
    theon.GetActorReference().SetRace(SkeeverRace)
EndFunction

Function theonToNormal()
    Debug.Trace(" -- Theon to Normal")
    ; ** Cast the speel
    ; Cast(ObjectReference akSource, ObjectReference akTarget = None)
    TransformationSpell.Cast(balon.GetReference(), theon.GetReference())
    ; ** Wait a little and do the trasnformation
    Utility.Wait(0.5)  
    Theon.GetActorReference().SetRace(originalTheonRace)
EndFunction











