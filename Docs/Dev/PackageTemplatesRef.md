# Package Templates and Procedures Reference

https://www.creationkit.com/index.php?title=Category:Package_Templates

- Acquire (Procedure)
- Activate (Procedure)

- Default Master Package

 - Eat (Procedure)
 - Escort (Procedure)

 - Find (Procedure)
 - Flee (Procedure)
 - FlightGrab (Procedure)
 - Follow (Procedure)
 - FollowTo (Procedure)
 - ForceGreet (Package Template)
 - ForceGreet (Procedure)

 - Guard (Procedure)

 - HoldPosition (Procedure)
 - Hover (Procedure)

 - KeepAnEyeOn (Procedure)

 - LockDoors (Procedure)

 - Orbit (Procedure)

 - Package Flags
 - Patrol (Procedure)

 - Sandbox (Procedure)
 - Say (Procedure)
 - Shout (Procedure)
 - Sit (Procedure)
 - Sleep (Procedure)

 - Travel (Procedure)

 - UnlockDoors (Procedure)
 - UseIdleMarker (Procedure)
 - UseMagic (Procedure)
 - UseWeapon (Procedure)

 - Wait (Procedure)
 - Wander (Procedure)

## Acquire (Procedure)

### Behavior

- Description:
The actor will move to a specified item, then pick that item up and add it to their inventory.

- The procedure completes:
When the actor adds enough of the target item(s) to his inventory

### Parameters
- Target (Target): What to acquire (usually an ObjectList filled by a Find procedure)
- NumToAcquire (Int): How many to acquire
- AllowStealing (Bool): Is the actor allowed to consider acquiring target if it is owned by someone else?
- AllowPickpocket (Bool): Is the actor allowed to consider acquiring target if it is in another actor's inventory via pickpocketing?
- AllowKilling (Bool): Is the actor allowed to consider acquiring target if it is in another actor's inventory via killing him to get it?
                             

Notes
- What happens if the item disappears (like if the player picks it up)?
    - If they're picking from an ObjectList, they'll try to acquire the next valid object in the list. If that doesn't work, they stop trying to Acquire an item, and the procedure fails.
- How close does an actor have to be to pick up an item?
    - Currently it has to be “at” the reference it’s picking up; this uses the gamesetting iAIDistanceRadiusMinLocation which is the default radius for turning a target into a location.

## Activate (Procedure)

### Behavior

- Description:
Actors walks to target and activates it.

- The procedure completes:
When the actor activates the target.

### Parameters

- Target (Target): What object to activate (usually a SingleRef or a LinkedRef)
- NumToActivate (Int): How many times to activate (??? or if given an object list, how many objects to activate ???)
                                   
# Notes

- If this package orders an actor to activate a door (to open it), the actor will not travel to the front of the door like one would expect. Instead, the actor will travel to the object's pivot point (the yellow axis you see on all reference pieces in the Render Window). This not only looks odd, but it presents a pathing problem if the door is positioned in a tight space as the door will swing in such a way as to trap the actor behind it.

- If this package orders an actor to activate a furniture, then the furniture will be reserved for that actor, and other actors may not be able to use it. Reportedly, if the actor is killed while carrying out this procedure and before they actually complete it (i.e. before they use the furniture), the furniture will remain reserved and unusable. An acceptable workaround is to use a Travel package to bring your NPC within activation range of the Furniture, and then run an Activate package. This method may allow other NPCs to snatch the Furniture out from under you, but it prevents indefinite reservations if your NPC dies.

    - Known events that will release a dead NPC's reservation:
        - Enabling and disabling the reserving NPC
        - The player using the furniture themselves
        - The player using the Wait function


## Eat (Procedure)

### Behavior
Description:
Actor eats food.

### Parameters
- FoodType (TargetSelector): What type of food to eat
- CreateFakeFood (Bool): Can the actor "create" food even if he has none in his inventory? (usually TRUE)


## Escort (Procedure)

### Behavior

### Description

Escorting actor walks towards destination if following actor is within appropriate distance.
- If the escorted actors fall too far behind, the escorting actor will stop and turn to face one of them.
- If the escorting actors get too far ahead, the escorted actor will run to catch up to them.

If the player:
- Lead the player towards a destination

If another actor:
- Place a special Follow package on another NPC, overriding their normal packages. They then lead their follower to a specified location.

The procedure completes:
- When the escorting actor reaches the destination

### Parameters

- EscortedActor(s) (Target): Specifies an actor that get a special follow package (if PlayerRef, does not get follow package). Can take an object list with multiple actors.

- NumberToEscort (Int): Specifies how many actors (if using an ObjectList) should follow.

- Destination (Location): Specifies where to walk to.

- EscortWaitDist (Float): Specifies the closest that the following actor should be to the target. If too close, the follower will not walk.

