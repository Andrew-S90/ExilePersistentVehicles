/*
 * Vehicles Server postInit 
 *
 * Made by Andrew_S90
 */

if (getNumber(configfile >> "CfgSettings" >> "SpawnSettings" >> "SimpleOverride") isEqualTo 1) then
{ 
	call VehicleServer_system_process_postInit;
};
true