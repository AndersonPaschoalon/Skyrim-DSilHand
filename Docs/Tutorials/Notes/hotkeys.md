# Creation Kit

## Manipular objetos no creation kit

|Key        | Descrição 
|-----------|---------------------
|T          | Visão Top-Down  
|A          |   Ascende/Apagar Luz 
|E          |  eixos x/y/z
|Ctrl D     | Duplicar Objeto   
|F          | Objeto vai até o chão
|Ctrl F     | Search and replace object   
|11         | Esconde objetos selecionados 
|Alt 1      | traz de volta objetos selecionados  
| 0          |   Visão ortografica


## Célula 

Salão pequeno Nordico
Static > Dungeons > Nordic > SmRooms > NorRmSm[...]


|Key    | Descrição 
|-------|---------------------
|F2     | Renomear uma Célula   
|       | 
|       |   

## NavMesh

w:  Navegar entre os modos de visualização da navmesh


##  Caminhos para Items

Caminho para Quests 
	Character > Quest
Caminhos para Triggers

Caminho para XMarkers


##  Items

WorldObjects > Furniture
TreasDraugrChest    Chest

ImpTowerInHallDoor
ImpHallWay01
CoCMarkerHeading
ImpDoorSingleLoad01
ImpFreeDoor
NorRmSmWallSideExSm01 	-> Saida de ruina nordica
NorDoorSmLoad02		-> 
COCMarkerHeading

# Skyrim Console

## Comandos de Console Uteis

* Page Up and Page Down keys can be used to scroll up or down the Console gui

|Command                              | Description 
|-------------------------------------|---------------------
| `tim`                               | Modo imortal, nenhum dano
|`tmg`                                |    God mode, status infinitos
|`getstage <quest ID>`                | returns the current stage of the quest
|`movetoqt <quest ID>`                | moves you to the location of the current target of the quest, eg. where the map marker is pointing.
|`setstage <quest ID> <stage #>`      | manually sets the stage of a quest. Won't help much if the quest hasn't yet begun.
|`sqs <quest ID>`                     | Shows quest stages in a quest and if a stage has been achieved.
|`sqo`                                | Shows a human friendly list of active and completed quest objectives for currently active quests.
|`resetquest <questid>`               | Sets all quest stages in a quest to 0.
|`coc <cell ID>`                      | teleports the player to the cell specified.
|`player.moveto <reference ID>`       | teleports the player to the reference specified, eg. an NPC or unique item.
| `ShowQuestAliases <quest ID>`       | Show quest aliases


# Papyrus Compiler 

## Settings
This extension contributes the following settings to the VS Code editor. Add these to your user or workspace settings.

 - papyrus.fo4.directory Specifies the path to Fallout 4's installation folder.
 - papyrus.fo4.compiler.directory Specifies the path to the Papyrus Compiler, supports relative pathing from the game directory.
 - papyrus.fo4.compiler.output Specifies the path for compiled scripts, supports relative pathing from the game directory.
 - papyrus.fo4.compiler.target Specifies a file to be compiled with the Papyrus: Compile Target command, supports relative pathing from the game directory.
 - papyrus.fo4.compiler.asm Specify the Papyrus Compiler assembly mode. None disables all output, Only only generates Papyrus assembly, not compiled .pex, Discard generates .pex and deletes assembly, and Keep generates and keeps both .pex and assembly.
 - papyrus.fo4.compiler.imports Specifies a list of import folders for the Papyrus Compiler, supports relative pathing from the game directory. Script files located in import directories listed first will overwrite scripts of the same name in other directories.

## Commands
This extension contributes the following commands to the VS Code editor. Execute these through the command palette.

 - Papyrus: Compile (Debug): The default keyboard mapping is Ctrl+B
 - Papyrus: Compile (Release)
 - Papyrus: Compile (Release Final)
 - Papyrus: Compile File
 - Papyrus: Compile Folder
 - Papyrus: Compile Target: The default keyboard mapping is Ctrl+Shift+B
 - Papyrus: Create Project

