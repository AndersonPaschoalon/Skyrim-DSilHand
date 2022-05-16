# Vanilla Object Changes

This document enumerates the changes on the Vanilla Pluings.

## Actor LvlSilverhandMelee2H

* Location: `Actors > Actor > LvlSilverhandMelee2H`

* Change Description: option `Template Data > Use Script` UNCHECKED

## Actor LvlSilverhandBoss

* Location: `Actors > Actor > LvlSilverhandBoss`

* Change Description: option `Template Data > Use Script` UNCHECKED

## (Faction) SilverHandFaction 

* Location: `Character > Faction > SilverHandFaction` 

* Change Description: On `General > Interfaction Relations` the "PlayerFaction" was changed from "Enemy" to "Friend".

## (Quest) C00

* Location: `Character > Quest > Faction > Companions> Story > C00` 

* Change Description:
    - Objective 90 added
    - Stage 90 added 
        - added script "DSilHand_M10SilverHunt.SetStage(100)"
    - Script modified:
    - QF_C00_0004B2D9

## (Location) GallowsRockLocation

* Location: `WorldData > Location > TamrielLocation > EastmarchHoldLocation > GallowsRockLocation`

* Change Description: On Gallows Rock Location editor, in the section "Keywords" the keyword "LocTypeBanditCamp" was removed. That's because the fort "Gallows Rock" should not be a target of "Bnadit Bounty"  quests. It was not necessary to remove this keyword from Driftsahde, because it is not present on ints Location object. 


