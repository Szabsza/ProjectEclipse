class_name RunningState extends PlayerState

const RUN_ANIMATION : String = "run"


func state_process(delta):
	if player.velocity.y > 0 and not player.is_on_floor():
		next_state = states["Falling"]
	elif player.direction.x == 0:
		next_state = states["Idling"]
	
	if is_able_to_move:
		player.velocity.x = player.direction.x * player.player_data.run_speed


func state_input(event: InputEvent):
	if event.is_action_pressed("jump") \
	and player.stamina.current_stamina - player.player_data.jump_stamina_cost >= 0:
		perform_jump()
	
	if event.is_action_pressed("dash") \
	and player.stamina.current_stamina - player.player_data.roll_stamina_cost >= 0:
		perform_dash()
	
	if event.is_action_pressed("attack") \
	and player.stamina.current_stamina - player.player_data.attack_stamina_cost >= 0:
		perform_attack()
	
	if event.is_action_pressed("fly") \
	and HotBarManager.wings != null \
	and player.mana.current_mana - HotBarManager.wings.mana_cost >= 0 :
		perform_fly()


func perform_jump():
	player.velocity.y = player.player_data.jump_velocity
	next_state = states["Jumping"]


func perform_dash():
	if player.is_facing_right:
		player.velocity.x = move_toward(300, 1 * player.player_data.dash_velocity, player.player_data.dash_speed)
	else:
		player.velocity.x = move_toward(-300, -1 * player.player_data.dash_velocity, player.player_data.dash_speed)
	
	next_state = states["Rolling"]


func perform_attack():
	next_state = states["Attacking"]


func perform_fly():
	next_state = states["Flying"]


func on_enter():
	playback.travel(RUN_ANIMATION)
	player.player_data.has_double_jumped = false


func on_exit():
	pass
