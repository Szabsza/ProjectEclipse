class_name FallingState extends PlayerState

const FALL_ANIMATION : String = "fall"


func state_process(delta):
	if player.is_on_floor() and player.velocity.x != 0:
		next_state = states["Running"]
	elif player.is_on_floor():
		next_state = states["Idling"]
		
	player.velocity.x = player.direction.x * player.player_data.speed


func state_input(event : InputEvent):
	if event.is_action_pressed("jump") \
	and not player.player_data.has_double_jumped \
	and  player.stamina.current_stamina - player.player_data.jump_stamina_cost > 0:
		perform_jump()


func perform_jump():
	player.velocity.y = player.player_data.jump_velocity
	player.player_data.has_double_jumped = true
	next_state = states["Jumping"]
	

func on_enter():
	playback.travel(FALL_ANIMATION)


func on_exit():
	pass
