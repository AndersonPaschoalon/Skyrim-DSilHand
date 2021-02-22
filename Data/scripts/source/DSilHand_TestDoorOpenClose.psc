Scriptname DSilHand_TestDoorOpenClose extends ObjectReference  
{DSilHand_TestDoorOpenClose script for doors}

Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("-- DSilHand_TestDoorOpenClose");
    if(DSilHand_GallowsBarredDoor.GetOpenState() == 1)
        DSilHand_GallowsBarredDoor.SetOpen(false)
    else
        Debug.MessageBox("-- Current Door State: " + DSilHand_GallowsBarredDoor.GetOpenState());
    endif
    ;DSilHand_KrevTheSkenner.Enable()
    ;DSilHand_M50WolfAmbush.Start()
    ;DSilHand_M50WolfAmbush.SetStage(5)
    ;DSilHand_M50WolfAmbush.SetObjectiveDisplayed(10)
EndEvent

;The current "open state" of the object. Will be one of the following:
;0: None (object can't be opened or closed)
;1: Open
;2: Opening
;3: Closed
;4: Closing
ObjectReference Property DSilHand_GallowsBarredDoor  Auto  
{DSilHand_GallowsBarredDoor}
