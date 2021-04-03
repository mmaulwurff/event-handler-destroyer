# Event Handler Destroyer

Event Handler Destroyer (EHD) is an add-on for GZDoom that destroys event
handlers.

It has a very specific purpose: to allow transitioning to updated version of
other add-ons without losing savegame progress.

Imagine if an add-on A updated from version 1.0 to version 2.0. Player has a
saved game with Av1.0, but desires to continue playing with Av2.0. Av2.0 happens
to be savefile-incompatible with Av1.0. What can we do?

In some cases, nothing. However, if A manifests itself only with Event Handlers,
it's possible to destroy existing event handlers from Av1.0, load Av2.0, and
Av2.0 will start working on new level.

Step by step guide:
1. Have a saved game with Av1.0. Better to have it almost at the end of the
   level.
2. Add EHD to load order.
3. Load the saved game. EHD is compatible with existing savefiles.
4. Open console, type `ehd_list` to print all event handlers.
5. In the printed list, find all event handlers that belong to Av1.0.
6. For each of the event handlers from Av1.0, use `ehd_destroy` command.
7. Av1.0 stops functioning.
8. Save the game, quit GZDoom.
9. Replace Av1.0 with Av2.0 in load order.
10. Load the game saved in step 8.
11. Finish the level.
12. Av2.0 works.

## Compatibility

Even if an add-on functions only event handlers, it may not expect those event
handlers being destroyed, and therefore it may be not compatible with EHD.

EHD is created to aid updating Gearbox add-on (which supports EHD since v0.5),
but with hope that it can be used for other add-ons too.

## Links

Event Handler Destroyer is a part of [m8f's doctor's bag](https://mmaulwurff.github.io/pages/doctors-bag).
