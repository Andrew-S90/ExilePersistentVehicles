 /*
 *
 * Author: Andrew_S90
 *
 * This work is protected by Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). 
 *
 */
 
private ["_spawnPerType", "_i"];
 
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