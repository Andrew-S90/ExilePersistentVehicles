/*
 * Vehicles Server VehicleServer_world_spawnAllVehicles
 *
 * This counts through the IDs provided if they are active and makes sure there is a place in the database for them and then will call everything needed to spawn them.
 *
 * Made by Andrew_S90
 */

private ["_all", "_functionName", "_functionCode"];

{
	if !(format["isKnownAccount:%1",(_x select 2)] call ExileServer_system_database_query_selectSingleField) then
	{
		format["createAccount:%1:%1",(_x select 2)] call ExileServer_system_database_query_fireAndForget;
	};
} forEach VehicleTracking;

_all = (configfile >> "CfgSettings" >> "PersistantVehiclesRandom") call BIS_fnc_returnChildren;

{
	if(VehicleServerDebug) then
	{
		diag_log format["VehicleServer_world_spawnAllVehicles %1 has %2 vehicles we need to spawn a total of %3",(_x select 2),(_x select 3),(_x select 4)];
	};

	_functionName = format ["VehicleServer_spawn_%1", (_x select 0)];
	_functionCode = missionNamespace getVariable [_functionName, ""];
	if (_functionCode isEqualTo "") exitWith
	{
		diag_log format["Invalid vehicle spawn called %1", _functionName];
	};
	_x call _functionCode;
} forEach VehicleTracking;

format ["VehicleServer_world_spawnAllVehicles - Dynamic persistent vehicles spawned."] call ExileServer_util_log;
true
