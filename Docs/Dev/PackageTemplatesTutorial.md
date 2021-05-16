# Package Templates - Tutorial

A Package Template is the cookie-cutter version of how to define behavior for AI. It is essentially a Package whose purpose is to be the basis for other Packages that need to keep the same basic behavior, but change a few details.

## Summary
### A Package:

- Is made up of procedures arranged in a procedure tree.
    - Example Procedure: _Travel which takes a data input of where to travel_

- Uses Data inputs that are used by the procedures to define various parameters the procedures will use to get the desired behavior.

    - Example: _"Destination" data to feed to a Travel procedure._

- May or may not be based on a **Package Template** 
    - When a Package derives from a Template
        - **Package Template Data**: Data is either:
            - **Public** meaning exposed to packages that use the Template so users can supply "paramters" to procedures
            - **Private** meaning not exposed, so that users can not supply their own values for these "parameters

### A Package Template

- Is a Package that is marked as a "Template"
- Is intended to be reused in a more generic fashion 
- It's data becomes the default data for future packages based on this template.

**Conditions**: You can add control through the use of Conditions at the package level, or on Procedures and branches in the procedure tree.

Note: adding a condition to the conditions tab of a Package Template is meaningless.


## Procedure Trees

When creating your own packages, there are two basic building blocks that you can use. Procedures, which are the building blocks of specific behavior, and Branches, which are nodes in which you can collect procedures. The type of node determines the logic of how the procedures inside them are processed.

Both procedures and branches can have conditions, which, in conjunction with careful use of branch types, can make for an extremely powerful tool for creating complex behaviors.

### Procedures

Procedures are the main components of how a package is put together. These define what behaviors the package will make an actor do.

### Branches

Branches arrange procedures in a logical fashion.

- **Random** - This branch will run and pick one and only one valid branch or procedure to do. Once it does that branch or procedure, the branch will finish.

- **Sequence** - This branch will do all branches and procedures in a sequence. Once it gets to the last thing, the whole sequence branch will finish.

- **Simultaneous** - This branch is sort of tricky. You can currently make any procedures run at the same time (although you should be careful with this). Usually, you would want to do a combo of something like Patrol and Find, which would make an Actor patrol until he finds the thing he's looking for. A simultaneous branch is finished when any of its child procedures or branches is completed. A simultaneous branch will not end if one of its procedures becomes invalid due to conditions causing the procedure to become invalid.

- **Stacked** - This is very similar to the package stack. When a stack branch is run, it picks the first valid branch or procedure in the stack and does it. After that, the stacked branch is considered complete.

What happens when the whole series of branches and procedures is complete? The package runs again as long as it remains the top-most package on the package stack.


### Package Data

Package data is used by procedures in order to carry out behavior in specific ways. Data can be of various types. Each procedure "parameter" requires specific types of data. Many data types like int and float are fairly common, while others such as ObjectList and TargetSelector are very specific to packages.

- **Bool** - This is represented by a checkbox in the editor. A checked box means "True".

- **Float** - This is a numerical value that can take a decimal place. It is often used for time and distance.

- **Int** - This is a numerical value that does not allow decimal places. It is often used for counting.

- **Location** - This is a more procedure-specific data type. It is often defined as a reference combined with a radius, and is usually used as an area that AI uses to search, or some sort of destination. There is often a radius which is included as part of the location, and should usually be set to some small number rather than zero. If set to zero (or when using a Ref as a location) a default radius is assigned from a gamesetting, based on the ref's type:

```
XMarker and XMarkerHeading:	fAIMarkerDestinationRadius.
Furniture:			fAIFurnitureDestinationRadius.
Actors:				fAIDistanceRadiusMinLocation + the Actor's radius.
Everything else:		fAIDistanceRadiusMinLocation.
("Everything else" includes non-ref-based locations, like "current location")
```

- **ObjectList** - This is a tricky one. If you are only using package templates, you won't have to know what this does. This object list stores data that is placed in the list by a procedure inside the package. For example, if you're trying to find a place to sit, an object list will be used by the find procedure to remember any chairs that were found by the find procedure. In a sit procedure, you can use the object list as the piece of furniture to sit in. If the object list is empty, the sit procedure would fail.

