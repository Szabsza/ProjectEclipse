class_name IdlingState extends PlayerState

const IDLE_ANIMATION : String = "idle"

func state_process(delta):
	if (player.direction.x != 0 and player.is_on_floor()):
		next_state = states["Running"]


func state_input(event: InputEvent):
	if event.is_action_pressed("jump") \
	and player.stamina.current_stamina - player.player_data.jump_stamina_cost > 0:
		perform_jump()
	
	if event.is_action_pressed("right") or event.is_action_pressed("left"):
		perform_run()
	
	if event.is_action_pressed("dash") \
	and  player.stamina.current_stamina - player.player_data.roll_stamina_cost > 0:
		perform_dash()
	
	if event.is_action_pressed("attack") \
	and player.stamina.current_stamina - player.player_data.attack_stamina_cost > 0:
		perform_attack()


func perform_jump():
	player.velocity.y = player.player_data.jump_velocity
	next_state = states["Jumping"]


func perform_run():
	player.velocity.x = player.direction.x * player.player_data.run_speed
	next_state = states["Running"]
	
	
func perform_dash():
	if player.is_facing_right:
		player.velocity.x = move_toward(player.velocity.x + 300, 1 * player.player_data.dash_velocity, player.player_data.dash_speed)
	else:
		player.velocity.x = move_toward(player.velocity.x - 300, -1 * player.player_data.dash_velocity, player.player_data.dash_speed)
	
	next_state = states["Rolling"]


func perform_attack():
	next_state = states["Attacking"]


func on_enter():
	playback.travel(IDLE_ANIMATION)
	player.player_data.has_double_jumped = false


func on_exit():
	pass
