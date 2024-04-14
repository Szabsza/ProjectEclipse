class_name JumpingState extends PlayerState

const JUMP_ANIMATION : String = "jump"


func state_process(delta):
	if player.is_on_floor():
		next_state = states["Idling"]
	
	if player.velocity.y > 0 and not player.is_on_floor():
		next_state = states["Falling"]
	
	player.velocity.x = player.direction.x * player.player_data.speed


func state_input(event : InputEvent):
	if event.is_action_pressed("attack") \
	and player.stamina.current_stamina - player.player_data.attack_stamina_cost > 0:
		perform_jumping_attack()
	
	if event.is_action_pressed("jump") \
	and not player.player_data.has_double_jumped \
	and player.stamina.current_stamina - player.player_data.jump_stamina_cost > 0:
		perform_jump()


func perform_jumping_attack():
	next_state = states["JumpAttacking"]


func perform_jump():
	player.velocity.y = player.player_data.jump_velocity
	player.player_data.has_double_jumped = true
	next_state = states["Jumping"]


func on_enter():
	playback.travel(JUMP_ANIMATION)
	player.stamina.decrease_current_stamina(player.player_data.jump_stamina_cost)


func on_exit():
	pass
