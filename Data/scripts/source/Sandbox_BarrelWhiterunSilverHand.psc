Scriptname Sandbox_BarrelWhiterunSilverHand extends ObjectReference  

Actor Property SilverHand01  Auto  
Actor Property SilverHand02  Auto  
bool isDisabled = false

Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("Tutorial Sandbox_BarrelWhiterunSilverHand => Enable Silver Hands")
    if (isDisabled == false)
        SilverHand01.Disable()
        SilverHand02.Disable()
        isDisabled = true
    else
        SilverHand01.Enable()
        SilverHand02.Enable()  
        isDisabled = false      
    endif
endEvent



