class_name FireTrapInactiveState extends TrapState

const INACTIVE_ANIMATION : String = "inactive"


func on_enter():
	playback.travel(INACTIVE_ANIMATION)


func state_process(delta):
	if trap.player_detection_area.is_able_to_see_player:
		next_state = states["Activating"]
