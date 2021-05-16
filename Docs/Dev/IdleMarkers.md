# Idle Markers

Idle Markers are categorized under "Miscellaneous / IdleMarker" in the Object Window. They allow you to specify how an Actor should behave when it reaches a specific spot. Idle Markers can represent specific animations (such as SweepIdleMarker or CounterLeanMarker), or allow the Actor to choose randomly from among a set of potential animations (such as PatrolIdleMarker, which includes a set of ten animations like shifting weight or swatting flies). Actors will ignore any animations they can't use.

Actors will typically use Idle Markers when performing a Sandbox behavior, or while idling at an Idle Marker location as part of a Patrol. Many Sandbox Packages, including the sandbox component of the Default Master Package will allow actors to 'wander' around and seek out Idle Markers to use, so you can simply populate a space with them and allow the Actors to seek them out on their own.

In practice, the easiest way to just get an actor to use an Idle Marker is to link them to it, either directly or as part of a patrol. Default Master Package can take it from there.

**The WarehouseFurniture cell has a collection of ready-to-use Idle Markers. To see what these animations look like, coc WarehouseFurniture and add in some actors (player.placeAtMe LvlHunter).**

## IdleMarker Dialog

When working with an Idle Marker, you can specify the following properties:

- ID: The form's Editor ID.
Child Can Use: - Whether children should be allowed to use this Idle Marker. As usual, if they don't have the appropriate animation, they won't use it anyway.

- Ignored by Sandbox: If checked, Actors will never find this Idle Marker when wandering as part of a Sandbox Package. Only Actors specifically linked to it will use it.

- Marker Model: A model to use in place of the default blue 'I' marker.

- Filter: Not used.

- Idle Info: A list that displays the Editor ID of each Idle and its associated event name.
Idle Timer Setting: How long to wait before picking a new idle. For Run In Sequence, the timer will run in between each sequence. For Random, the timer runs between each idle.

- Random: Idles to be used will be picked randomly from among all Idles in the list.

- Run In Sequence: Each Idle in the list will be run in sequence.

- Do Once: Each idle that is run will be run only once.

