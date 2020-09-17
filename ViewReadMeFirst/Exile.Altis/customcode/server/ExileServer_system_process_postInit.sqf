/**
 * ExileServer_system_process_postInit
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
if (!isNil "PublicServerVersion") then
{
	if (getNumber(configFile >> "CfgSettings" >> "Escape" >> "enableEscape") isEqualTo 1) then 
	{		
		call ExileClient_system_map_initialize;
		call ExileServer_system_thread_initialize;
		call ExileServer_system_escape_initialize;
		call ExileServer_system_swapOwnershipQueue_initialize;
		call ExileServer_system_simulationMonitor_initialize;
		call ExileServer_system_lootManager_initialize;
		PublicServerIsLoaded = true; 
		publicVariable "PublicServerIsLoaded";
		format ["Escape server is up and running! Version: %1", PublicServerVersion] call ExileServer_util_log;
		call ExileServer_system_rcon_event_ready;
	}
	else
	{
		//VEHICLE SERVER - ONLY USE OVERRIDES IF IT DOES NOT WORK OUT OF THE BOX!
		VehicleSpawnTypes = ["PersistantVehiclesLocation","PersistantVehiclesRandom","PersistantVehiclesRoad","PersistantVehiclesTown"];

		VehicleTracking = [];

		{
			_spawnPerType = (configfile >> "CfgSettings" >> _x) call BIS_fnc_returnChildren;
			
			for "_i" from 0 to ((count _spawnPerType) - 1) do 
			{
				if(getNumber(configfile >> "CfgSettings" >> _x >> configName (_spawnPerType select _i) >> "Active") isEqualTo 1) then
				{
					VehicleTracking pushBack [_x,configName (_spawnPerType select _i),getText(configfile >> "CfgSettings" >> _x >> configName (_spawnPerType select _i) >> "ID"),0,getNumber(configfile >> "CfgSettings" >> _x >> configName (_spawnPerType select _i) >> "NumberToSpawn")];
				};
			};
		} forEach VehicleSpawnTypes;

		VehicleServerDebug = (getNumber(configfile >> "CfgSettings" >> "SpawnSettings" >> "Debug") isEqualTo 1);
		//VEHICLE SERVER - ONLY USE OVERRIDES IF IT DOES NOT WORK OUT OF THE BOX!
	
		call ExileClient_system_map_initialize;
		call ExileServer_system_thread_initialize;
		call ExileServer_system_playerSaveQueue_initialize;
		call ExileServer_system_swapOwnershipQueue_initialize;
		call ExileServer_system_vehicleSaveQueue_initialize;
		call ExileServer_system_simulationMonitor_initialize;
		call ExileServer_system_lootManager_initialize;
		call ExileServer_system_weather_initialize;
		call ExileServer_system_garbageCollector_cleanDatabase;
		call ExileServer_system_event_initialize;
		call ExileServer_world_initialize;
		call ExileServer_system_russianRoulette_initialize;
		PublicServerIsLoaded = true; 
		publicVariable "PublicServerIsLoaded";
		format ["Server is up and running! Version: %1", PublicServerVersion] call ExileServer_util_log;
		call ExileServer_system_garbageCollector_start;
		call ExileServer_system_rcon_event_ready;
	};
};