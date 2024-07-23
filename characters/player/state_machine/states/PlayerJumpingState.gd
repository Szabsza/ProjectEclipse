class_name PlayerJumpingState extends PlayerState

const JUMP_ANIMATION : String = "jump"

var player_info : PlayerData


func on_enter():
	player_info = player.player_data
	player.animation_player.play(JUMP_ANIMATION)
	player.audio_player.play_jump_fx()
	player.stamina.decrease_current_stamina(player_info.jump_stamina_cost)


func on_exit():
	pass


func state_process(delta):
	if player.is_on_floor():
		next_state = states["Idling"]
	
	if player.velocity.y > 0 and not player.is_on_floor():
		next_state = states["Falling"]
	
	player.velocity.x = player.direction.x * player_info.speed


func state_input(event : InputEvent):
	if event.is_action_pressed("attack") \
	and player.stamina.current_stamina - player_info.attack_stamina_cost > 0:
		perform_jumping_attack()
	
	if event.is_action_pressed("jump") \
	and not player_info.has_double_jumped \
	and player.stamina.current_stamina - player_info.jump_stamina_cost > 0:
		perform_jump()


func perform_jumping_attack():
	next_state = states["JumpAttacking"]


func perform_jump():
	player.velocity.y = player_info.jump_velocity
	player_info.has_double_jumped = true
	next_state = states["Jumping"]