- FollowMinDist (Float): Specifies the furthest that the following actor should be from the target. If too far away, the follower will begin running.

- FollowMaxDist (Float): Specifies the furthest that the following actor should be from the target. If too far away, the follower will begin running to "catch up."

- RideHorseIfPossible (Bool): Indicates that the actor should ride a horse if one is available. Default is false.

- PreferPreferredPath (Bool): Indicates that the actor should prefer navmesh triangles tagged as "preferred path". Default is true.

- RunIfBehindDist (Float): If any of the escorted actors are ahead (along the path to the goal) by more than this many units, the escorter will run to catch up to them. Default is 250.0.

### Notes

There appears to be an issue with this procedure, when the player travels through a load door while the procedure is going. Upon return, the procedure breaks, and the 2 actors will be in different spots, or one of them is missing. Take care when using this procedure.

## Find (Procedure)

### Behavior

Description:
Allows an actor to mentally search a location for a specified object or type of object.
- The actor will do a mental search at the specified Location.
- If the actor finds valid objects, it will fill the object list with those objects.

The procedure completes:
- This procedure does NOT complete. (Usually paired with a simultaneous Wait Procedure)

### Parameters

- SearchLocation (Location): Specifies a location (usually a reference + radius) to mentally search.

- TargetSelector (TargetSelector): Specifies what the actor should be looking for. This could be a specific reference, a specific type of base object, or something more general like "food", a "weapon" or "ammo."

- ObjectList (ObjectList): This list is ***populated*** when the Find procedure is successful. It is a list of all things that the Find procedure found. This can later be used by another procedure, such as "Acquire" in order to pick up the object that was found in the search location. (Usually this is hooked up to private data and fed to a "target" parameter of another procedure like Acquire, Eat, Sit, etc.)

- SearchOwnerInventory (Bool): Can the actor find things he has in his own inventory. (Usually true)

- RandomizeList (Bool): Found things are deterministically found. This randomizes the object list.

### Notes

- Does this procedure have a defined ending?
    - Yes, when the actor has found something that matches an object defined by the Target Selector. If the procedure doesn't find anything, it will not end on its own. (You would want to pair this procedure with a Wait or some other procedure in a simultaneous branch.)

- How many objects will this procedure find?

    - It should fill the Object List with all of the valid objects that exist in the location.

- Will the procedure find references/items that the actor does not own?

    - It will skip any owned furniture that the actor does not own. It will include owned items that the actor does not own, but will flag them internally as requiring stealing. Other procedures will automatically take that data into account -- for instance, Acquire has an "Allow Stealing" parameter.

- Does this procedure cause the actor to do any physical behavior?

    - No, the procedure is purely mental. It is only there to populate the object list.

- Does the actor have to be at the search location?
    - No.

- Does the search location have to be in the loaded area?

    - No, but if the search location is unloaded, the procedure will most likely find nothing and keep running (periodically rechecking).

    - The procedure can still find objects within unloaded Cells if they are persistent. This will apply to references that are referenced by a Package, Quest, or anything else that is persisted.


## Flee (Procedure)

### Behavior

Description:
Makes an actor run away from a target (or toward a location) while acting in a frantic manner -- playing lines of dialogue and animations that indicate panic. It is effectively two separate but closely-related procedures ("FleeFrom" and "FleeTo") bound into one.

### Parameters

- FleeFrom (Target): Specifies the target from which to flee. NOTE: this is ignored (in favor of the FleeTo parameter) if UseDynamicGoalInstead is false.

- FleeTo (Location): Specifies a fixed location from which to flee. NOTE: this is ignored (in favor of the FleeFrom parameter) if UseDynamicGoalInstead is true.

- UseDynamicGoalInstead (Bool): If true, we use FleeFrom and ignore FleeTo. If false, we use FleeTo and ignore FleeFrom.

- GoalRadius (Float): This applies only if we're doing a FleeTo. We use this as the goal radius for the destination. (This makes it easier to use a Ref or ObjectList as a destination. If the destination is actually a Location, its radius will be ignored in favor of this radius.)

- AvoidNodeRadius (Float): This applies regardless of whether we're doing a FleeFrom and FleeTo. This is how far the path planner tries to keep the path from all threat(s). This doesn't matter too much in the usual case (where we are running directly away from all threats) but sometimes the only way to get far enough from all threats is to run "toward" (but still around) one or more of them. Even in a single-threat situation, we might be caught in a dead-end alley or a room with only one door; in such cases the only way to get far enough from the threat might be to run toward it, but we still want the path to keep at least this far away from it.

- FleeDist (Float): If we're doing a FleeFrom, procedure is complete when the actor is at least this distance away from all threats.

