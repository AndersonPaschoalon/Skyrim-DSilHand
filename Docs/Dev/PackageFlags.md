## Summary

Package Flags are used to control AI behavior that is common to all packages. For the most part they toggle on or off various components of behavior.

Note: when designing custom packages, or package templates, each procedure can override these package flags.

## Flags

- Must Complete: Package will not terminate until it "completes," regardless of conditions changing, or schedule settings.

- Once Per Day: Package will not run again in the same day. A day is defined as a 24 hour block beginning when the package was first selected by the actor. This is useful to make sure that a package is not immediately selected again after being completed, even though the conditions might select it.

- Always Sneak: Actor always sneaks during this package.

- Allow Swimming: Actors will not swim to reach destinations unless this flag is unset.

- Allow Idle Chatter: Allow idle chatter using the IdleChatter topic.

- Ignore Combat: Actors will not fight or flee while in combat... but for all other purposes (condition functions, script functions, etc.) the actor is still considered to be "in combat"

- No Combat Alert: Actors will not go through the alert state before combat. They will jump immediately into combat once they completely detect an enemy.

- Weapon Drawn: Actor will have weapon out during package.

- Weapons Unequipped: The actor will not show any visible weapon while running this package, even if he has one equipped.

- Wear Sleep Outfit (OBSOLETE): If actor has a sleep outfit, he will wear this during the package. (Note: this functionality was removed from the final game)

- Maintain Speed at Goal: Normally an actor slows down before arriving at his travel destination, this overrides that behavior. (Used infrequently, for example when breadcrumbing using multiple travel procedures so that the NPC doesn't appear to stop, start, stop, start his movement)

- Preferred Speed: Has a drop down for walking, jogging, running, etc. The NPC will try to maintain this speed throughout the package.

- Hellos to player: Allow the actor to say hello to the player (the dialogue said when the player nears the actor)

- Random conversations: Allow the actor to participate in random conversations. (The packages that can initiate random conversations are Sandbox, Guard, Eat, and Patrol.) See also: Random Conversations

- Observe combat behavior: Allow the actor to do "observe combat" behavior when near combat that he is not part of.

- Reaction to player actions: Allow the actor to use default dialogue topics to react to player actions like swinging a weapon, or nocking things over (see Topics Tab).

- Friendly fire comments: Allow the actor to use the Hit combat topic to react to friendly fire.

- Aggro Radius Behavior: Allow aggro radius behavior (if any).

- World Interactions: sets a flag that controls the return value of the "AllowWorldInteractions" condition function. Will return true if the actor is running a package that has this flag checked on.


## Flag overrides at the procedure tree level

When a package is running, the values of its package flags can be modified by overrides on procedures (or simultaneous procedure tree nodes).

Whenever package execution starts up a new procedure (or, again, a new simultaneous node; see below) we the package flags to their base values (on the package itself) and then apply the overrides for the new procedure.

We allow overrides on either procedure nodes or simultaneous nodes – but only those which are not inside another simultaneous node. The point of this is to ensure that there's only one relevant override for any part of the tree, and that all simultaneous node siblings use the same overrides. This prevents us from having to deal with potentially conflicting flag overrides and how they should combine.

## Door Flags

These flags are deprecated in favor of the LockDoors and UnlockDoors procedures so that they can occur at specific points along the procedure tree. For example, the Sleep package template has actors locking doors after they travel to their sleep location, so if they are outside their house, they don't lock the doors until they arrive.