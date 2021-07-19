/**
 *
 * Because Bay uses a special snowflakely version of the asset distribution. And because NanoUI
 * never shippes as a single package, it requires an even more snowflakely distribution method
 *
 */

// NanoUI assets

/datum/asset/nanoui
	var/list/assets = list() // all the files to be sent
	var/list/common = list()

	var/list/common_dirs = list(
		"nano/css/",
		"nano/images/",
		"nano/images/status_icons/",
		"nano/images/modular_computers/",
		"nano/js/"
	)
	var/list/uncommon_dirs = list(
		"nano/templates/"
	)

/datum/asset/nanoui/register()
	// Crawl the directories to find files.
	for (var/path in common_dirs)
		var/list/filenames = flist(path)
		for(var/filename in filenames)
			if(copytext(filename, length(filename)) != "/") // Ignore directories.
				if(fexists(path + filename))
					common[filename] = fcopy_rsc(path + filename)
					var/datum/asset_cache_item/ACI = SSassets.transport.register_asset(filename, common[filename])
					if(!ACI)
						continue
					assets[filename] = ACI
	for (var/path in uncommon_dirs)
		var/list/filenames = flist(path)
		for(var/filename in filenames)
			if(copytext(filename, length(filename)) != "/") // Ignore directories.
				if(fexists(path + filename))
					var/datum/asset_cache_item/ACI = SSassets.transport.register_asset(filename, fcopy_rsc(path + filename))
					if(!ACI)
						continue
					assets[filename] = ACI

	var/list/mapnames = list()
	for(var/z in GLOB.using_map.map_levels)
		mapnames += map_image_file_name(z)

	var/list/filenames = flist(MAP_IMAGE_PATH)
	for(var/filename in filenames)
		if(copytext(filename, length(filename)) != "/") // Ignore directories.
			var/file_path = MAP_IMAGE_PATH + filename
			if((filename in mapnames) && fexists(file_path))
				common[filename] = fcopy_rsc(file_path)
				var/datum/asset_cache_item/ACI = SSassets.transport.register_asset(filename, common[filename])
				if(!ACI)
					continue
				assets[filename] = ACI

/datum/asset/nanoui/send(client)
	. = SSassets.transport.send_assets(client, assets)
