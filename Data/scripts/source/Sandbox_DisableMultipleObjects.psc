Scriptname Sandbox_DisableMultipleObjects extends ObjectReference  

ObjectReference Property Sandbox_ParentObjectsRef  Auto  

Event OnActivate(ObjectReference akActionRef)
	Debug.MessageBox("Test DisableMultipleObjectst")
	Bool isXmarkerEnabled =  Sandbox_ParentObjectsRef.IsEnabled()
	if(isXmarkerEnabled)
		Debug.MessageBox("xMarker is ENABLED -> DISABLE NOW!")
		 Sandbox_ParentObjectsRef.Disable()
	else 
		Debug.MessageBox("xMarker is DISABLED -> ENABLE NOW!")
		 Sandbox_ParentObjectsRef.Enable()
	endif
	 Sandbox_ParentObjectsRef.Activate(Sandbox_ParentObjectsRef)

endEvent



