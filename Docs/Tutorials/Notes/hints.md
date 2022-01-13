## Logs
Para habilitar os logs, devemos ir para o diretório "My Documents / My Games / Skyrim" e abrir o arquivo Skyrim.ini.
Olhar para a sessão [Papyrus], e setar as seguintes variáveis:

```
[Papyrus]
bEnableLogging=1
bEnableTrace=1
bLoadDebugInformation = 1
```

Em seguida criar um novo arquivo (caso não exista), chamado "SkyrimCustom.ini", e fazer o mesmo:

```
[Papyrus]
bEnableLogging=1
bEnableTrace=1
bLoadDebugInformation = 1
```

Rodando o jogo, os logs devem começar a aparecer em:

```
My Documents / My Games / Skyrim / Logs / Script
```

## Objetos 

* Escala de objetos: Nunca usar uma escala maior que 1.5 e menor que 0.5 para não causar degradação nas texturas. 


* Como subir o estagio da quest
```
; inicialmente no estagio 0
GetOwningQuest().SetObjectiveDisplayed(10)
GetOwningQuest().SetStage(10)
```


## Notas

Items para fazer animação de absorção de dragão:

Objeto  MQ105TombActivator
ID do Activator -> WindCallerTomb

Scriptname MQ105TombScript extends ObjectReference  

import utility
import game

Event OnActivate(ObjectReference akActionRef)
	; if player activates after MQ105 is done, make horn magically reappear and reward player
	if akActionRef == Game.GetPlayer() && !gaveSoul && MQ105.GetStageDone(240)
			GetLinkedRef().Enable(true)
			; give soul, once
			gaveSoul = true

				; effects
				DragonAbsorbEffect.Play(self, 8, GetPlayer())
				DragonAbsorbManEffect.Play(GetPlayer(), 8, self)
				; Sounds for when the wispy particles being to fly at the player.
				NPCDragonDeathSequenceWind.play(self) 
				NPCDragonDeathSequenceExplosion.play(self) 
	
				wait(0.1)
		
				; On man power absorb effect shader.
				DragonPowerAbsorbFXS.Play(GetPlayer())
	
				wait(4)
				;Stop fx shader on player showing power absorb.	
				DragonPowerAbsorbFXS.Stop(GetPlayer())
				Game.GetPlayer().modActorValue("dragonsouls", 1)
	
				wait(4)
	
				; Get rid of art attached to dragon and player showing streaming magic.
				DragonAbsorbEffect.Stop(self)
				DragonAbsorbManEffect.Stop(GetPlayer())

	endif
endEvent

MiscObject Property Horn  Auto  

bool gaveSoul ; give 1 dragonsoul when you put horn back

; absorb effects:
VisualEffect Property DragonAbsorbEffect Auto
VisualEffect Property DragonAbsorbManEffect Auto
sound property NPCDragonDeathSequenceWind auto
sound property NPCDragonDeathSequenceExplosion auto
EffectShader Property DragonPowerAbsorbFXS Auto


Quest Property MQ105  Auto  




DragonAbsorbEffect -> VisualEffect MagDragonPowerAbsorbEffect
DragonAbsorbManEffect -> VisualEffect MAGDraonPowerAbsorbManEffect
DragonPowerAbsorbFXS -> EffectShader DragonPowerAbsorbFXS
NPCDragonDeathSequenceExposion -> Sound NPCDragonSeathSequenceExposion
NPCDragonDeathSequenceWind -> Sound NPCDragonDeathSequenceWind

<<<<<<<<<<<<<<<<<<<<


