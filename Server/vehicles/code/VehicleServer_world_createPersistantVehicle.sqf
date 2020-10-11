 /*
 *
 * Author: Andrew_S90
 *
 * This work is protected by Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). 
 *
 */

private ["_dbID", "_classname", "_spawnPos", "_damageMin", "_damageMax", "_atl", "_fuel", "_vehicleObject", "_hitPointsCfgs"];

_dbID = _this select 0;
_classname = _this select 1;
_spawnPos = _this select 2;
_damageMin = _this select 3;
_damageMax = _this select 4;

if(count _spawnPos isEqualTo 2) then
{
	_spawnPos pushBack 0;
};

if(VehicleServerDebug) then
{
	diag_log format["VehicleServer_world_createPersistantVehicle Attempting to vehicle: DBID = %1 CLASSNAME = %2 POSITION = %3 DAMAGE %4 - %5", _dbID,_classname,_spawnPos,_damageMin,_damageMax];
};

try 
{
	if (count _spawnPos != 3) then
	{
		throw "Error in the spawn position";
	};
	if (_dbID isEqualTo "") then
	{
		throw "Database ID is wrong, vehicles can't spawn without this!";
	};
	if (_classname isEqualTo "") then
	{
		throw "Classname is wrong, vehicles can't spawn without this!";
	};
	if (_damageMin isEqualTo 0) then
	{
		throw "Damage values are off...";
	};
	if (_damageMax isEqualTo 0) then
	{
		throw "Damage values are off...";
	};
	if (_damageMax < _damageMin) then
	{
		throw "Damage values are off...";
	};
	if ((toLower(_classname) find "rhs") > -1) then 
	{
		_spawnPos set [2, 0.5];
	};
	
	_atl = true;
	_fuel = getNumber(configfile >> "CfgSettings" >> "SpawnSettings" >> "FuelPercent");
	
	if (_classname isKindOf "Ship") then 
	{
		_atl = false;
	};
	
	_vehicleObject = [_classname, _spawnPos, (random 360), _atl, "0000"] call ExileServer_object_vehicle_createPersistentVehicle;
	
	_vehicleObject setVariable ["ExileOwnerUID", _dbID];
	_vehicleObject setVariable ["ExileIsLocked",0];
	_vehicleObject lock 0;

	_hitPointsCfgs = configProperties [configFile >> "CfgVehicles" >> _classname >> "HitPoints", "true", true];
	
	{
		_vehicleObject setHitPointDamage [configName _x, ((random (_damageMax-_damageMin)) + _damageMin)/100];
	} forEach _hitPointsCfgs;
	
	_vehicleObject setFuel ((floor random _fuel) / 100);
	
	_vehicleObject call ExileServer_object_vehicle_database_insert;
	_vehicleObject call ExileServer_object_vehicle_database_update;
}
catch
{
	format ["VehicleServer_world_createPersistantVehicle: %1", _exception] call ExileServer_util_log;
};