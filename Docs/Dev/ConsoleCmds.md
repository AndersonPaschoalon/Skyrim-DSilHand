# Usefull Console Commands

## Toggle Commands

<pre><b>
tcl
</b></pre>
You can toggle Collision using this command. Using the TCL command with a target toggles clipping for the target. If used while falling off a cliff, may cause a crash. Useful for relocating the Dragonborn or finding items or bodies that have fallen through a wall or floor.

<pre><b>
tdetect
</b></pre>
tdetect	This will toggle AI Detection. Does not work with Pickpocket detection.

<pre><b>
tgm	
</b></pre>
This will toggle God Mode (Grants infinite health, magicka, and stamina. Carry weight will never affect movement or fast travel.)

<pre><b>
tmm {#}	
</b></pre>
Toggle Map Markers; 0: Disable all. 1: Enable all. 1,0,1: Show all, no fast travel.


## Targeted Commands

<pre><b>
additem {ItemID} {#}	
</b></pre>
Adds {ItemID} to target NPC, Note: Use on a merchant to set the amount of barter gold. This gold will not go to the Dragonborn’s inventory when selling items to the vendor if the additem causes the vendor’s gold to exceed 32,767, the maximum positive number that can be stored in an int variable in C. To avoid this, increment by 32,700 less the merchant’s current gold, sell items and repeat as needed. If it does go over, using additem with a negative number can fix this, for example, “additem f -10000”

* Add one Gold: `player.additem 0000000f 1`

* Add one Lockpick: `player.additem 0000000a 1` 

<pre><b>
moveto player	
</b></pre>
Teleports the targeted NPC to the Dragonborn. (Works similar to player.placeatme <BaseID> <#> but does not create a new reference of the base object.)


## Quest Commands

<pre><b>
getstage <QuestID>	
</b></pre>
Used to get the current quest stage for quest (use ShowQuestTargets for IDs).

<pre><b>
SetObjectiveCompleted {QuestID} {stage} 
</b></pre>
Used to set the quest stage as being completed or uncompleted. <stage>: 1 to set, 0 to unset.

<pre><b>
sqv {questID}	
</b></pre>
Displays a list of all variables used by <quest id>.


## Player Commands

<pre><b>
player.additem {ItemID} {#}
</b></pre>
Add an item to the inventory. For example, to add 100 gold to the inventory, use player.additem f 100

<pre><b>
player.moveto {NPCrefID}	
</b></pre>

Move to an NPC. Note that if the NPC is dead, the Dragonborn will be moved to the Dead Body Cleanup Cell where the NPC can be resurrected using the console command, but will need to use the coc command to return.


