#if !defined(using_map_DATUM)

	#include "intrepid_announcements.dm"
	#include "intrepid_antagonism.dm"
	#include "intrepid_areas.dm"
	#include "intrepid_elevator.dm"
	#include "intrepid_events.dm"
	#include "intrepid_overmap.dm"
	#include "intrepid_presets.dm"
	#include "intrepid_procs.dm"
	#include "intrepid_radio.dm"
	#include "intrepid_ranks.dm"
	#include "intrepid_security_state.dm"
	#include "intrepid_setup.dm"
	#include "intrepid_shuttles.dm"
	#include "intrepid_unit_testing.dm"

	#include "datums/cultures_serpentid.dm"
	#include "datums/uniforms.dm"
	//#include "datums/uniforms_exploration.dm"
	//#include "datums/uniforms_fleet.dm"

	#include "jobs/intrepid_jobs.dm"
	#include "jobs/intrepid_access.dm"
	#include "jobs/command_jobs.dm"
	#include "jobs/engineering_jobs.dm"
	#include "jobs/exploration_jobs.dm"
	#include "jobs/medical_jobs.dm"
	#include "jobs/misc_jobs.dm"
	#include "jobs/research_jobs.dm"
	#include "jobs/security_jobs.dm"
	#include "jobs/service_jobs.dm"
	#include "jobs/supply_jobs.dm"

	#include "jobs/outfits/intrepid_outfits.dm"
	#include "jobs/outfits/command_outfits.dm"
	#include "jobs/outfits/engineering_outfits.dm"
	#include "jobs/outfits/exploration_outfits.dm"
	#include "jobs/outfits/medical_outfits.dm"
	#include "jobs/outfits/misc_outfits.dm"
	#include "jobs/outfits/research_outfits.dm"
	#include "jobs/outfits/security_outfits.dm"
	#include "jobs/outfits/service_outfits.dm"
	#include "jobs/outfits/supply_outfits.dm"
	//#include "jobs/outfits/unused_outfits.dm"

	#include "language/human/english.dm"
	#include "language/human/misc/spacer.dm"

	#include "items/cards_ids.dm"
	#include "items/encryption_keys.dm"
	#include "items/headsets.dm"
	#include "items/items.dm"

	#include "items/clothing/terragov-accessory.dm"
	#include "items/clothing/terragov-armor.dm"
	#include "items/clothing/terragov-head.dm"
	#include "items/clothing/terragov-skillbadges.dm"
	#include "items/clothing/terragov-suit.dm"
	#include "items/clothing/terragov-under.dm"

	//#include "machinery/apc_shuttle.dm"
	#include "machinery/drone_fab.dm"
	#include "machinery/faxmachine.dm"
	#include "machinery/keycard_auth.dm"
	#include "machinery/suit_cyclers.dm"
	#include "machinery/telecomms.dm"
	#include "machinery/uniform_vendor.dm"

	#include "structures/signs.dm"
	//#include "structures/closets.dm"
	#include "structures/closets/closet_appearances.dm"
	#include "structures/closets/command.dm"
	#include "structures/closets/engineering.dm"
	#include "structures/closets/medical.dm"
	#include "structures/closets/misc.dm"
	#include "structures/closets/research.dm"
	#include "structures/closets/security.dm"
	#include "structures/closets/services.dm"
	#include "structures/closets/supply.dm"
	#include "structures/closets/exploration.dm"

	#include "loadout/_defines.dm"
	#include "loadout/loadout_accessories.dm"
	#include "loadout/loadout_eyes.dm"
	#include "loadout/loadout_medals.dm"
	#include "loadout/loadout_misc.dm"
	#include "loadout/loadout_skillbadges.dm"
	#include "loadout/loadout_xeno.dm"
	#include "loadout/~defines.dm"

	#include "intrepid1.dmm"
	#include "intrepid2.dmm"
	#include "z1_admin.dmm"
	#include "z2_transit.dmm"

	#include "../away/empty.dmm"
	#include "../away/mining/mining.dm"
	#include "../away/derelict/derelict.dm"
	#include "../away/bearcat/bearcat.dm"
	#include "../away/lost_supply_base/lost_supply_base.dm"
	#include "../away/smugglers/smugglers.dm"
	#include "../away/magshield/magshield.dm"
	#include "../away/casino/casino.dm"
	#include "../away/yacht/yacht.dm"
	#include "../away/blueriver/blueriver.dm"
	#include "../away/slavers/slavers_base.dm"
	#include "../away/mobius_rift/mobius_rift.dm"
	#include "../away/obs_shuttle/obs_shuttle.dm"
	#include "../away/errant_pisces/errant_pisces.dm"
	#include "../away/lar_maria/lar_maria.dm"
	#include "../away/voxship/voxship.dm"
	#include "../away/singularity_ring/singularity_ring.dm"
	#include "../away/skrellscoutship/skrellscoutship.dm"
	#include "../away/meatstation/meatstation.dm"
	#include "../away/miningstation/miningstation.dm"
	#include "../away/mininghome/mininghome.dm"
	#include "../away/scavver/scavver_gantry.dm"
	#include "../away/verne/verne.dm"
	#include "../away/rawl/rawl.dm"
	#include "../away/ascent_caulship/_ascent_caulship.dm"
	#include "../away/bunker/bunker.dm"

	#define using_map_DATUM /datum/map/intrepid

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Intrepid

#endif