- RideHorseIfPossible (Bool): If true, and if the actor has been assigned a horse (via data on his ref) then the actor will mount that horse prior to fleeing. Additional conditions might eventually be added to the definition of "if possible" (e.g. "if the horse is nearby" perhaps).

- ForgetDeadThreats (Bool): Don't run away from things that are dead. (Usually true)

- Quiet (Bool): If true, don't say "flee dialogue" lines.

- CountAsIsFleeing (Bool): Treat actor as if actually fleeing (as in combat), which prevents the player from being able to activate the actor.

### Notes

- Does this procedure have a defined ending?

    - Yes. It depends on the value of UseDynamicGoalInstead.

        - If UseDynamicGoalInstead is true, it ends successfully when the actor is either at least FleeDist units away from the FleeFrom target(s), or when there are no more FleeFrom targets (due to being dead/disabled/etc.).

        - If UseDynamicGoalInstead is false, it ends successfully when the actor is withing GoalDist units of the FleeTo target.

- How does this procedure deal with multiple targets?

    - If an ObjectList is passed into the FleeFrom parameter, the actor will be aware of all targets in the list as threats, and will continue fleeing until each threat is farther than FleeDist away.


## FlightGrab (Procedure)

(NO DESCRIPTION)


## Follow (Procedure)

### Behavior

Description:

Allows an actor to follow another actor or the player until the package is no longer valid.

- Follower runs toward target until within max distance.

- Follower tries to keep pace with target.
Actors following the player will sprint, under two circumstances:

    - If the player is sprinting.

    - If they are more than fFollowStartSprintDistance units from the player (initially set to 300).

The procedure completes:

Procedure does not end unless conditionalized out, or paired with a procedure that ends in a simultaneous branch.

### Parameters

- Target (Target): Specifies an actor to follow.

- MinRadius (Float): Specifies the closest that the following actor should be to the target. If too close, the follower will not walk.

- MaxRadius (Float): Specifies the furthest that the following actor should be from the target. If too far away, the follower will begin running.

- GoToLeadersGoal (Bool): If following an NPC, will try to walk toward it, simulating an approximation of "walking with" rather than "following behind."
RideHorseIfPossible (Bool): If true, will ride a horse if possible.

- NeedLOS (Bool): If true, actor will only follow if has Line of Sight to the target.

### Notes

- If the follow target dies or is dead, the procedure is considered invalid and does not run.

- The follower tries to move at the same speed as the target, but will begin to run after the target if they're too far away.

- The follower sneaks if the target is sneaking.

- Once pathing code can supply a pathing distance again, a follower should use this method rather than a raw distance check.

## FollowTo (Procedure)

### Behavior

Description:
The Follow To Procedure is nearly identical to the Follow Procedure but it has a defined "Destination" end point where Actors will stop following.

The procedure completes: When the actor arrives at the EndLocation

### Parameters

- Target (Target): Specifies an actor to follow.

- EndLocation (Location): The procedure is considered "done" when the actor gets to the specified location.

- MinRadius (Float): Specifies the closest that the following actor should be to the target. If too close, the follower will not walk.

- MaxRadius (Float): Specifies the furthest that the following actor should be from the target. If too far away, the follower will begin running.

- GoToLeadersGoal (Bool): If following an NPC, will try to walk toward it, simulating an approximation of "walking with" rather than "following behind."

- RideHorseIfPossible (Bool): If true, will ride a horse if possible.

- NeedLOS (Bool): If true, actor will only follow if has Line of Sight to the target.


## ForceGreet (Package Template)

### Summary

The ForceGreet package template is used to get actors to a location to wait for the player to arrive at some other location (trigger location), and then walk up to the player and initiate dialogue.

It makes use of the following procedures:

- ForceGreet - used to get the actor to initiate dialogue

- Travel - used to get the actor to walk to the location he waits at, and to walk to the player

- Sandbox - used to get the actor to "do stuff while he waits" for the player to arrive at the trigger location
Public Data

### Public Data

- Topic - the topic that the NPC initiates dialogue with

- NPC Wait Location - where the NPC waits for the player to arrive (he will sandbox here while waiting)

- Trigger Location - when the player gets here, the NPC will walk up to the player and initiate dialogue

- Forcegreet Distance - MUST BE the PlayerRef, only change the Radius value - how close the actor will walk to the player before initiating dialogue

- Player must be detected - only forcegreet if the player is detected

- Greet Using Preferred Path - NPC will path to player only using the preferred path

- Forcegreet if player on horseback - If false, actor will not forcegreet if the player is on a horse

- Sandbox while waiting - if true (usually is) the actor will sandbox while at the "NPC Wait Location"

- Allow XXX - the various parameters for the Sandbox Procedure


## ForceGreet (Procedure)

### Behavior

