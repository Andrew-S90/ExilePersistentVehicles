/*
 * Vehicles Server ExileServer_object_vehicle_database_load
 *
 * Counts how many vehicles are currently on the map for each type.
 *
 * Made by Andrew_S90
 */
 
private ["_vehicleObject", "_ownerUID"];

_vehicleObject = _this call ExileServer_object_vehicle_database_load_ORIGINAL;
_ownerUID = _vehicleObject getVariable ["ExileOwnerUID", ""],

{
	if ((_x select 2) isEqualTo _ownerUID) exitWith
	{
		_x set [3, (_x select 3) + 1];
	};
} forEach VehicleTracking;

_vehicleObject