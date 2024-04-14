class_name RollingState extends PlayerState

const ROLL_ANIMATION : String = "roll"


func state_process(delta):
	if not player.is_on_floor():
		next_state = states["Falling"]
	
	player.player_data.roll_frames -= 1
	if player.player_data.roll_frames < 0:
		next_state = states["Idling"]
	

func on_enter():
	playback.travel(ROLL_ANIMATION)
	player.stamina.decrease_current_stamina(player.player_data.roll_stamina_cost)


func on_exit():
	player.player_data.roll_frames = 0
	player.velocity.x = 0
