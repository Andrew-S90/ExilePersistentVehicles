/*
 * Vehicles Server ExileServer_world_initialize
 *
 * Calls our persistent vehicle spawner.
 *
 * Made by Andrew_S90
 */

_return = call ExileServer_world_initialize_ORIGINAL;
call VehicleServer_world_spawnAllVehicles;
_return