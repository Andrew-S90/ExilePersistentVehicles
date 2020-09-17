/*
 * Vehicles Server Configs and Settings
 *
 * Made by Andrew_S90
 */

class CfgPatches
{
	class vehicles
	{
		requiredVersion=0.1;
		requiredAddons[]=
		{
		};
		units[]={};
		weapons[]={};
		magazines[]={};
		ammo[]={};
	};
};
class CfgFunctions
{
	class vehicles
	{
		class Bootstrap
		{
			file="vehicles\bootstrap";
			class preInit
			{
				preInit=1;
			};
			class postInit
			{
				postInit=1;
			};
		};
	};
};

class CfgSettings
{	
	class Logging
	{
		//If this is one it will log spawn locations of the vehicles
		VehiclesLogging = 1;
	};
	
	class SpawnSettings 
	{
		SimpleOverride = 1; //In heavier modified servers this method might not work and you will have to see the readme to do it manually
		
		//MapName [[Center position], Radius]];
		Altis[] = {{15360,15360,0}, 10000};
		
		AmmoPercent = 0; //0-100 Ex. 70 means vehicle will spawn with 0%-70% of ammo - Unused
		
		FuelPercent = 70; //0-100 Ex. 70 means vehicle will spawn with 0%-70% of fuel
		
		Debug = 1; //1 for true 0 for false
		
	};
	
	class PersistantVehiclesLocation
	{
		class RandomHeli
		{
			ID = "RandomHeli_Persistant";
			
			Active = 0;  //1 for true 0 for false
			
			Classnames[] =
			{
				"Exile_Chopper_Hummingbird_Green", 
				"Exile_Chopper_Huey_Green"
			};
			
			DamageMin = 65; //65% damaged
			DamageMax = 85; //95% damaged
			
			NumberToSpawn = 10;
			
			PositionRadius = 0;
			
			Locations[] = 
			{
				{4436.46,10667.6,0.0202734},
				{3345.16,6568.14,0.0176697},
				{6738.34,4584.19,0.0248389},
				{12274.7,6966.73,0.0221901},
				{10599.8,8333.16,0.0129547},
				{12237.6,12595,0.0279236},
				{9368.14,11313.5,0.014679},
				{8075.74,6616.77,0.0230815},
				{2128.28,11727.8,0.020365},
				{13999.9,2821.54,0.0201492}
			};
			
		};
	};
	
	class PersistantVehiclesRandom
	{
		class RandomVehicles
		{
			ID = "RandomVehicles";
			
			Active = 1; //1 for true 0 for false
			
			Classnames[] =
			{
				"Exile_Car_Volha_Blue",
				"Exile_Car_Volha_White",
				"Exile_Car_Lada_Green",
				"Exile_Car_TowTractor_White",
				"Exile_Car_UAZ_Open_Green",
				"Exile_Car_UAZ_Green",
				"Exile_Car_LandRover_Ambulance_Desert",
				"Exile_Car_Tractor_Red",
				"Exile_Car_OldTractor_Red",
				"Exile_Car_Octavius_White"
			};
			
			DamageMin = 65; //65% damaged
			DamageMax = 85; //95% damaged
			
			NumberToSpawn = 100;
		};
		
		class RandomHeli
		{
			ID = "RandomHeli";
			
			Active = 1; //1 for true 0 for false
			
			Classnames[] =
			{
				"Exile_Chopper_Hummingbird_Green", 
				"Exile_Chopper_Huey_Green"
			};
			
			DamageMin = 65; //65% damaged
			DamageMax = 85; //95% damaged
			
			NumberToSpawn = 15;
		};
		
		class RandomBoats
		{
			ID = "RandomBoats_Random";
			
			Active = 1; //1 for true 0 for false
			
			Classnames[] =
			{
				"Exile_Boat_MotorBoat_Police",
				"Exile_Boat_MotorBoat_Orange",
				"Exile_Boat_MotorBoat_White",
				"Exile_Boat_RubberDuck_CSAT",
				"Exile_Boat_RubberDuck_Digital",
				"Exile_Boat_RubberDuck_Orange",
				"Exile_Boat_RubberDuck_Blue",
				"Exile_Boat_RubberDuck_Black",
				"Exile_Boat_SDV_CSAT",
				"Exile_Boat_SDV_Digital",
				"Exile_Boat_SDV_Grey"
			};
			
