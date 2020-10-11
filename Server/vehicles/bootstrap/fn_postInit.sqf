 /*
 *
 * Author: Andrew_S90
 *
 * This work is protected by Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). 
 *
 */

if (getNumber(configfile >> "CfgSettings" >> "SpawnSettings" >> "SimpleOverride") isEqualTo 1) then
{ 
	call VehicleServer_system_process_postInit;
};
true