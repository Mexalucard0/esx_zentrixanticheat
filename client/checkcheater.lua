-------------------------------------------------------------------------------
-- ANTICHEAT
-------------------------------------------------------------------------------
--By victorBOY#6632 © 2019/2020
-------------------------------------------------------------------------------
-- Todos os direitos reservados.
-------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------------
-- ANTI HACK -- BLOQUEIA ALGUMAS FUNÇÕES QUE HACKERS INJETAM
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Wait(2000)
		local res =	GetNumResources()
 			 if nil ~= nil then
                if nil ~= res then
                	TriggerServerEvent('AC:triggerc', hacker)
               end
		end
	end
end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3000)
		BlipAC()
	end
end)

local amountA = 0
local policzone = 0
function BlipAC()
	local amountB = GetNumberOfActiveBlips()
	local roz = amountB - amountA
	if roz >= 40 and amountA > 0 and not whitelisted and amountA > 160 then
		policzone = policzone + 1
        TriggerServerEvent('AC:triggerc', hacker)
		if policzone >= 5 then
			amountA = amountB
			policzone = 0
		end
	else
		amountA = amountB
	end
end

Citizen.CreateThread(function()
	while true do
		Wait(100)
		local ped = NetworkIsInSpectatorMode()
		if ped == 1 then
			TriggerServerEvent('AC:triggerc', hacker)
	end
end
end)

Citizen.CreateThread(function()
while true do
	Citizen.Wait(1000)
	local playedPed = GetPlayerPed(-1)
	if (IsPedSittingInAnyVehicle(playedPed) and IsVehicleVisible(GetVehiclePedIsIn(playedPed, 1))) then
		TriggerServerEvent('AC:triggerc', hacker)
	end
end
end)

local resources 		= 0
local commands 			= 0

