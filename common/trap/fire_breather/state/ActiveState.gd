class_name FireBreatherActiveState extends TrapState

const ACTIVE_ANIMATION : String = "attack"


func on_enter():
	playback.travel(ACTIVE_ANIMATION)


func state_process(delta):
	if not trap.player_detection_area.is_able_to_see_player:
		next_state = states["Deactivating"]