			DamageMin = 65; //65% damaged
			DamageMax = 85; //95% damaged
			
			NumberToSpawn = 40;
		};
		
		class RandomTanks
		{
			ID = "RandomTanks_Random";
			
			Active = 0; //1 for true 0 for false
			
			Classnames[] =
			{
				"I_MBT_03_cannon_F", 
				"B_MBT_01_TUSK_F",
				"B_MBT_01_cannon_F",
				"B_T_MBT_01_cannon_F"
			};
			
			DamageMin = 65; //65% damaged
			DamageMax = 85; //95% damaged
			
			NumberToSpawn = 5;
		};
		
		class RandomAPC
		{
			ID = "RandomAPC_Random";
			
			Active = 0; //1 for true 0 for false
			
			Classnames[] =
			{
				"I_APC_Wheeled_03_cannon_F", 
				"I_APC_tracked_03_cannon_F",
				"B_APC_Tracked_01_rcws_F",
				"B_APC_Tracked_01_CRV_F"
			};
			
			DamageMin = 65; //65% damaged
			DamageMax = 85; //95% damaged
			
			NumberToSpawn = 5;
		};
	};
	
	class PersistantVehiclesRoad
	{
		class RandomVehicles
		{
			ID = "RandomVehicles_Road";
			
			Active = 1; //1 for true 0 for false
			
			Classnames[] =
			{
				"Exile_Car_Offroad_Armed_Guerilla02", // Hilux HMG
				"Exile_Car_Offroad_Armed_Guerilla02", // Hilux HMG 1
				"Exile_Car_Offroad_Armed_Guerilla03" // Hilux HMG 2
			};
			
			DamageMin = 65; //65% damaged
			DamageMax = 85; //95% damaged
			
			NumberToSpawn = 15;
		};
	};
	
	class PersistantVehiclesTown
	{
		class RandomVehicles
		{
			BigTowns[] = {"Kavala","Athira","Pyrgos"}; //Used for increasing the spawn range of big towns on the map
			
			ID = "RandomVehicles_Town";
			
			Active = 0; //1 for true 0 for false
			
			Classnames[] =
			{
				"Exile_Car_Golf_Red",
				"Exile_Car_Golf_Black",
				"Exile_Car_BTR40_Camo",
				"Exile_Car_BTR40_Green",
				"Exile_Car_HEMMT",
				"Exile_Car_HMMWV_MEV_Green",
				"Exile_Car_HMMWV_UNA_Green",
				"Exile_Car_Lada_Green",
				"Exile_Car_UAZ_Green",
				"Exile_Car_Octavius_Black",
				"C_Offroad_01_F",
				"C_Offroad_02_unarmed_F",
				"Exile_Car_Van_Fuel_Black",
				"Exile_Car_Lada_Hipster",
				"Exile_Car_LandRover_Urban",
				"Exile_Car_LandRover_Green",
				"C_Van_01_box_F",
				"Exile_Car_Ural_Covered_Worker",
				"Exile_Car_V3S_Covered",
                "Exile_Car_Golf_Red",
                "Exile_Car_Golf_Black",
                "Exile_Car_BTR40_Camo",
                "Exile_Car_BTR40_Green",
                "Exile_Car_HEMMT",
                "Exile_Car_HMMWV_MEV_Green",
                "Exile_Car_HMMWV_UNA_Green",
                "Exile_Car_UAZ_Green",
                "C_Offroad_01_F",
                "C_Offroad_02_unarmed_F",
                "Exile_Car_Van_Fuel_Black",
                "Exile_Car_LandRover_Urban",
                "Exile_Car_LandRover_Green",
                "C_Van_01_box_F",
                "Exile_Car_Ural_Covered_Worker",
                "Exile_Car_V3S_Covered"
			};
			
			DamageMin = 65; //65% damaged
			DamageMax = 85; //95% damaged
			
			NumberToSpawn = 35;
		};
	};
};