Description:
Used to get NPCs to engage in a specific conversation with the player

The procedure completes:
After the actor says the line and exits dialogue with the player.


### Parameters

- Topic (Topic): Points to the topic that the actor will say

- NPCWaitLocation (Location): Where the NPC will wait for the player to enter the 

- TargetTriggerLocation
TargetTriggerLocation (Location): Where the player must be to trigger the actor to start dialogue
                          

### Notes

- The ForceGreet package template handles all the details about getting the actor to walk up to the player, etc.

- For a topic with more than 4 lines, testing showed that the ForceGreet procedure does not seem to enter conversation with the player, and acts like a Say procedure where the actor follows the player.

- It is recommended that a topic with many lines that is the subject of a ForceGreet procedure is split into multiple topics, with the initial one having few lines and being linked by invisible continuation to the rest.


 ## Guard (Procedure)

### Behavior

Description:
Actor will draw weapon and say tresspassing dialogue, after a few warnings will attack. (It will not cause the actor to pursue the warned actor [usually player] if combat does not start)

### Parameters

- RestrictedArea (Location): Location that the actor is guarding

- SuspiciousOf (TargetSelector): If a faction, the faction that the guard will guard against, if an Actor Ref, the actor the guard will guard against. (Usually the PlayerFaction)

- WarnOnlyRadius (Float): If an actor who qualifies for the "SuspiciousOf" parm gets within this distance of the RestrictedArea, this actor will say warning dialogue.

- ImmediateAttackRadius (Float): If an actor who qualifies for the "SuspiciousOf" parm gets within this distance of the RestrictedArea, this actor will immediately attack.


### Notes

Exceptions to the warning/attacking behavior are:

- Owners (or faction owners) of the guarded reference.

- Allies/Friends of the guarding actor.

Game Settings

- FAITrespassWarningTimer

    - Description: Dictates the time between warnings on a Trespass Package or Guard Package. 
    - Default value: 5.0000 

- iGuardWarnings

    - Descriptio: Dictates the maximum number of warnings an NPC on a Guard Package will give another actor.
    - Default value: 2

 ## HoldPosition (Procedure)

### Behavior

Description:
Instructs the actor where he is allowed to go in combat. Used exclusively as a Combat Interrupt Override Package.

The procedure completes:
Does not complete.

### Parameters

