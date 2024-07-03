class_name PlayerRunningState extends PlayerState

const RUN_ANIMATION : String = "run"

var player_info : PlayerData


func on_enter():
	player_info = player.player_data
	player.animation_player.play(RUN_ANIMATION)
	player_info.has_double_jumped = false


func on_exit():
	pass


func state_process(delta):
	if player.velocity.y > 0 and not player.is_on_floor():
		next_state = states["Falling"]
	elif player.direction.x == 0:
		next_state = states["Idling"]
	
	if player.is_able_to_move:
		player.velocity.x = player.direction.x * player_info.run_speed


func state_input(event: InputEvent):
	if event.is_action_pressed("jump") \
	and player.stamina.current_stamina - player_info.jump_stamina_cost >= 0:
		perform_jump()
	
	if event.is_action_pressed("dash") \
	and player.stamina.current_stamina -player_info.roll_stamina_cost >= 0:
		perform_dash()
	
	if event.is_action_pressed("attack") \
	and player.stamina.current_stamina - player_info.attack_stamina_cost >= 0:
		perform_attack()
	
	if event.is_action_pressed("fly") \
	and HotBarManager.wings != null \
	and player.mana.current_mana - HotBarManager.wings.mana_cost >= 0 :
		perform_fly()


func perform_jump():
	player.velocity.y = player_info.jump_velocity
	next_state = states["Jumping"]


func perform_dash():
	if player.is_facing_right:
		player.velocity.x = move_toward(300, 1 * player_info.dash_velocity, player_info.dash_speed)
	else:
		player.velocity.x = move_toward(-300, -1 * player_info.dash_velocity, player_info.dash_speed)
	
	next_state = states["Rolling"]


func perform_attack():
	next_state = states["Attacking"]


func perform_fly():
	next_state = states["Flying"]


