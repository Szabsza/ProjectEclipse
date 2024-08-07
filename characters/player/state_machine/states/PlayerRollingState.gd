class_name PlayerRollingState extends PlayerState

const ROLL_ANIMATION : String = "roll"

var player_info : PlayerData


func on_enter():
	player.refresh_hitboxes()
	player.refresh_hurtbox()
	player_info = player.player_data
	player.animation_player.play(ROLL_ANIMATION)
	player.audio_player.play_land_fx()
	player.stamina.decrease_current_stamina(player_info.roll_stamina_cost)


func on_exit():
	player_info.roll_frames = 20
	player.velocity.x = 0


func state_process(delta):
	if not player.is_on_floor():
		next_state = states["Falling"]
	
	player_info.roll_frames -= 1
	if player_info.roll_frames < 0:
		next_state = states["Idling"]


func state_input(event: InputEvent):
	pass
