Scriptname Sandbox_SetAiToNpc_AliasActor04 extends ReferenceAlias  

ObjectReference Property Barrel  Auto  

Package Property Sandbox_AiPkgTest  Auto  

Actor Property Actor04  Auto  

ReferenceAlias Property refSandbox_AiPkgTest  Auto  

ReferenceAlias Property aliasActor04  Auto  

Faction Property Sandbox_DustmansCairnExploration  Auto  

Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("Test  BarrelSetAiPkg Actor04")
    if(GetOwningQuest().GetStage() == 20)
        Debug.MessageBox("Test  BarrelSetAiPkg STAGE 20")
        Actor04.AddToFaction(Sandbox_DustmansCairnExploration)
        Actor04.SetFactionRank(Sandbox_DustmansCairnExploration, 1)
        Actor04.EvaluatePackage()
    endif
endEvent





