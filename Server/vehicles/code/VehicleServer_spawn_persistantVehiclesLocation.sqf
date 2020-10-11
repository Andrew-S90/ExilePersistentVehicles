 /*
 *
 * Author: Andrew_S90
 *
 * This work is protected by Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). 
 *
 */

private ["_main", "_type", "_dbID", "_currentVeh", "_targetVeh", "_locations", "_classnames", "_damageMin", "_damageMax", "_spawnRadius", "_blacklistPos", "_position", "_classname", "_found", "_count", "_spawnPos"];

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
	
	_locations = getArray(configfile >> "CfgSettings" >> _main >> _type >> "Locations");
	_classnames = getArray(configfile >> "CfgSettings" >> _main >> _type >> "Classnames");
	_damageMin = getNumber(configfile >> "CfgSettings" >> _main >> _type >> "DamageMin");
	_damageMax = getNumber(configfile >> "CfgSettings" >> _main >> _type >> "DamageMax");
	_spawnRadius = getNumber(configfile >> "CfgSettings" >> _main >> _type >> "PositionRadius");
	
	
	_blacklistPos = [];
	
	for "_i" from _currentVeh to (_targetVeh-1) do
	{
		_position = selectRandom _locations;
		_classname = selectRandom _classnames;
		_found = false;
		_count = 0;
		_spawnPos = [];
		
		while {!_found || _count > 100} do
		{
			if(_spawnRadius isEqualto 0) then 
			{
				if(_type isEqualto "RandomBoats") then 
				{
					_spawnPos = [_position, 0, 1, 5, 2, 0.25, 0, _blacklistPos,[0,0,0]] call BIS_fnc_findSafePos;
				}
				else
				{
					_spawnPos = [_position, 0, 1, 5, 0, 0.25, 0, _blacklistPos,[0,0,0]] call BIS_fnc_findSafePos;
				};
			}
			else
			{
				if(_type isEqualto "RandomBoats") then 
				{
					_spawnPos = [_position, 0, _spawnRadius, 10, 2, 0.25, 0, _blacklistPos,[0,0,0]] call BIS_fnc_findSafePos;
				}
				else
				{
					_spawnPos = [_position, 0, _spawnRadius, 10, 0, 0.25, 0, _blacklistPos,[0,0,0]] call BIS_fnc_findSafePos;
				};
			};
			if((_spawnPos isEqualTo [0,0]) || (_spawnPos isEqualTo 0)) then
			{
				_position = selectRandom _locations;
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
	format ["VehicleServer_spawn_PersistantVehiclesLocation: %1", _exception] call ExileServer_util_log;
};