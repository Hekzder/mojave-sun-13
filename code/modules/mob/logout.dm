/mob/Logout()
	SEND_SIGNAL(src, COMSIG_MOB_LOGOUT)
	log_message("[key_name(src)] is no longer owning mob [src]([src.type])", LOG_OWNERSHIP)
	SStgui.on_logout(src)
	unset_machine()
	remove_from_player_list()
	//MOJAVE SUN EDIT - Wallening Testmerge
	if(client?.movingmob) //In the case the client was transferred to another mob and not deleted.
		client.movingmob.client_mobs_in_contents -= src
		UNSETEMPTY(client.movingmob.client_mobs_in_contents)
		client.movingmob = null

	if(client)
		client.images.Remove(frill_oval_mask)
	frill_oval_mask = null
	//MOJAVE SUN EDIT - Wallening Testmerge
	..()

	if(loc)
		loc.on_log(FALSE)

<<<<<<< HEAD
	become_uncliented()
=======
	if(client)
		for(var/foo in client.player_details.post_logout_callbacks)
			var/datum/callback/CB = foo
			CB.Invoke()
>>>>>>> parent of 8cbd42cf37 (Fixes Massive Radio Overtime, Implements a Spatial Grid System for Faster Searching Over Areas (#61422))

	return TRUE
