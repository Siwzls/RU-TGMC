// small ert shuttles
/obj/docking_port/stationary/ert
	name = "ert shuttle"
	id = "distress"
	dir = SOUTH
	dwidth = 3
	width = 7
	height = 13

/obj/docking_port/stationary/ert/loading
	id = "distress_loading"

/obj/docking_port/stationary/ert/target
	id = "distress_target"

/obj/docking_port/mobile/ert
	name = "ert shuttle"
	dir = SOUTH
	dwidth = 5
	width = 11
	height = 21
	var/list/mob_spawns = list()
	var/list/item_spawns = list()
	var/list/shutters = list()
	var/departing = FALSE
	ignitionTime = 10 SECONDS
	prearrivalTime = 10 SECONDS
	callTime = 1 MINUTES

/obj/docking_port/mobile/ert/proc/get_destinations()
	var/list/docks = list()
	for(var/obj/docking_port/stationary/S in SSshuttle.stationary)
		if(istype(S, /obj/docking_port/stationary/ert/target))
			if(canDock(S) == SHUTTLE_CAN_DOCK) // discards occupied docks
				docks += S
	for(var/i in SSshuttle.ert_shuttles)
		var/obj/docking_port/mobile/ert/E = i
		if(E.destination in docks)
			docks -= E.destination // another shuttle already headed there
	return docks

/obj/docking_port/mobile/ert/proc/auto_launch()
	var/obj/docking_port/stationary/S = pick(get_destinations())
	if(!S)
		return FALSE
	SSshuttle.moveShuttle(id, S.id, 1)
	return TRUE

/obj/docking_port/mobile/ert/proc/open_shutters()
	for(var/i in shutters)
		var/obj/machinery/door/poddoor/shutters/transit/T = i
		if(T.density)
			T.open()

/obj/docking_port/mobile/ert/proc/close_shutters()
	for(var/i in shutters)
		var/obj/machinery/door/poddoor/shutters/transit/T = i
		if(!T.density)
			T.close()

/obj/docking_port/mobile/ert/afterShuttleMove()
	. = ..()
	if(istype(get_docked(), /obj/docking_port/stationary/ert/target))
		open_shutters()
	else
		close_shutters()

/obj/docking_port/mobile/ert/Destroy(force)
	. = ..()
	if(force)
		SSshuttle.ert_shuttles -= src

/obj/docking_port/mobile/ert/register()
	. = ..()
	SSshuttle.ert_shuttles += src
	for(var/t in return_turfs())
		var/turf/T = t
		for(var/obj/O in T.GetAllContents())
			if(istype(O, /obj/effect/landmark/distress))
				mob_spawns += O
			else if(istype(O, /obj/effect/landmark/distress_item))
				item_spawns += O
			else if(istype(O, /obj/machinery/door/poddoor/shutters/transit))
				shutters += O
	close_shutters()

/obj/docking_port/mobile/ert/check()
	if(departing)
		intoTheSunset()
		return
	return ..()

/obj/machinery/computer/shuttle/ert

/obj/machinery/computer/shuttle/ert/ui_interact(mob/user)
	. = ..()
	var/obj/docking_port/mobile/ert/M = SSshuttle.getShuttle(shuttleId)
	var/dat = "Status: [M ? M.getStatusText() : "*Missing*"]<br><br>"
	if(M?.mode == SHUTTLE_IDLE)
		if(is_centcom_level(M.z))
			for(var/obj/docking_port/stationary/S in M.get_destinations())
				dat += "<A href='?src=[REF(src)];move=[S.id]'>Send to [S.name]</A><br>"
		else
			dat += "<A href='?src=[REF(src)];depart=1'>Depart</A><br>"
	dat += "<a href='?src=[REF(user)];mach_close=computer'>Close</a>"

	var/datum/browser/popup = new(user, "computer", M ? M.name : "shuttle", 300, 200)
	popup.set_content("<center>[dat]</center>")
	popup.set_title_image(usr.browse_rsc_icon(src.icon, src.icon_state))
	popup.open()

/obj/machinery/computer/shuttle/Topic(href, href_list)
	. = ..()
	if(.)
		return
	if(href_list["depart"])
		var/obj/docking_port/mobile/ert/M = SSshuttle.getShuttle(shuttleId)
		M.on_ignition()
		M.departing = TRUE
		M.setTimer(M.ignitionTime)
	if(usr)
		ui_interact(usr)

/obj/machinery/computer/shuttle/connect_to_shuttle(obj/docking_port/mobile/port, obj/docking_port/stationary/dock, idnum, override=FALSE)
	if(port && (shuttleId == initial(shuttleId) || override))
		shuttleId = port.id