Citizen.CreateThread(function()

	while true do

		if ( not resources == 0 and not GetNumResources() == resources ) then

            TriggerServerEvent('AC:triggerc', hacker)

		elseif ( not commands == 0 and not #GetRegisteredCommands() == commands ) then

            	TriggerServerEvent('AC:triggerc', hacker)

		end

		Wait(2000)

	end

end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- BLACKLIST ARMAS -- ABAIXO VOCÊ COLOCA AS ARMAS BANIDAS DO SEU SERVIDOR
-----------------------------------------------------------------------------------------------------------------------------------------
blackWeapons={ "WEAPON_RAILGUN", "WEAPON_SNIPERRIFLE", "WEAPON_SNSPISTOL_MK2", "WEAPON_HEAVYPISTOL", "WEAPON_FLAREGUN", "WEAPON_MARKSMANPISTOL", "WEAPON_REVOLVER_MK2", "WEAPON_DOUBLEACTION", "WEAPON_SMG_MK2", "WEAPON_MINISMG", "WEAPON_RAYCARBINE", "WEAPON_SAWNOFFSHOTGUN", "WEAPON_ASSAULTSHOTGUN", "WEAPON_BULLPUPSHOTGUN", "WEAPON_HEAVYSHOTGUN", "WEAPON_DBSHOTGUN", "WEAPON_AUTOSHOTGUN", "WEAPON_ADVANCEDRIFLE", "WEAPON_SPECIALCARBINE_MK2", "WEAPON_BULLPUPRIFLE", "WEAPON_BULLPUPRIFLE_MK2", "WEAPON_MG", "WEAPON_COMBATMG", "WEAPON_COMBATMG_MK2", "WEAPON_HEAVYSNIPER", "WEAPON_HEAVYSNIPER_MK2", "WEAPON_MARKSMANRIFLE_MK2", "WEAPON_RPG", "WEAPON_GRENADELAUNCHER", "WEAPON_GRENADELAUNCHER_SMOKE", "WEAPON_MINIGUN", "WEAPON_FIREWORK", "WEAPON_RAILGUN", "WEAPON_HOMINGLAUNCHER", "WEAPON_COMPACTLAUNCHER", "WEAPON_RAYMINIGUN", "WEAPON_GRENADE", "WEAPON_BZGAS", "WEAPON_MOLOTOV", "WEAPON_STICKYBOMB", "WEAPON_PROXMINE", "WEAPON_SNOWBALL", "WEAPON_PIPEBOMB", "WEAPON_SMOKEGRENADE", "WEAPON_ROCKET", "WEAPON_EXPLOSION ", "WEAPON_FLARE" }

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		for k,v in ipairs(blackWeapons) do
			Citizen.Wait(1)
			N_0x4757f00bc6323cfe(GetHashKey(v), 0.0)
			if HasPedGotWeapon(PlayerPedId(),GetHashKey(v),false) == 1 then
				TriggerServerEvent('AC:webhook:ACC', black)
				RemoveWeaponFromPed(PlayerPedId(),GetHashKey(v))
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
			Citizen.Wait(1)
			N_0x4757f00bc6323cfe(-1553120962, 0.0) 
			N_0x4757f00bc6323cfe(539292904, 0.0)
			N_0x4757f00bc6323cfe(487013001, 1.2)    -- TESTAR DANO DA SHOTGUN
			N_0x4757f00bc6323cfe(324506233, 0.0) 
			N_0x4757f00bc6323cfe(-544306709, 0.0) 
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLACKLIST DE OBJETOS/PROPS -- COLOQUE OS OBJETOS BANIDOS DO SEU SERVIDOR
-----------------------------------------------------------------------------------------------------------------------------------------
local blackObjects = { "prop_weed_pallet", "hei_prop_carrier_radar_1_l1", "v_res_mexball", "prop_rock_1_a", "prop_rock_1_b", "prop_rock_1_c", "prop_rock_1_d", "prop_player_gasmask", "prop_rock_1_e", "prop_air_radar_01", "hei_prop_carrier_radar_1", "prop_air_bigradar", "prop_carrier_radar_1_l1", "prop_asteroid_01", "prop_xmas_ext", "p_oil_pjack_01_amo", "p_oil_pjack_01_s", "p_oil_pjack_02_amo", "p_oil_pjack_03_amo", "p_oil_pjack_02_s", "p_oil_pjack_03_s", "prop_aircon_l_03", "prop_med_jet_01", "p_med_jet_01_s", "hei_prop_carrier_jet", "bkr_prop_biker_bblock_huge_01", "bkr_prop_biker_bblock_huge_02", "bkr_prop_biker_bblock_huge_04", "bkr_prop_biker_bblock_huge_05", "hei_prop_heist_emp", "prop_weed_01", "prop_air_bigradar", "prop_juicestand", "prop_lev_des_barge_02", "hei_prop_carrier_defense_01", "prop_aircon_m_04", "prop_mp_ramp_03", "stt_prop_stunt_track_dwuturn", "ch3_12_animplane1_lod", "ch3_12_animplane2_lod", "hei_prop_hei_pic_pb_plane", "light_plane_rig", "prop_cs_plane_int_01", "prop_dummy_plane", "prop_mk_plane", "v_44_planeticket", "prop_planer_01", "ch3_03_cliffrocks03b_lod", "ch3_04_rock_lod_02", "csx_coastsmalrock_01_", "csx_coastsmalrock_02_", "csx_coastsmalrock_03_", "csx_coastsmalrock_04_", "mp_player_introck", "Heist_Yacht", "csx_coastsmalrock_05_", "mp_player_int_rock", "mp_player_introck", "prop_a4_pile_01", "cs2_10_sea_rocks_lod", "cs2_11_sea_marina_xr_rocks_03_lod", "prop_gold_cont_01", "prop_hydro_platform", "ch3_04_viewplatform_slod", "ch2_03c_rnchstones_lod", "proc_mntn_stone01", "prop_beachflag_le", "proc_mntn_stone02", "cs2_10_sea_shipwreck_lod", "des_shipsink_02", "prop_dock_shippad", "des_shipsink_03", "des_shipsink_04", "prop_mk_flag", "prop_mk_flag_2", "proc_mntn_stone03", "FreeModeMale01", "rsn_os_specialfloatymetal_n", "rsn_os_specialfloatymetal", "cs1_09_sea_ufo", "rsn_os_specialfloaty2_light2", "rsn_os_specialfloaty2_light", "rsn_os_specialfloaty2", "rsn_os_specialfloatymetal_n", "rsn_os_specialfloatymetal", "P_Spinning_Anus_S_Main", "P_Spinning_Anus_S_Root", "cs3_08b_rsn_db_aliencover_0001cs3_08b_rsn_db_aliencover_0001_a", "sc1_04_rnmo_paintoverlaysc1_04_rnmo_paintoverlay_a", "rnbj_wallsigns_0001", "proc_sml_stones01", "proc_sml_stones02", "proc_sml_stones03", "proc_stones_01", "proc_stones_02", "proc_stones_03", "proc_stones_04", "proc_stones_05", "proc_stones_06", "prop_coral_stone_03", "prop_coral_stone_04", "prop_gravestones_01a", "prop_gravestones_02a", "prop_gravestones_03a", "prop_gravestones_04a", "prop_gravestones_05a", "prop_gravestones_06a", "prop_gravestones_07a", "prop_gravestones_08a", "prop_gravestones_09a", "prop_gravestones_10a", "prop_prlg_gravestone_05a_l1", "prop_prlg_gravestone_06a", "test_prop_gravestones_04a", "test_prop_gravestones_05a", "test_prop_gravestones_07a", "test_prop_gravestones_08a", "test_prop_gravestones_09a", "prop_prlg_gravestone_01a", "prop_prlg_gravestone_02a", "prop_prlg_gravestone_03a", "prop_prlg_gravestone_04a", "prop_stoneshroom1", "prop_stoneshroom2", "v_res_fa_stones01", "test_prop_gravestones_01a", "test_prop_gravestones_02a", "prop_prlg_gravestone_05a", "FreemodeFemale01", "p_cablecar_s", "stt_prop_stunt_tube_l", "stt_prop_stunt_track_dwuturn", "p_spinning_anus_s", "prop_windmill_01", "hei_prop_heist_tug", "prop_air_bigradar", "p_oil_slick_01", "prop_dummy_01", "hei_prop_heist_emp", "p_tram_cash_s", "hw1_blimp_ce2", "prop_fire_exting_1a", "prop_fire_exting_1b", "prop_fire_exting_2a", "prop_fire_exting_3a", "hw1_blimp_ce2_lod", "hw1_blimp_ce_lod", "hw1_blimp_cpr003", "hw1_blimp_cpr_null", "hw1_blimp_cpr_null2", "prop_lev_des_barage_02", "hei_prop_carrier_defense_01", "prop_juicestand", "S_M_M_MovAlien_01", "s_m_m_movalien_01", "s_m_m_movallien_01", "u_m_y_babyd", "CS_Orleans", "A_M_Y_ACult_01", "S_M_M_MovSpace_01", "U_M_Y_Zombie_01", "s_m_y_blackops_01", "a_f_y_topless_01", "a_c_hen", "a_c_boar", "a_c_cat_01", "a_c_chickenhawk", "a_c_chimp", "s_f_y_hooker_03", "a_c_chop", "a_c_cormorant", "a_c_cow", "a_c_coyote", "v_ilev_found_cranebucket", "p_cs_sub_hook_01_s", "a_c_crow", "a_c_dolphin", "a_c_fish", "hei_prop_heist_hook_01", "prop_rope_hook_01", "prop_sub_crane_hook", "s_f_y_hooker_01", "prop_vehicle_hook", "prop_v_hook_s", "prop_dock_crane_02_hook", "prop_winch_hook_long", "a_c_humpback", "a_c_husky", "a_c_killerwhale", "a_c_mtlion", "a_c_pigeon", "a_c_poodle", "prop_coathook_01", "prop_cs_sub_hook_01", "a_c_pug", "a_c_rabbit_01", "a_c_rat", "a_c_retriever", "a_c_rhesus", "a_c_rottweiler", "a_c_sharkhammer", "a_c_sharktiger", "a_c_shepherd", "a_c_stingray", "a_c_westy", "CS_Orleans", "prop_windmill_01", "prop_Ld_ferris_wheel", "p_tram_crash_s", "p_oil_slick_01", "p_ld_stinger_s", "p_ld_soc_ball_01", "p_parachute1_s", "p_cablecar_s", "prop_beach_fire", "prop_lev_des_barge_02", "prop_lev_des_barge_01", "prop_sculpt_fix", "prop_flagpole_2b", "prop_flagpole_2c", "prop_winch_hook_short", "prop_flag_canada", "prop_flag_canada_s", "prop_flag_eu", "prop_flag_eu_s", "prop_flag_france", "prop_flag_france_s", "prop_flag_german", "prop_ld_hook", "prop_flag_german_s", "prop_flag_ireland", "prop_flag_ireland_s", "prop_flag_japan", "prop_flag_japan_s", "prop_flag_ls", "prop_flag_lsfd", "prop_flag_lsfd_s", "prop_cable_hook_01", "prop_flag_lsservices", "prop_flag_lsservices_s", "prop_flag_ls_s", "prop_flag_mexico", "prop_flag_mexico_s", "csx_coastboulder_00", "des_tankercrash_01", "des_tankerexplosion_01", "des_tankerexplosion_02", "des_trailerparka_02", "des_trailerparkb_02", "des_trailerparkc_02", "des_trailerparkd_02", "des_traincrash_root2", "des_traincrash_root3", "des_traincrash_root4", "des_traincrash_root5", "des_finale_vault_end", "des_finale_vault_root001", "des_finale_vault_root002", "des_finale_vault_root003", "des_finale_vault_root004", "des_finale_vault_start", "des_vaultdoor001_root001", "des_vaultdoor001_root002", "des_vaultdoor001_root003", "des_vaultdoor001_root004", "des_vaultdoor001_root005", "des_vaultdoor001_root006", "des_vaultdoor001_skin001", "des_vaultdoor001_start", "des_traincrash_root6", "prop_ld_vault_door", "prop_vault_door_scene", "prop_vault_door_scene", "prop_vault_shutter", "p_fin_vaultdoor_s", "prop_gold_vault_fence_l", "prop_gold_vault_fence_r", "prop_gold_vault_gate_01", "des_traincrash_root7", "prop_flag_russia", "prop_flag_russia_s", "prop_flag_s", "ch2_03c_props_rrlwindmill_lod", "prop_flag_sa", "prop_flag_sapd", "prop_flag_sapd_s", "prop_flag_sa_s", "prop_flag_scotland", "prop_flag_scotland_s", "prop_flag_sheriff", "prop_flag_sheriff_s", "prop_flag_uk", "prop_yacht_lounger", "prop_yacht_seat_01", "prop_yacht_seat_02", "prop_yacht_seat_03", "marina_xr_rocks_02", "marina_xr_rocks_03", "prop_test_rocks01", "prop_test_rocks02", "prop_test_rocks03", "prop_test_rocks04", "marina_xr_rocks_04", "marina_xr_rocks_05", "marina_xr_rocks_06", "prop_yacht_table_01", "csx_searocks_02", "csx_searocks_03", "csx_searocks_04", "csx_searocks_05", "csx_searocks_06", "p_yacht_chair_01_s", "p_yacht_sofa_01_s", "prop_yacht_table_02", "csx_coastboulder_00", "csx_coastboulder_01", "csx_coastboulder_02", "csx_coastboulder_03", "csx_coastboulder_04", "csx_coastboulder_05", "csx_coastboulder_06", "csx_coastboulder_07", "csx_coastrok1", "csx_coastrok2", "csx_coastrok3", "csx_coastrok4", "csx_coastsmalrock_01", "csx_coastsmalrock_02", "csx_coastsmalrock_03", "csx_coastsmalrock_04", "csx_coastsmalrock_05", "prop_yacht_table_03", "prop_flag_uk_s", "p_gasmask_s", "prop_flamingo" }

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		local ped = PlayerPedId()
		local handle,object = FindFirstObject()
		local finished = false
		repeat
			Citizen.Wait(1)
			if IsEntityAttached(object) and DoesEntityExist(object) then
				if GetEntityModel(object) == GetHashKey("prop_acc_guitar_01") or GetEntityModel(object) == GetHashKey("prop_weed_pallet") then
					ReqAndDelete(object,true)
				end
			end
			for i=1,#blackObjects do
				if GetEntityModel(object) == GetHashKey(blackObjects[i]) then
					ReqAndDelete(object,false)
				end
			end
			finished,object = FindNextObject(handle)
		until not finished
		EndFindObject(handle)
	end
end)

function ReqAndDelete(object,detach)
	if DoesEntityExist(object) then
		NetworkRequestControlOfEntity(object)
		while not NetworkHasControlOfEntity(object) do
			Citizen.Wait(1)
		end

		if detach then
			DetachEntity(object,0,false)
		end

		SetEntityCollision(object,false,false)
		SetEntityAlpha(object,0.0,true)
		SetEntityAsMissionEntity(object,true,true)
		SetEntityAsNoLongerNeeded(object)
		DeleteEntity(object)
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- DESATIVAR ARMAS DE VEICULOS
-----------------------------------------------------------------------------------------------------------------------------------------
local vehicle_weapon_names = { "VEHICLE_WEAPON_WATER_CANNON", "VEHICLE_WEAPON_PLAYER_LAZER", "VEHICLE_WEAPON_PLANE_ROCKET", "VEHICLE_WEAPON_ENEMY_LASER", "VEHICLE_WEAPON_TANK", "VEHICLE_WEAPON_SEARCHLIGHT", "VEHICLE_WEAPON_RADAR", "VEHICLE_WEAPON_PLAYER_BUZZARD", "VEHICLE_WEAPON_SPACE_ROCKET", "VEHICLE_WEAPON_TURRET_INSURGENT", "VEHICLE_WEAPON_PLAYER_SAVAGE", "VEHICLE_WEAPON_TURRET_TECHNICAL", "VEHICLE_WEAPON_NOSE_TURRET_VALKYRIE", "VEHICLE_WEAPON_TURRET_VALKYRIE", "VEHICLE_WEAPON_CANNON_BLAZER", "VEHICLE_WEAPON_TURRET_BOXVILLE", "VEHICLE_WEAPON_RUINER_BULLET", "VEHICLE_WEAPON_RUINER_ROCKET", "VEHICLE_WEAPON_HUNTER_MG", "VEHICLE_WEAPON_HUNTER_MISSILE", "VEHICLE_WEAPON_HUNTER_CANNON", "VEHICLE_WEAPON_HUNTER_BARRAGE", "VEHICLE_WEAPON_TULA_NOSEMG", "VEHICLE_WEAPON_TULA_MG", "VEHICLE_WEAPON_TULA_DUALMG", "VEHICLE_WEAPON_TULA_MINIGUN", "VEHICLE_WEAPON_SEABREEZE_MG", "VEHICLE_WEAPON_MICROLIGHT_MG", "VEHICLE_WEAPON_DOGFIGHTER_MG", "VEHICLE_WEAPON_DOGFIGHTER_MISSILE", "VEHICLE_WEAPON_MOGUL_NOSE", "VEHICLE_WEAPON_MOGUL_DUALNOSE", "VEHICLE_WEAPON_MOGUL_TURRET", "VEHICLE_WEAPON_MOGUL_DUALTURRET", "VEHICLE_WEAPON_ROGUE_MG", "VEHICLE_WEAPON_ROGUE_CANNON", "VEHICLE_WEAPON_ROGUE_MISSILE", "VEHICLE_WEAPON_BOMBUSHKA_DUALMG", "VEHICLE_WEAPON_BOMBUSHKA_CANNON", "VEHICLE_WEAPON_HAVOK_MINIGUN", "VEHICLE_WEAPON_VIGILANTE_MG", "VEHICLE_WEAPON_VIGILANTE_MISSILE", "VEHICLE_WEAPON_TURRET_LIMO", "VEHICLE_WEAPON_DUNE_MG", "VEHICLE_WEAPON_DUNE_GRENADELAUNCHER", "VEHICLE_WEAPON_DUNE_MINIGUN", "VEHICLE_WEAPON_TAMPA_MISSILE", "VEHICLE_WEAPON_TAMPA_MORTAR", "VEHICLE_WEAPON_TAMPA_FIXEDMINIGUN", "VEHICLE_WEAPON_TAMPA_DUALMINIGUN", "VEHICLE_WEAPON_HALFTRACK_DUALMG", "VEHICLE_WEAPON_HALFTRACK_QUADMG", "VEHICLE_WEAPON_APC_CANNON", "VEHICLE_WEAPON_APC_MISSILE", "VEHICLE_WEAPON_APC_MG", "VEHICLE_WEAPON_ARDENT_MG", "VEHICLE_WEAPON_TECHNICAL_MINIGUN", "VEHICLE_WEAPON_INSURGENT_MINIGUN", "VEHICLE_WEAPON_TRAILER_QUADMG", "VEHICLE_WEAPON_TRAILER_MISSILE", "VEHICLE_WEAPON_TRAILER_DUALAA", "VEHICLE_WEAPON_NIGHTSHARK_MG", "VEHICLE_WEAPON_OPPRESSOR_MG", "VEHICLE_WEAPON_OPPRESSOR_MISSILE", "VEHICLE_WEAPON_MOBILEOPS_CANNON", "VEHICLE_WEAPON_AKULA_TURRET_SINGLE", "VEHICLE_WEAPON_AKULA_MISSILE", "VEHICLE_WEAPON_AKULA_TURRET_DUAL", "VEHICLE_WEAPON_AKULA_MINIGUN", "VEHICLE_WEAPON_AKULA_BARRAGE", "VEHICLE_WEAPON_AVENGER_CANNON", "VEHICLE_WEAPON_BARRAGE_TOP_MG", "VEHICLE_WEAPON_BARRAGE_TOP_MINIGUN", "VEHICLE_WEAPON_BARRAGE_REAR_MG", "VEHICLE_WEAPON_BARRAGE_REAR_MINIGUN", "VEHICLE_WEAPON_BARRAGE_REAR_GL", "VEHICLE_WEAPON_CHERNO_MISSILE", "VEHICLE_WEAPON_COMET_MG", "VEHICLE_WEAPON_DELUXO_MG", "VEHICLE_WEAPON_DELUXO_MISSILE", "VEHICLE_WEAPON_KHANJALI_CANNON", "VEHICLE_WEAPON_KHANJALI_CANNON_HEAVY", "VEHICLE_WEAPON_KHANJALI_MG", "VEHICLE_WEAPON_KHANJALI_GL", "VEHICLE_WEAPON_REVOLTER_MG", "VEHICLE_WEAPON_SAVESTRA_MG", "VEHICLE_WEAPON_SUBCAR_MG", "VEHICLE_WEAPON_SUBCAR_MISSILE", "VEHICLE_WEAPON_SUBCAR_TORPEDO", "VEHICLE_WEAPON_THRUSTER_MG", "VEHICLE_WEAPON_THRUSTER_MISSILE", "VEHICLE_WEAPON_VISERIS_MG", "VEHICLE_WEAPON_VOLATOL_DUALMG" }

Citizen.CreateThread(function()
		vehicle_weapons = {}
		
    for _,v in next, vehicle_weapon_names do
        table.insert(vehicle_weapons, GetHashKey(v))
    end

    while true do
        for i=0,256,1 do
		    local ply = GetPlayerPed(i)
		    local veh = GetVehiclePedIsIn(ply, false)

		    if DoesVehicleHaveWeapons(veh) then
			    for _,v in next, vehicle_weapons do
						DisableVehicleWeapon(true, v, veh, ply)
			    end
		    end
        end
        Citizen.Wait(100)
    end
end)

-- DÚVIDAS? CHAME: victorBOY#6632