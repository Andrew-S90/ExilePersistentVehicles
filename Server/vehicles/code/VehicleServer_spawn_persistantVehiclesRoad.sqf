 /*
 *
 * Author: Andrew_S90
 *
 * This work is protected by Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). 
 *
 */

private ["_main", "_type", "_dbID", "_currentVeh", "_targetVeh", "_center", "_classnames", "_damageMin", "_damageMax", "_blacklistPos", "_roads", "_classname", "_found", "_count", "_spawnPos"];
 
_main = _this select 0;
_type = _this select 1;
_dbID = _this select 2;
_currentVeh = _this select 3;
_targetVeh = _this select 4;

try 
{
	if (_type isEqualTo "") then
	{
		throw "Error in the class called, No type found";
	};
	if (_dbID isEqualTo "") then
	{
		throw "Database ID is wrong, vehicles can't spawn without this!";
	};
	if (_targetVeh isEqualTo 0) then
	{
		throw "Target number of vehicles was not properly found...";
	};
	if (_currentVeh > _targetVeh) then
	{
		throw "You already have more vehicles then allowed to spawn...";
	};
	

	_center = getArray(configfile >> "CfgSettings" >> "SpawnSettings" >> worldName);
	if(count _center < 1) then
	{
		_center = [[worldSize/2,worldSize/2,0],5000];
	};
	_classnames = getArray(configfile >> "CfgSettings" >> _main >> _type >> "Classnames");
	_damageMin = getNumber(configfile >> "CfgSettings" >> _main >> _type >> "DamageMin");
	_damageMax = getNumber(configfile >> "CfgSettings" >> _main >> _type >> "DamageMax");
	
	
	_blacklistPos = [];
	_roads = (_center select 0) nearRoads (_center select 1);
	
	for "_i" from _currentVeh to (_targetVeh-1) do
	{
		_classname = selectRandom _classnames;
		_found = false;
		_count = 0;
		_spawnPos = [];
		
		while {!_found || _count > 200} do
		{
			_spawnPos = [getPos(selectRandom _roads), 0, 15, 7, 0, 0.25, 0, _blacklistPos,[0,0]] call BIS_fnc_findSafePos;
			
			if((_spawnPos isEqualTo [0,0]) || (_spawnPos isEqualTo 0)) then
			{
				_count = _count+1;
			}
			else
			{
				_spawnPos pushBack 0;
				_blacklistPos pushBack [_spawnPos,15];
				_found = true;
				[_dbID,_classname,_spawnPos,_damageMin,_damageMax] call VehicleServer_world_createPersistantVehicle;
			};
		};
	};
}
catch
{
	format ["VehicleServer_spawn_PersistantVehiclesRoad: %1", _exception] call ExileServer_util_log;
};