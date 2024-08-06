class_name PlayerFallingState extends PlayerState

const FALL_ANIMATION : String = "fall"

var player_info : PlayerData


func on_enter():
	player_info = player.player_data
	player.animation_player.play(FALL_ANIMATION)


func on_exit():
	pass


func state_process(delta):
	if player.is_on_floor() and player.velocity.x != 0:
		next_state = states["Running"]
		player.audio_player.play_land_fx()
	elif player.is_on_floor():
		next_state = states["Idling"]
		player.audio_player.play_land_fx()
		
	player.velocity.x = player.direction.x * player_info.speed


func state_input(event : InputEvent):
	if not player.is_able_to_move:
		return 
	
	if event.is_action_pressed("jump") \
	and not player_info.has_double_jumped \
	and  player.stamina.current_stamina - player_info.jump_stamina_cost > 0:
		perform_jump()


func perform_jump():
	player.velocity.y = player_info.jump_velocity
	player_info.has_double_jumped = true
	next_state = states["Jumping"]
	

