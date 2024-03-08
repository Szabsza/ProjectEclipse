class_name MonkIdlingState extends State

const IDLE_ANIMATION : String = "idle"

func on_enter():
	playback.travel(IDLE_ANIMATION)


func state_process(delta):
	if character.player_detection_area.is_able_to_see_player:
		next_state = states["Chasing"]


func on_exit():
	pass
