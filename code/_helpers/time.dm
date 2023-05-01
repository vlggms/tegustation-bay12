//Returns the world time in english
/proc/worldtime2text()
	return gameTimestamp("hh:mm:ss", world.time)

/proc/minutes_to_readable(minutes)
	if (!isnum(minutes))
		minutes = text2num(minutes)

	if (minutes < 0)
		return "INFINITE"
	else if (isnull(minutes))
		return "BAD INPUT"

	var/hours = 0
	var/days = 0
	var/weeks = 0
	var/months = 0
	var/years = 0

	if (minutes >= 518400)
		years = round(minutes / 518400)
		minutes = minutes - (years * 518400)
	if (minutes >= 43200)
		months = round(minutes / 43200)
		minutes = minutes - (months * 43200)
	if (minutes >= 10080)
		weeks = round(minutes / 10080)
		minutes = minutes - (weeks * 10080)
	if (minutes >= 1440)
		days = round(minutes / 1440)
		minutes = minutes - (days * 1440)
	if (minutes >= 60)
		hours = round(minutes / 60)
		minutes = minutes - (hours * 60)

	var/result = list()
	if (years)
		result += "[years] year\s"
	if (months)
		result += "[months] month\s"
	if (weeks)
		result += "[weeks] week\s"
	if (days)
		result += "[days] day\s"
	if (hours)
		result += "[hours] hour\s"
	if (minutes)
		result += "[minutes] minute\s"

	return jointext(result, ", ")


/proc/get_game_time()
	var/global/time_offset = 0
	var/global/last_time = 0
	var/global/last_usage = 0

	var/wtime = world.time
	var/wusage = world.tick_usage * 0.01

	if(last_time < wtime && last_usage > 1)
		time_offset += last_usage - 1

	last_time = wtime
	last_usage = wusage

	return wtime + (time_offset + wusage) * world.tick_lag

var/roundstart_hour
var/station_date = ""
var/next_station_date_change = 1 DAY

#define duration2stationtime(time) time2text(station_time_in_ticks + time, "hh:mm")
#define worldtime2stationtime(time) time2text(roundstart_hour HOURS + time, "hh:mm")
#define round_duration_in_ticks (round_start_time ? world.time - round_start_time : 0)
#define station_time_in_ticks (roundstart_hour HOURS + round_duration_in_ticks)

/proc/stationtime2text()
	return time2text(station_time_in_ticks, "hh:mm")

/proc/stationdate2text()
	var/update_time = FALSE
	if(station_time_in_ticks > next_station_date_change)
		next_station_date_change += 1 DAY
		update_time = TRUE
	if(!station_date || update_time)
		var/extra_days = round(station_time_in_ticks / (1 DAY)) DAYS
		var/timeofday = world.timeofday + extra_days
		station_date = "[GLOB.using_map.game_year]-[time2text(timeofday, "MM-DD")]"
	return station_date

/proc/time_stamp()
	return time2text(station_time_in_ticks, "hh:mm:ss")

/* Returns 1 if it is the selected month and day */
proc/isDay(var/month, var/day)
	if(isnum(month) && isnum(day))
		var/MM = text2num(time2text(world.timeofday, "MM")) // get the current month
		var/DD = text2num(time2text(world.timeofday, "DD")) // get the current day
		if(month == MM && day == DD)
			return 1

GLOBAL_VAR_INIT(midnight_rollovers, 0)
GLOBAL_VAR_INIT(rollovercheck_last_timeofday, 0)
/proc/update_midnight_rollover()
	if (world.timeofday < GLOB.rollovercheck_last_timeofday) //TIME IS GOING BACKWARDS!
		return GLOB.midnight_rollovers++
	return GLOB.midnight_rollovers

//Increases delay as the server gets more overloaded,
//as sleeps aren't cheap and sleeping only to wake up and sleep again is wasteful
#define DELTA_CALC max(((max(world.tick_usage, world.cpu) / 100) * max(Master.sleep_delta,1)), 1)

/proc/stoplag()
	if (!Master || !(GAME_STATE & RUNLEVELS_DEFAULT))
		sleep(world.tick_lag)
		return 1
	. = 0
	var/i = 1
	do
		. += round(i*DELTA_CALC)
		sleep(i*world.tick_lag*DELTA_CALC)
		i *= 2
	while (world.tick_usage > min(TICK_LIMIT_TO_RUN, Master.current_ticklimit))

#undef DELTA_CALC

/proc/acquire_days_per_month()
	. = list(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
	if(isLeap(text2num(time2text(world.realtime, "YYYY"))))
		.[2] = 29

/proc/get_weekday_index()
	var/list/weekdays = list("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
	return list_find(weekdays, time2text(world.timeofday, "DDD"))

/proc/current_month_and_day()
	var/time_string = time2text(world.realtime, "MM-DD")
	var/time_list = splittext(time_string, "-")
	return list(text2num(time_list[1]), text2num(time_list[2]))