- Location (Location): Location in which the actor will stay in combat. If the actor can not reach his target (usually because he doesn't have a ranged weapon) he will ignore this and pursue the target anyway.


## Hover (Procedure)

### Behavior

Description:
Essentially the "travel" in the air procedure for flying creatures.


### Parameters

- TargetLocation (Location): Location to fly to and hover over
- Height (Float): The height at which to hover, relative to the target.

 
## KeepAnEyeOn (Procedure)

### Behavior

Description:
Tells an NPC to maintain line of sight to a target (typically the player). If the line of sight is ever broken, it creates a "Pursue" interrupt package which makes the NPC start following the target

The procedure completes:
Does not complete. 

### Parameters

- TargetToObserve (Target): The Target to keep an eye on. Typically the player, but if this is an object list the NPC will consider each ref in it. (It can only Pursue one at a time, however.)

- ObservationArea (Location): The procedure only considers watching the target while the target is within this location. Likewise the pursuit interrupt will end if the target leaves this location.

- EndPursuitArea (Location): (optional) The Pursue interrupt will end if the target ENTERS this area. Using this correctly requires finesse! First, this location needs to be entirely contained within the ObservationArea. Second, it needs to represent a space that will be entirely visible to the NPC after it returns to running whatever other procedure it was running simultaneously with KeepAnEyeOn. This isn't a strict requirement, but if the NPC ends its Pursuit and then returns to a location from which it cannot see the target, it will simply reactivate the Pursuit, creating an obnoxious looping behavior.
                                 

### Notes

- KeepAnEyeOn is a "mental" procedure. (Most procedures, such as Travel, Patrol, or Sandbox, are "Physical," meaning that they cause the actor to take action in the world. A few procedures are "Mental," meaning that they just process information; these cause no direct action in the world. An actor can run one physical procedure simultaneously with any number of mental procedures.)

- Note that "line of sight" refers to 360-degree line of sight, which is blocked only if the raycasts are actually blocked by an obstacle. The NPC will not cteate the Pursue interrupt if the target is out of view only because the NPC is currently facing away it.


## LockDoors (Procedure)

### Behavior

Description:
Actor locks doors he owns in the location. (Happens "magically" - he does not path to the doors.)

The procedure completes:
When the doors are locked.

### Parameters

- Location (Location): Location with doors to lock.

- WarnBeforeLocking (Bool): If true, will warn the player to leave before locking the doors.
                                   
### Notes

- See also Locking and Unlocking Doors for how NPCs handle this automatically.
In previous games, this was a flag on packages, it is now a discreet procedure.

- Usually found in a package after running a Travel procedure to get them to the location - often used in packages of citizens to make sure they lock their doors at night.

## Orbit (Procedure)

### Behavior

Description:

Causes a flying actor to fly in circles around (and potentially above) the location.

The procedure completes:

After one complete revolution around the location. At that time, if no other procedures or packages take precedence, the actor will continue with another complete loop around the location.

### Parameters

- TargetLocation (Location): Location around which to orbit.

- InnerRadius (Float): Each circular path will get no closer (in horizontal distance) than this to the TargetLocation.

- OuterRadius (Float): Each circular path will get no farther (in horizontal distance) than this from the TargetLocation.

- Height (Float): Each circular path around the TargetLocation will be at this height above it. Useful for orbiting above a target location that has to be on the ground (such as a non-flying actor or a quest alias to a marker).
                               
### Notes

- Each time the actor completes one loop around the location, it will pick a new goal radius (between the specified inner and outer radii) and build a new circular path for the next loop.

- The height parameter exists to allow orbiting above a target location that has to be on the ground (for instance, because the location is based on a non-flying actor, or a quest alias). If the target location is based on a marker made specifically for this actor to orbit, then it is perfectly valid to use a height of 0 and simply place the marker itself in the air at the desired height.


## Patrol (Procedure)

### Behavior

Description:
Allows an actor to walk to a starting location, and then walk along a linked ref chain (link from starting point to another point, to another point, etc.).

- The actor will move within PointRadius distance of the specified PathStart reference (or to the nearest point -see "startAtNearestPoint" param).

- The actor will travel to each patrol point in succession.

- The patrol is considered "done" if the actor gets to the last point in the patrol, and the "repeatable" flag is not checked.

The procedure completes:
The patrol is considered "done" if the actor gets to the last point in the patrol, and the "repeatable" flag is not checked.

### Parameters

- PathStart (Target): Specifies where to walk to when starting the patrol. (Usually a reference or linked ref)

- PointRadius (Float): Specifies how close the actor must get to the starting point as well as each point along the patrol. It is recommended that this radius is greater than zero, as actors have difficulty standing exactly on a point. 32 is an acceptable small radius.

- Repeatable (Bool): If true, the actor will ping pong between the first and last points. This procedure would never be "done". If the flag is not true, then the patrol would go to the last point in the linked ref chain and then would be considered "done" upon arrival.

- StartAtNearestPoint (Bool): If true, the actor would go to the nearest point in the patrol and start from there. If it's not true, then the actor should travel to the beginning of the patrol and start from there.

- RideHorseIfPossible (Bool): If true, actor will ride horse if possible.

- StaticPathing (Bool): ???


### Notes

- Patrol points get a special Patrol Data tab in their reference window. This will specify how long an actor will stay at a patrol point.

- If a patrol point is an Idle Marker, the actor will do that idle animation, facing in the direction the marker is pointing.

- If a patrol point is an xMarkerHeading, they will face in the direction of the xMarkerHeading when they reach the patrol point.

- If a patrol point is a piece of furniture, they will currently not use the furniture.


## Sandbox (Procedure)

### Behavior

Description:
The Sandbox Procedure makes the actor look "active" by interacting with various things in his environment. It takes various parameters defining what activities it is allowed to perform while "sandboxing."

1. Procedures: The actor moves around within a specified location and interacts with furniture, idle markers, and other NPCs, looking purposeful and intelligent (or, at least, active and engaged with its environment).

2. Activities: If allowed to eat, it eats breakfast, lunch and dinner at times selected randomly from within an appropriate range of hours (specified by gamesettings). Likewise for sleeping, if allowed to sleep.

The procedure completes:
Never completes.


### Parameters

- Location (Location): Specifies the area that the actor will Sandbox within

- AllowEating (Bool): Specifies whether the actor is allowed to eat while Sandboxing

- AllowSleeping (Bool): Specifies whether the actor is allowed to sleep (in beds) while Sandboxing. (Occurs most often "at night")

- AllowConversation (Bool): Specifies if the actor should decide to talk to other actors while Sandboxing (see: Random Conversations)

- AllowIdleMarkers (Bool): Specifies whether the actor is allowed to use Idle Markers while Sandboxing.

- AllowFurniture (Bool): Specifies whether the actor is allowed to use furniture while Sandboxing.

- AllowSitting (Bool): Specifies whether the actor is allowed to use chairs (and other furniture whose markers are of type "Sit" or "Lean", but not "Sleep", and not furniture with the "Special" keyword) while Sandboxing.

- AllowWandering (Bool): Specifies whether the actor is allowed to aimlessly wander while Sandboxing. (Usually False)

- WanderPreferrefPath (Bool): If true, the actor will stay exclusively on preferred-path navmesh triangles when wandering.

- Energy (Float): Used in the formulas for how much time to spend on each type of sub-procedure. See "Procedure Duration Formulas" below.

- AllowSpecialFurniture (Bool): Specifies whether the actor is allowed to use furniture with the "Special" keyword (for instance: grindstones, forges, alchemy tables, arcane enchanters etc.) while Sandboxing.

- MinWanderDistance (Float): The minimum distance away from his current position the actor will decide to wander to when picking a point on the navmesh within the sandbox distance when AllowWandering is true.


### Notes

- If you are creating a new package, and you want it to include a Sandbox procedure that will end after a specified amount of time, put the Sandbox in a Simultaneous node along with a Wait procedure. (A Simultaneous node completes when any of its children complete, so it will end when the Wait runs out of time.)

- They don't eat real food: When the Sandbox runs an Eat procedure, it never consumes real food items from the actor's inventory.

- Other NPCs can still talk to them: Setting AllowConversations to false will not stop other NPCs from starting conversations with the sandboxing NPC. It only prevents the sandboxing NPC from choosing to start conversations with others.

- They stay in their sandbox location: If a sandboxing actor chooses to talk with an NPC who then moves outside the Location, it will give up pursuit once the target leaves the Location.

- They check ownership: A sandboxing actor will only use idle markers and furniture if they are not owned, or if they are owned by the NPC or its faction.

- They reserve their targets, and respect reservations: Sandboxing actors place a reservation on the target ref with which they want to interact. No other sandboxing actor will attempt to use those refs.

- You can chain sandbox markers via LinkedRefs but this is kludgy: If the Location is a ref with Patrol data and a linked ref, the actor will remain in that location for the duration specified by the Patrol data, and then move along to the LinkedRef, to continue sandboxing there. So, sandboxes can be chained, like they could in Fallout. However: it is now very easy to build (or to ask an expert to build) a specialized package that is a sequence of sandbox procedures, so this is only questionably relevant anymore.

### Relevant Gamesettings

- fMinSandboxRescanSeconds: Min time (in seconds) before the sandbox re-scans the world for new stuff to interact with.

- fMaxSandboxRescanSeconds: Max time (in seconds) before the sandbox re-scans the world for new stuff to interact with.

- fSandboxCylinderTop: Truncate a spherical sandbox location to a cylinder at this height above the center point. Should be a positive number.

- fSandboxCylinderBottom: Truncate a spherical sandbox location to a cylinder at this height below the center point. Should be a negative number.

- fAIWanderDefaultMinDist: The default minimum wander distance; used if the procedure doesn't specify one.

- fSandBoxRadiusHysteresis: Extra padding so we don't need to repath back into the sandbox when on the edge of it.

- fSandBoxDelayEvalSeconds: Don't re-evaluate our package/procedure for atat // least this long after starting a new sandbox action.

- fSandBoxInterMarkerMinDist: Don't go from one idle marker to another that's closer than this.


## Say (Procedure)

### Behavior

Description:
Causes an actor to say a line of dialogue (without bringing up the dialogue menu). The advent of Scenes makes the use of the procedure more limited.

The procedure completes:
After the line is spoken.

### Parameters

- Topic (Topic): Which topic to say an info from.

- Target (Target): Which reference the actor will say the line of dialogue to (usually another actor or the player)

- FinishSpeaking (Bool): ??? Possibly if false, the target is expected to respond?

- LookAtTarget (bool): Actor should headtrack the target while speaking.

- ForceSubtitle (bool): Regardless of the Game Setting the player selected, force a subtitle to be displayed when this line of dialogue is spoken.

## Say (Procedure)

### Behavior

Description:
Causes an actor to say a line of dialogue (without bringing up the dialogue menu). The advent of Scenes makes the use of the procedure more limited.

The procedure completes:
After the line is spoken.

### Parameters

- Topic (Topic): Which topic to say an info from.

- Target (Target): Which reference the actor will say the line of dialogue to (usually another actor or the player)

- FinishSpeaking (Bool): ??? Possibly if false, the target is expected to respond?

- LookAtTarget (bool): Actor should headtrack the target while speaking.

- ForceSubtitle (bool): Regardless of the Game Setting the player selected, force a subtitle to be displayed when this line of dialogue is spoken.


## Shout (Procedure)

### Behavior

Description:
Move to the specified Location (unless JustHeadtrack is true) and use a shout. Similar to the UseMagic procedure.

The procedure completes:
After the shout.

### Parameters

- Location (Location): Specifies where to be before starting to shout

- Shout (TargetSelector): Specifies a shout.

- Target (Target): Specifies a target at which to shout

- HoldWhenBlocked (Bool): If true, if there's someone else within the cone of fire who is closer than our target, don't shout.

- JustHeadtrack (Bool): When true, actor only headtracks the target, and won't path or use full-body animations. Useful for getting an actor to shout while moving.

### Notes

- Does this procedure have a defined ending?
	- Yes; as soon as the shout is complete it is considered to have ended successfully.
- How does this procedure deal with multiple targets?
	- If an ObjectList is passed into the Target parameter, only the first target in an ObjectList is considered.
- Does this procedure involve moving the actor?
	- Yes, unless the JustHeadtrack parameter is set to true, in which case the only movement it imparts (other than performing the shout itself) is headtracking.
- To allow the actor to shout from anywhere (whether or not JustHeadtrack is true), set Location to "Self".
	- If HoldWhenBlocked is true and there is another actor within the cone of fire and closer than the target, the actor will wait before shouting. (On the procedure tree page of the NPC AI debug pages, this state will show up as "Aiming Blocked.")
	- Otherwise, if the actor has the specified shout, and the target is within range, the actor will perform the shout.


## Sit (Procedure)

### Behavior

Description:
Walk to a piece of furniture and use it.

The procedure completes:
Does not complete.

### Parameters

- Target (Target): Specifies which piece of furniture to use.

### Notes

- It is useful to pair this procedure with a Wait procedure in a simultaneous branch. This effectively puts a timer on how long the actor will sit. It should be noted that this wait time would begin counting down as soon at the actor begins walking to the furniture, not when the actor sits in the furniture.


## Sleep (Procedure)

### Behavior

Description:
Walk to a bed and sleep there.

The procedure completes:
Never completes.

### Parameters

Target (Target): Specifies where to sleep

### Notes

- When this procedure is used on the player, it will act as though the Player is an NPC (This goes for all Procedures as they are considered NPC activations and not Player activations) therefore no sleep UI is shown and instead the player will get onto the bed and play the sleeping animation. Activating the bed while on it(Even while in PlayerAIDriven mode) will instead of showing the sleep UI, cause the player to get up and off the bed.

- Currently there appears to be a bug when a sleep animation plays on the player their eyes become fused shut (Even after leaving the animation). Saving and Reloading seems to fix this issue also using the ShowRaceMenu console command seems to fix it too.(See Talk:QueueNiNodeUpdate - Actor, for a scripted solution to this issue.)

- There appears to be no documented way otherwise of causing the PC to sleep or wait, or of causing those dialogs to be presented to the player.


## Travel (Procedure)

### Behavior

Description:
Actor walks to the specified location.

The procedure completes:
The procedure is considered done when the actor gets to the location and the duration has expired.

### Parameters

- Destination (Location): Location to travel to.

- RideHorseIfPossible (Bool): If true, will ride horse if possible.


### Notes
If the duration is set higher than 0 and the 'Must Complete' flag is checked, the actor will stand perfectly still at the destination until the duration has expired.


## UnlockDoors (Procedure)

### Behavior

Description:
Actor will unlock doors he owns at location. (Happens "magically" - actor will not path to doors)

The procedure completes:
When doors are unlocked.

### Parameters

- Location (Location): Location in which doors will unlock.


## UseIdleMarker (Procedure)

### Behavior

Description:
Actor walks over to and plays idles associated with specified IdleMarker.

### Parameters
Marker (Target): The IdleMarker to walk to and use.


## UseMagic (Procedure)

### Behavior

Description:
Actor walks to location and casts spell at target.

The procedure completes:
When spell is cast, and num to CastMin/Max is reached.

### Parameters

- Location (Location): Actor will walk to this location before casting spell.

- Spell (TargetSelector): Spell to cast.

- HoldWhenBlocked (Bool): If true, and an actor other than the target is in the way, do not cast the spell.

- CastTimeMin (Float): The minimum amount of time the actor will play the casting animation.

- CastTimeMax (Float): The maximum amount of time the actor will play the casting animation.

- CoolDownTimeMin (Float): The minimum time between casts.

- CoolDownTimeMax (Float): The maximum time between casts.

- DualCast (Bool): If true, will dual cast the spell.
                       

### Notes

- If a specific spell is assigned by Object ID, an actor will attempt to cast the spell even if it is not in his/her spell list.

- If a range of spell is assigned (eg Spells: Range Self), an actor will only attempt to cast a spell if such spells are in his/her spell list. Alias spells are not considered.

	- If the actor has no spells that qualify, he/she will draw his/her weapon and remain in an alert pose.

- Unlike when using the Cast function, the actor will play the casting animations. However, magicka is still not depleted.

	- If the actor does not have enough magicka to cast the spell, he/she will remain in an alert pose with the spell equipped until he/she has enough magicka to finish casting the spell.

## UseWeapon (Procedure)

### Behavior

Description:

Actor will attack with a weapon -- swinging a sword, shooting a bow, etc.
- The actor will move to the specified Location.
- If the actor has a weapon of the specified Weapon type, in will then attack its Target, using the rules specified by the data.

The procedure completes:

If RepeatFire is false, will attack for the specified number of volleys, after which it will be considered to have completed successfully, if true, it will use weapon continously and never complete.

### Parameters

- Location (Location): Specifies where to stand while attacking

- Weapon (TargetSelector): Specifies a weapon type. In addition to types like "IronSword01," the Package Object dropdrown in the TargetSelector should also allow "Any melee," "Any missile" and possibly even "any weapon."

- Target (Target): Specifies What to attack

- AlwaysHit (Bool): If true, shots will be treated as having hit the target, even if they hit something else. (For triggering OnHit script events, or doing damage, etc.)

- RepeatFire (Bool): Actor will continue to fire as specified in Fire Rate. With this true, procedure has no "completed" state.

- VolleyFire (Bool): Actor will fire volleys (randomly choosing volley size between Min and Max each time), with the specified pause (randomly choosing between min and max, in seconds). The alternative is simply to fire as rapidly as possible.

- CrouchReload (Bool): Holdover from Fallout. Makes actors drop to a crouch before they reload their weapon. Probably will be deprecated in TESV.

- DoNoDamage (Bool): Attacks may hit target, but will not deal any damage.

- HoldWhenBlocked (Bool): Refrain from attacking if any other actor is either in our line of fire (within fAIAimBlockedToleranceDegrees) or anywhere within a half-circle in front of us (of radius fAIAimBlockedHalfCircleDistance).

- VolleyWaitMin (Float): Minimum time (in seconds) to wait between volleys (if using Volley fire).

- VolleyWaitMax (Float): Maximum time (in seconds) to wait between volleys (if using Volley fire).

- VolleysPerBurst (Int): FEATURE IN PROGRESS This is currently mislabeled -- it should just be "VolleysToFire". If RepeatFire is false, we attack with this many volleys, and then the procedure is considered successfully complete. If RepeatFire is true this value is unused.

- VolleyShotsMin (Int): Minimum number of shots to fire in one volley.

- VolleyShotsMax (Int): Maximim number of shots to fire in one volley.

- AllowCombatStart (Bool): If true, starts normal combat when target is hit (or fired upon?).

- AimWithoutFiring (Bool): If true, aim but do not fire (thus ignoring many of the other parameters' values)

- AlwaysPowerAttack (Bool): If true, only use power attacks.

- DoHeadTracking (Bool): ???

- BlockPercent (Float): ??? (assuming this mimics the blocking Combat Style setting?)
 

### Notes

- Does this procedure have a defined ending?
	- Yes, but only if RepeatFire is false. The procedure will attack for the specified number of volleys, after which it will be considered to have completed successfully.
- How does this procedure deal with multiple targets?
	- If an ObjectList is passed into the Target parameter, only the first target in an ObjectList is considered.


## Wait (Procedure)

### Behavior

Description:
If not paired with another procedure in a Simultaneous Branch, the Wait Procedure allows an actor to stop doing things for a defined period of real-world time. If paired with another procedure in a Simumltaneous Branch, it will complete that branch after the specified amount of time. Time in menu mode is not counted.

The procedure completes:
After the specified time elapses (the wait time counts down to zero).

### Parameters

- ActualSeconds (Float): How many real-world secnds the procedure will wait until completing, not counting time in menus. A time of zero causes the wait procedure to never complete.

- StopMovement (Bool): If this is true, it makes the actor stop moving -- which is to say, it stops the actor's pathfinding/locomotion. (It does not stop any other incidental animations.)
                                   

### Notes

- Interaction of the StopMovement flag with other procedures in a simultaneous branch is undocumented - please use with care and document the results of your tests on this page.

- There are a wide range of other ways for Actors and scripts to wait, many of which are listed under Wait - Utility.


## Wander (Procedure)

### Behavior

Description:
Actor aimlessly meanders within a specific location.

- The actor will move to the specified Location.

- The actor will exhibit wandering behavior within the specified radius of the given location.

The procedure completes:
Never completes.

### Parameters

- Location (Location): Specifies where to wander. Will wander within the specific radius if a location data type is used.

- PreferredPathOnly (Bool): If true, actor will pick points on a preferred navmesh triangle to wander to, unless it can't find any, in which cast it will ignore this setting.

- RideHorseIfPossible (Bool): If true, will ride horse if possible.

- MinimumDistance (Float): The minimum distance from his current position that the actor will pick to wander to.

### Notes

Almost always Sandboxing is preferred to wandering.

