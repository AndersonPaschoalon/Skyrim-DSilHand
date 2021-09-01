# Idle Animations Preview

* [(YouTube) Simple and Useful Skyrim Idles](https://www.youtube.com/watch?v=GJJXJJpmK0w)


# Simple guide to activate player idle animations. (PC, No Mods Needed)

Use a macro program to assign this string of letters with a minimum of 7ms delay between each to your desired macro button:

```
playidle idlebook_reading
```

Do not include the content in the curly brackets, they simply denote the start and end of the command. Same goes with the “[enter key]” which simply denotes that the enter key must be pressed. These are dividers and are not necessary and will cause the command to not work. And you WILL need to press shift and hold while adding the underscore.

While the command is being typed after you use your hotkey, you need to click on your character and a hex code “00000014” should appear which denotes your character ID. You need to do this at least once or the animation command will execute, but won’t target your character. Resulting in nothing happening. There is a list of other idle animations you can put in place. But do keep in mind some have certain specifications and if not met can have some harmful, do nothing, or have utterly hilarious results. I hope this helps any of you out there!

Edit: here’s the list of all the animations I could find!

idlepointfar_02 - character holds their arm out and points into the distance.

idlepickup_ground - character bends down and picks up a non-existant object

idlesilentbow - character bows like the Graybeards

idlestudy - character acts as if they are observing something closely

idletake - character reaches out as if they are being given something by someone

idlewave - character waves in a friendly manner

idlesurrender - character holds their hands up as if they are surrendering

idlesearchbody - character bends down and motions as if they are inspecting a body

idleritualskull1 - character motions as if performing a ritual

idleritualskull2 - see above

idleritualskull3 - see above

idlelookfar - character holds their hand to their brow and surveys the area

idledrink - character retrieves a tankard and drinks from it

idledialoguedefensivehandgesture - character holds hands in a defensive manner

idledialoguehandonchingesture - character places their hand on their chin as if in thought

idledialoguewelcomegesture - character opens their arms welcomingly

idlesalute - character salutes like a Legionnaire (one of my personal favorites)

idleexamine - character leans forward as if examining a table

idlegive - character holds their arm out as if giving someone something

idlecivilwarcheer - character will wave their fists as if cheering

idlegetattention - character will jump and wave their arms as if trying to get someone's attention

idlenoteread - character will retrieve a note and begin reading it while standing

idleoffsetarmscrossedstart - character will cross their arms until moving or drawing their weapon

idleblowhornimperial - character retrieves a war horn and blows into it, complete with sound effects

idlebook_reading - character will retrieve a book and begin reading it while standing

idlebowheadatgrave_01 - character places their hands before them and bows their head

idlebowheadatgrave_02 - character places their hands behind them and bows their head

The next few commands are different from the others in terms of their circumstances and effects:

idlecleansword - character holds equipped sword and cleans it with their hand, must be initiated while a one-handed weapon is equipped to the right hand and sheathed (preferably a one-handed sword) with a free left hand

idlecivilwarshieldcheer - character pounds equipped shield with equipped one-handed weapon, complete with sound effects, must be initiated whilst a shield is equippped and a one-handed weapon is drawn

idlehandcut - character kneels down before retrieving an iron dagger and cutting their hand, initiates a mini-cutscene with the camera but the tfc command will still work

This final idle is actually a combination of two linked idle commands. One must be initiated first and the command console closed before re-opening the console and then initiating the second whilst the first is still going.

idlewriteledgerenter - character retrieves a handheld ledger and quill and stands there

idlewriteledgerwrite - character glances down at the held ledger and writes something using the quill
