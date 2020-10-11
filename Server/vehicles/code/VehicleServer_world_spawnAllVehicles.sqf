 /*
 *
 * Author: Andrew_S90
 *
 * This work is protected by Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). 
 *
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
