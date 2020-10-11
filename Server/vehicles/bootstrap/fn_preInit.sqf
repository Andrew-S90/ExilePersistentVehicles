 /*
 *
 * Author: Andrew_S90
 *
 * This work is protected by Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). 
 *
 */
 
private ["_code", "_function", "_file", "_fileContent", "_codeHook", "_codeOrig", "_hook"];

{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;

    _fileContent = preprocessFileLineNumbers _file;

    _code = compileFinal _fileContent;                    

    missionNamespace setVariable [_function, _code];
}
forEach 
[
	['VehicleServer_spawn_PersistantVehiclesLocation', 'vehicles\code\VehicleServer_spawn_PersistantVehiclesLocation.sqf'],
	['VehicleServer_spawn_PersistantVehiclesRandom', 'vehicles\code\VehicleServer_spawn_PersistantVehiclesRandom.sqf'],
	['VehicleServer_spawn_PersistantVehiclesRoad', 'vehicles\code\VehicleServer_spawn_PersistantVehiclesRoad.sqf'],
	['VehicleServer_spawn_PersistantVehiclesTown', 'vehicles\code\VehicleServer_spawn_PersistantVehiclesTown.sqf'],
	['VehicleServer_system_process_postInit', 'vehicles\code\VehicleServer_system_process_postInit.sqf'],
	['VehicleServer_world_createPersistantVehicle', 'vehicles\code\VehicleServer_world_createPersistantVehicle.sqf'],
	['VehicleServer_world_spawnAllVehicles', 'vehicles\code\VehicleServer_world_spawnAllVehicles.sqf']
];



if (getNumber(configfile >> "CfgSettings" >> "SpawnSettings" >> "SimpleOverride") isEqualTo 1) then
{
	//Hooking
	{
		_codeHook = '';
		_codeOrig = '';
		_function = _x select 0;
		_file = _x select 1;
		_hook = _x select 2;

		if (isText (missionConfigFile >> 'CfgExileCustomCode' >> _function)) then
		{
			_file = getText (missionConfigFile >> 'CfgExileCustomCode' >> _function);
		};

		_codeHook = compileFinal (preprocessFileLineNumbers _hook);
		_codeOrig = compileFinal (preprocessFileLineNumbers _file);
		missionNamespace setVariable [_function, _codeHook];
		missionNamespace setVariable [format["%1_ORIGINAL", _function], _codeOrig];
		diag_log format ["VehicleServer - Hooked %1 to redirect to %2 from %3", _function, _hook, _file];
	} forEach
	[
		['ExileServer_object_vehicle_database_load', 'exile_server\code\ExileServer_object_vehicle_database_load.sqf', 'vehicles\code\hooks\VehicleServer_object_vehicle_database_load.sqf'],
		['ExileServer_world_initialize', 'exile_server\code\ExileServer_world_initialize.sqf', 'vehicles\code\hooks\VehicleServer_world_initialize.sqf']
	];
};
diag_log "VEHICLES SERVER - Loaded.";
true