- **Ref** - This is a reference in the editor.

- **TargetSelector** - A target selector is most often used when the actor is trying to find something. It is the answer to the question "What type of thing would you like to find?" This answer could be any sort of thing, like beds, ammo, food, something with a particular base ID, or a specific reference.

### Procedure Parameter Types

Prepare for a bit of deja vu. As stated in the Package Data section immediately above, you tell a procedure what to do by assigning package data to procedure parameters. So of course you are expecting, quite reasonably, that procedures are asking for exactly the same types of data that the package data provides. And you would be right -- with one additional bit of coolness, which is: some procedure parameter types can accept more than one type of package data.

- **Bool** - Bool parameters accept only Bool package data.

- **Float** - Float parameters accept only Float package data.

- **Int** - Int parameters accept only Int package data.

- **Target** - Here is where things get interesting. You'll note that there is no single package data type named "Target." This is because several package data types are valid for use when a procedure wants a Target:

- **ObjectList** - Use an ObjectList as a Target when you want the actor to Find multiple potential targets based on their type. There are two ways that procedures can handle an ObjectList:
    - Some procedures are specifically able to act on multiple targets (e.g. Acquire, which can pick up multiple objects, or Escort, which can escort multiple actors). These will work through the ObjectList over time, automatically removing any items that are no longer valid (e.g. something the player picked up before the NPC could get to it) and acting on the valid targets, until they have acted on the requested number of targets (e.g. until Acquire has picked up the requested number of items, or until Escort has gathered the requested number of followers).
    - Other procedures only ever need a single target. These can still accept an ObjectList as their Target; they will simply try each item in the ObjectList until they find one that is valid for their purposes; they will then operate on that object.
- **Ref** - use a Ref as a target if you want to create a simpler package (or template) in which the target must be specified explicitly (by name, linked-ref, quest alias, etc.) rather than by being found at run-time with a Find procedure.
Location - This, too, can accept more than one type of package data.

    - **Location** - Naturally, when a procedure wants a  Location, it can accept a Location.
    
    - **Ref** - In addition, anything that is a valid Target can also be used as a Location. For instance, you could set up a Travel package that accepts a Ref as a destination. However, be cautious when you do this, because the location's radius is assigned automatically, from a game settting, based on the ref's type:
```
XMarker and XMarkerHeading:	fAIMarkerDestinationRadius.
Furniture:			fAIFurnitureDestinationRadius.
Actors:				fAIDistanceRadiusMinLocation + the Actor's radius.
Everything else:		fAIDistanceRadiusMinLocation.
("Everything else" includes non-ref-based locations, like "current location")
```
- **ObjectList** - If you provide an ObjectList as a location, the location will be the first valid entry in the list. Note: an ObjectList can now define a radius, for use when using it as a Location. However, if you leave the radius set to the default (zero) then the location's radius is assigned automatically, from a game settting, based on the ref's type: (See above.)

- **TargetSelector** - TargetSelector parameters accept only TargetSelector package data. When a procedure has a TargetSelector parameter, it is for the purpose of specifying a general type of object. For instance, an Eat procedure accepts a TargetSelector for specifying what type of food to eat.

## Interrupt Override Packages

### Summary

A type of package, called an "Interrupt Behavior Override Package" can be used to override automatic AI behavior and replacing it with a package.

There are 4 Interrupt Behaviors that can be so overridden:

- Combat
- GuardWarn
- ObserveDead
- Spectator

The most common thing to override is combat. 

The most common combat override package is a Hold Position Package.

You could also, for instance, override combat with a package to make someone Activate something.

### How to implement an override package

To create an Override Package, make a normal package and then use the "Interrupt Override" drop down to select what type of behavior it should override.

Then create a FormList and put the override package(s) that you want an actor to have access to in the form list, creating a "package stack."

Then assign that FormList to an actor's or alias's Override Package List dropdowns. (See: AI Packages Tab)