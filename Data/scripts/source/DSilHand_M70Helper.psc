Scriptname DSilHand_M70Helper extends Quest  
{Helper script for quest M70.}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ReferenceAlias Property SilverHand01  Auto  

ReferenceAlias Property SilverHand02  Auto  

ReferenceAlias Property SilverHand03  Auto  

ReferenceAlias Property SilverHand04  Auto  

ReferenceAlias Property SilverHand05  Auto  

ReferenceAlias Property SilverHand06  Auto  

ReferenceAlias Property SilverHand07  Auto  

ReferenceAlias Property SilverHand08  Auto  

ReferenceAlias Property SilverHand09  Auto  

ReferenceAlias Property SilverHand10  Auto  

ReferenceAlias Property SilverHand11  Auto  

ReferenceAlias Property SilverHand12  Auto  

ReferenceAlias Property SilverHand13  Auto  

ReferenceAlias Property SilverHand14  Auto  

ReferenceAlias Property SilverHand15  Auto  

ReferenceAlias Property Grave01  Auto  

ReferenceAlias Property Grave02  Auto  

ReferenceAlias Property Grave03  Auto  

ReferenceAlias Property Grave04  Auto  

ReferenceAlias Property Grave05  Auto  

ReferenceAlias Property Grave06  Auto  

ReferenceAlias Property Grave07  Auto  

ReferenceAlias Property Grave08  Auto  

ReferenceAlias Property Grave09  Auto  

ReferenceAlias Property Grave10  Auto  

ReferenceAlias Property Grave11  Auto  

ReferenceAlias Property Grave12  Auto  

ReferenceAlias Property Grave13  Auto  

ReferenceAlias Property Grave14  Auto  

ReferenceAlias Property Grave15  Auto  

ReferenceAlias Property KrevGrave01  Auto  

ReferenceAlias Property KrevGrave02  Auto  

ReferenceAlias Property KrevGrave03  Auto  

ReferenceAlias Property KrevGrave04  Auto  

ReferenceAlias Property KrevGrave05  Auto  

ReferenceAlias Property KrevGrave06  Auto  

ReferenceAlias Property KrevGrave07  Auto  

ReferenceAlias Property KrevGrave08  Auto  

ReferenceAlias Property KrevGrave09  Auto  

ReferenceAlias Property KrevGrave10  Auto  

ReferenceAlias Property KrevGrave11  Auto  

ReferenceAlias Property KrevGrave12  Auto  

ReferenceAlias Property Fjol  Auto  

ReferenceAlias Property Krev  Auto  

ReferenceAlias Property Frag01  Auto  

ReferenceAlias Property chest  Auto  

ReferenceAlias Property xMarkGrave  Auto  

ReferenceAlias Property xMarkSovngarde  Auto  

SPELL Property AbFXSovengardeGlow  Auto  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  MEMBER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

String THIS_FILE = "(DSilHand_M70Helper.psc) "

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Public Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function moveKrevToSovngarde()
    Debug.Trace(THIS_FILE + " -- moveKrevToSovngarde()")
    Actor krevActor = Krev.GetReference() as Actor
    krevActor.Enable()
    ObjectReference mark = xMarkSovngarde.GetReference() as ObjectReference
    moveSingleNpc(krevActor, mark, "Krev -> Sovngarde")
    Debug.Trace(THIS_FILE + " -- make krev glow")
    AbFXSovengardeGlow.Cast(krevActor, krevActor)
    Debug.Trace(THIS_FILE + " -- make krev invulnerable")
    krevActor.GetActorBase().SetInvulnerable(true)
endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Enables Krev grave
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function enableKrevGrave()    
    ObjectReference kg01 = KrevGrave01.GetReference() as ObjectReference 
    ObjectReference kg02 = KrevGrave02.GetReference() as ObjectReference  
    ObjectReference kg03 = KrevGrave03.GetReference() as ObjectReference  
    ObjectReference kg04 = KrevGrave04.GetReference() as ObjectReference  
    ObjectReference kg05 = KrevGrave05.GetReference() as ObjectReference  
    ObjectReference kg06 = KrevGrave06.GetReference() as ObjectReference  
    ObjectReference kg07 = KrevGrave07.GetReference() as ObjectReference  
    ObjectReference kg08 = KrevGrave08.GetReference() as ObjectReference  
    ObjectReference kg09 = KrevGrave09.GetReference() as ObjectReference  
    ObjectReference kg10 = KrevGrave10.GetReference() as ObjectReference  
    ObjectReference kg11 = KrevGrave11.GetReference() as ObjectReference  
    ObjectReference kg12 = KrevGrave12.GetReference() as ObjectReference  
    Debug.Trace(THIS_FILE + " -- Grave01:<" + kg01 + ">")
    Debug.Trace(THIS_FILE + " -- Grave02:<" + kg02 + ">")
    Debug.Trace(THIS_FILE + " -- Grave03:<" + kg03 + ">")
    Debug.Trace(THIS_FILE + " -- Grave04:<" + kg04 + ">")
    Debug.Trace(THIS_FILE + " -- Grave05:<" + kg05 + ">")
    Debug.Trace(THIS_FILE + " -- Grave06:<" + kg06 + ">")
    Debug.Trace(THIS_FILE + " -- Grave07:<" + kg07 + ">")
    Debug.Trace(THIS_FILE + " -- Grave08:<" + kg08 + ">")
    Debug.Trace(THIS_FILE + " -- Grave09:<" + kg09 + ">")
    Debug.Trace(THIS_FILE + " -- Grave10:<" + kg10 + ">")
    Debug.Trace(THIS_FILE + " -- Grave11:<" + kg11 + ">")
    Debug.Trace(THIS_FILE + " -- Grave12:<" + kg12 + ">")   

    if (kg01 != None) 
        kg01.Enable()
    else 
        Debug.Trace(THIS_FILE + " **ERROR** kg01 IS NULL", 2)
    endif

    if (kg02 != None) 
        kg02.Enable()
    else 
        Debug.Trace(THIS_FILE + " **ERROR** kg02 IS NULL", 2)
    endif        

    if (kg03 != None) 
        kg03.Enable()
    else 
        Debug.Trace(THIS_FILE + " **ERROR** kg03 IS NULL", 2)
    endif    

    if (kg04 != None) 
        kg04.Enable()
    else 
        Debug.Trace(THIS_FILE + " **ERROR** kg04 IS NULL", 2)
    endif

    if (kg05 != None) 
        kg05.Enable()
    else 
        Debug.Trace(THIS_FILE + " **ERROR** kg05 IS NULL", 2)
    endif

    if (kg06 != None) 
        kg06.Enable()
    else 
        Debug.Trace(THIS_FILE + " **ERROR** kg06 IS NULL", 2)
    endif

    if (kg07 != None) 
        kg07.Enable()
    else 
        Debug.Trace(THIS_FILE + " **ERROR** kg07 IS NULL", 2)
    endif

    if (kg08 != None) 
        kg08.Enable()
    else 
        Debug.Trace(THIS_FILE + " **ERROR** kg08 IS NULL", 2)
    endif

    if (kg09 != None) 
        kg09.Enable()
    else 
        Debug.Trace(THIS_FILE + " **ERROR** kg09 IS NULL", 2)
    endif

    if (kg10 != None) 
        kg10.Enable()
    else 
        Debug.Trace(THIS_FILE + " **ERROR** kg10 IS NULL", 2)
    endif

    if (kg11 != None) 
        kg11.Enable()
    else 
        Debug.Trace(THIS_FILE + " **ERROR** kg11 IS NULL", 2)
    endif

    if (kg12 != None) 
        kg12.Enable()
    else 
        Debug.Trace(THIS_FILE + " **ERROR** kg12 IS NULL", 2)
    endif
  
endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; Enables Silver hand Soldiers Graves
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool Function enableSilverhandGraves()
    Debug.Trace(THIS_FILE + " -- enableSilverhandGraves()")    
    ; Load vars
    ObjectReference g01 = Grave01.GetReference() as ObjectReference 
    ObjectReference g02 = Grave02.GetReference() as ObjectReference  
    ObjectReference g03 = Grave03.GetReference() as ObjectReference  
    ObjectReference g04 = Grave04.GetReference() as ObjectReference  
    ObjectReference g05 = Grave05.GetReference() as ObjectReference  
    ObjectReference g06 = Grave06.GetReference() as ObjectReference  
    ObjectReference g07 = Grave07.GetReference() as ObjectReference  
    ObjectReference g08 = Grave08.GetReference() as ObjectReference  
    ObjectReference g09 = Grave09.GetReference() as ObjectReference  
    ObjectReference g10 = Grave10.GetReference() as ObjectReference  
    ObjectReference g11 = Grave11.GetReference() as ObjectReference  
    ObjectReference g12 = Grave12.GetReference() as ObjectReference  
    ObjectReference g13 = Grave13.GetReference() as ObjectReference  
    ObjectReference g14 = Grave14.GetReference() as ObjectReference   
    ObjectReference g15 = Grave15.GetReference() as ObjectReference          
    int nDeadSilHand = calcDeadSilverhand()
    Debug.Trace("(DSilHand_M70Helper.psc) -- nDeadSilHand:<" + nDeadSilHand + ">");
    ; Enable graves
    Debug.Trace(THIS_FILE + " -- Enable Graves:<" + nDeadSilHand + ">")
    if(nDeadSilHand >= 1)
        if(g01 != None)
            g01.Enable()
        else 
            Debug.Trace(THIS_FILE + " **ERROR** Grave g01 IS NULL", 2)
        endif
    endif

    if(nDeadSilHand >= 2)
        if(g02 != None) 
            g02.Enable()
        else 
            Debug.Trace(THIS_FILE + " **ERROR** Grave g02 IS NULL", 2)
        endif
    endif

    if(nDeadSilHand >= 3) 
        if(g03 != None)
            g03.Enable()
        else 
            Debug.Trace(THIS_FILE + " **ERROR** Grave g03 IS NULL", 2)
        endif
    endif

    if(nDeadSilHand >= 4)
        if(g04 != None) 
            g04.Enable()
        else 
            Debug.Trace(THIS_FILE + " **ERROR** Grave g04 IS NULL", 2)
        endif
    endif

    if(nDeadSilHand >= 5)
        if(g05 != None) 
            g05.Enable()
        else 
            Debug.Trace(THIS_FILE + " **ERROR** Grave g05 IS NULL", 2)
        endif
    endif

    if(nDeadSilHand >= 6) 
        if(g06 != None)
            g06.Enable()
        else 
            Debug.Trace(THIS_FILE + " **ERROR** Grave g06 IS NULL", 2)
        endif
    endif

    if(nDeadSilHand >= 7) 
        if(g07 != None)
            g07.Enable()
        else 
            Debug.Trace(THIS_FILE + " **ERROR** Grave g07 IS NULL", 2)
        endif
    endif

    if(nDeadSilHand >= 8)
        if(g08 != None) 
            g08.Enable()
        else 
            Debug.Trace(THIS_FILE + " **ERROR** Grave g08 IS NULL", 2)
        endif
    endif

    if(nDeadSilHand >= 9) 
        if(g09 != None)
            g09.Enable()
        else 
            Debug.Trace(THIS_FILE + " **ERROR** Grave g09 IS NULL", 2)
        endif
    endif

    if(nDeadSilHand >= 10)
        if(g10 != None) 
            g10.Enable()
        else 
            Debug.Trace(THIS_FILE + " **ERROR** Grave g10 IS NULL", 2)
        endif
    endif

    if(nDeadSilHand >= 11)
        if(g11 != None) 
            g11.Enable()
        else 
            Debug.Trace(THIS_FILE + " **ERROR** Grave g11 IS NULL", 2)
        endif
    endif

    if(nDeadSilHand >= 12) 
        if(g12 != None)
            g12.Enable()
        else 
            Debug.Trace(THIS_FILE + " **ERROR** Grave g12 IS NULL", 2)
        endif
    endif

    if(nDeadSilHand >= 13)
        if(g13 != None) 
            g13.Enable()
        else 
            Debug.Trace(THIS_FILE + " **ERROR** Grave g13 IS NULL", 2)
        endif
    endif            

    if(nDeadSilHand >= 14)
        if(g14 != None) 
            g14.Enable()
        else 
            Debug.Trace(THIS_FILE + " **ERROR** Grave g14 IS NULL", 2)
        endif
    endif            

    if(nDeadSilHand >= 15) 
        if(g15 != None)
            g15.Enable()  
        else 
            Debug.Trace(THIS_FILE + " **ERROR** Grave g15 IS NULL", 2)
        endif
    endif

endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function setFjolOnGrave()
    Debug.Trace(THIS_FILE + " -- moveKrevToSovngarde()")
    Actor fjolActor = Fjol.GetReference() as Actor
    ObjectReference mark = xMarkGrave.GetReference() as ObjectReference
    moveSingleNpc(fjolActor, mark, "Fjol -> KrevGrave")
endfunction 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function releaseFjol()
    ; TODO  
endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Private Methods
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
int Function calcDeadSilverhand()
    Debug.Trace(THIS_FILE + " -- calcDeadSilverhand()")
    ; Load vars
    Actor sh01 = SilverHand01.GetReference() as Actor
    Actor sh02 = SilverHand02.GetReference() as Actor
    Actor sh03 = SilverHand03.GetReference() as Actor
    Actor sh04 = SilverHand04.GetReference() as Actor
    Actor sh05 = SilverHand05.GetReference() as Actor
    Actor sh06 = SilverHand06.GetReference() as Actor
    Actor sh07 = SilverHand07.GetReference() as Actor
    Actor sh08 = SilverHand08.GetReference() as Actor
    Actor sh09 = SilverHand09.GetReference() as Actor
    Actor sh10 = SilverHand10.GetReference() as Actor
    Actor sh11 = SilverHand11.GetReference() as Actor
    Actor sh12 = SilverHand12.GetReference() as Actor
    Actor sh13 = SilverHand13.GetReference() as Actor
    Actor sh14 = SilverHand14.GetReference() as Actor
    Actor sh15 = SilverHand15.GetReference() as Actor
    int retVal = 0
    if(sh01 != None)    
        if(sh01.IsDead()) 
            retVal = retVal + 1
        else 
            Debug.Trace(THIS_FILE + " sh01<" + sh01 + "> is Alive")
        endif
    else 
        Debug.Trace(THIS_FILE + " **ERROR** SilverHand Actor sh01 IS NULL", 2)    
    endif     

    if(sh02 != None)
        if(sh02.IsDead()) 
            retVal = retVal + 1
        else 
            Debug.Trace(THIS_FILE + " sh02<" + sh02 + "> is Alive")
        endif
    else 
        Debug.Trace(THIS_FILE + " **ERROR** SilverHand Actor sh02 IS NULL", 2)    
    endif  

    if(sh03 != None) 
        if(sh03.IsDead()) 
            retVal = retVal + 1
        else 
            Debug.Trace(THIS_FILE + " sh03<" + sh03 + "> is Alive")
        endif
    else 
        Debug.Trace(THIS_FILE + " **ERROR** SilverHand Actor sh03 IS NULL", 2)    
    endif  

    if(sh04 != None)
        if(sh04.IsDead()) 
            retVal = retVal + 1
        else 
            Debug.Trace(THIS_FILE + " sh04<" + sh04 + "> is Alive")
        endif
    else 
        Debug.Trace(THIS_FILE + " **ERROR** SilverHand Actor sh04 IS NULL", 2)    
    endif  

    if(sh05 != None)
        if(sh05.IsDead()) 
            retVal = retVal + 1
        else 
            Debug.Trace(THIS_FILE + " sh05<" + sh05 + "> is Alive")
        endif
    else 
        Debug.Trace(THIS_FILE + " **ERROR** SilverHand Actor sh05 IS NULL", 2)    
    endif  

    if(sh06 != None)            
        if(sh06.IsDead()) 
            retVal = retVal + 1
        else 
            Debug.Trace(THIS_FILE + " sh06<" + sh06 + "> is Alive")
        endif
    else 
        Debug.Trace(THIS_FILE + " **ERROR** SilverHand Actor sh06 IS NULL", 2)    
    endif  

    if(sh07 != None)
        if(sh07.IsDead()) 
            retVal = retVal + 1
        else 
            Debug.Trace(THIS_FILE + " sh07<" + sh07 + "> is Alive")
        endif
    else 
        Debug.Trace(THIS_FILE + " **ERROR** SilverHand Actor sh07 IS NULL", 2)    
    endif  

    if(sh08 != None)            
        if(sh08.IsDead()) 
            retVal = retVal + 1
        else 
            Debug.Trace(THIS_FILE + " sh08<" + sh08 + "> is Alive")
        endif
    else 
        Debug.Trace(THIS_FILE + " **ERROR** SilverHand Actor sh08 IS NULL", 2)    
    endif  

    if(sh09 != None)            
        if(sh09.IsDead()) 
            retVal = retVal + 1
        else 
            Debug.Trace(THIS_FILE + " sh09<" + sh09 + "> is Alive")
        endif
    else 
        Debug.Trace(THIS_FILE + " **ERROR** SilverHand Actor sh09 IS NULL", 2)    
    endif  

    if(sh10 != None)            
        if(sh10.IsDead()) 
            retVal = retVal + 1
        else 
            Debug.Trace(THIS_FILE + " sh10<" + sh10 + "> is Alive")
        endif
    else 
        Debug.Trace(THIS_FILE + " **ERROR** SilverHand Actor sh10 IS NULL", 2)    
    endif  

    if(sh11 != None)            
        if(sh11.IsDead()) 
            retVal = retVal + 1
        else 
            Debug.Trace(THIS_FILE + " sh11<" + sh11 + "> is Alive")
        endif
    else 
        Debug.Trace(THIS_FILE + " **ERROR** SilverHand Actor sh11 IS NULL", 2)    
    endif  

    if(sh12 != None)            
        if(sh12.IsDead()) 
            retVal = retVal + 1
        else 
            Debug.Trace(THIS_FILE + " sh12<" + sh12 + "> is Alive")
        endif
    else 
        Debug.Trace(THIS_FILE + " **ERROR** SilverHand Actor sh12 IS NULL", 2)    
    endif  

    if(sh13 != None)            
        if(sh13.IsDead()) 
            retVal = retVal + 1
        else 
            Debug.Trace(THIS_FILE + " sh013<" + sh13 + "> is Alive")
        endif
    else 
        Debug.Trace(THIS_FILE + " **ERROR** SilverHand Actor sh13 IS NULL", 2)    
    endif  

    if(sh14 != None)            
        if(sh14.IsDead()) 
            retVal = retVal + 1
        else 
            Debug.Trace(THIS_FILE + " sh14<" + sh14 + "> is Alive")
        endif
    else 
        Debug.Trace(THIS_FILE + " **ERROR** SilverHand Actor sh14 IS NULL", 2)    
    endif  

    if(sh15 != None)            
        if(sh15.IsDead()) 
            retVal = retVal + 1
        else 
            Debug.Trace(THIS_FILE + " sh15<" + sh15 + "> is Alive")
        endif
    else 
        Debug.Trace(THIS_FILE + " **ERROR** SilverHand Actor sh15 IS NULL", 2)    
    endif  

    Debug.Trace(THIS_FILE + " -- calcDeadSilverhand ret val:" + retVal)
    return retVal        
endfunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Actor npc - NPC to be moved
; Input: ObjectReference marker - ObjectReference to the marker the NPC will
;        be moved
; Input: String logInfo - information about the NPC and Marker, to be loged.
; 
; Function to move a single NPC to a marker.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function moveSingleNpc(Actor npc, ObjectReference marker, String logInfo)
    if( (npc != None) && (marker != None))
        Debug.Trace(THIS_FILE + " moving NPC " + logInfo)
        npc.MoveTo(marker)
        npc.Enable()
        npc.SetPosition(marker.GetPositionX(), marker.GetPositionY(), marker.GetPositionZ())
    else 
        if(npc == None)
            Debug.Trace(THIS_FILE + " **ERROR** npc param is EMPTY: " + logInfo)
        else
            Debug.Trace(THIS_FILE + " **ERROR** marker param is EMPTY: " + logInfo)
        endif
    endif
endFunction




