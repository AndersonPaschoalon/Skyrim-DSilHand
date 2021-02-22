Scriptname DSilHand_TestDoorBarOpenClose extends ObjectReference  
{DSilHand_TestDoorBarOpenClose open/close}

BarredDoor doorScript

Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("-- DSilHand_TestDoorBarOpenClose");
    ObjectReference linkedDoor = DSilHand_GallowsDoorBar.getLinkedRef()
    doorScript = linkedDoor as BarredDoor
    Debug.MessageBox("--doorScript:<" + doorScript + ">");
    if (doorScript.barred == false)
        DSilHand_GallowsDoorBar.playAnimationAndWait("down","done")
        doorScript.barred = true
        linkedDoor.BlockActivation(true)
    else
        Debug.MessageBox("-- doorScript.barred: " + doorScript.barred);
    endif    
EndEvent


ObjectReference Property DSilHand_GallowsDoorBar  Auto  
{DSilHand_GallowsDoorBar}
