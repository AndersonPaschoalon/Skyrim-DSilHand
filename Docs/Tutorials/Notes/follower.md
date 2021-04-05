## Follower build hints

### NPC: Traits
- Voice type: selecionar template correspondente a raça, ou criar o seu.
- Encontrar voyce types em `Miscelaneos > FormList`

### NPC: Factions

Buscar por faction "Follower". Selecionar as seguintes facções: 
- `CurrentFollowerFaction` e setar rank em -1, pressionando `F2`
- `PotentialFollowerFaction`   
- Assigment Crime faction: em qual hold crimes contra o NPC serão contabilizados 


### NPC: Relationship
- É necessário que a opção [x]UNIQUE esteja selecionada
- Criar uma nova "Relationship":
    -  Parente NPC: selecionar o NPC sendo criado
    -  Child: Player
    -  Relationship level: ally

### NPC: AI Data
- Agression: Unnagressive
- Mood: expressões faciais
- Energy: qual a disposição para interagir com o mundo. 
    - 50: default
    - 0: nenhuma energia
    - 100: muita energia
- Morality: se o NPC aceita cometer crimes
- Combat Style: como o NPC ira lutar. Pode ser criado em `Miscelaneous>CombatStyle`


### NPC: Inventory

- LV Item: escala a qualidade do item de acordo com o LV do npc

### SpellList

- Perks recomendados
    - LightFoot: faz com que o NPC não ative traps no jogo
    - Spell: atenção na quantidade de magia


### Exportar texturas da face do NPC

Selecionar o NPC no object windows e pressionar "CTRL-f4". Selecionar "YES" para exportar "face gendata".


### AI Packages

- defaultsandbox: o NPC ira interagir com o mundo no modo default. um bom é "DefaultSandboxCurrentLocation1024"


### Quest

- criar uma quest
- estagios: 0, 10, 20
- dialogues: 
    - Player: Follow me
    - NPC: Ill Follow you
    - habilitar este dialogo somente com o NPC, e quando o estagio da quest for zeo: GetState()  == 0
    - assim que o NPC concordar, setar o estagio da quest para 20: GetOwningQuest().SetStage(20), no TIF End.
    - utilizar também "npc.setPlayerTeamMate(true)"
    - é possivel utilizar "akaspeaker.openInventory()" para ele abrir o inventario apra vc


### AI Package: 
- Crair um AI Package usando um template: `FollowerPackageTemplate` ou `FollowePlayer`. Segundo o tutorial, é preferivel o segundo pois o primeiro resulta em conflitos com mods de followers
- Adicionar uma condição no Pacote com getStage para a quest de setup, colocando o getStage() == 20.


### Quest

- Adicionar um dialogo para deixar de seguir 
    - Player: Go home
    - NPC: I'll go home
- Você não consegue setar a quest em um lvl mais baixo, é necessario executar:
    - GertOwningQuest().Reset()
    - Utilizar também 




