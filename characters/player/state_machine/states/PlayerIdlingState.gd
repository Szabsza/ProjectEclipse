class_name PlayerIdlingState extends PlayerState

const IDLE_ANIMATION : String = "idle"

var player_info : PlayerData


func on_enter():
	player_info = player.player_data
	player.animation_player.play(IDLE_ANIMATION)
	player_info.has_double_jumped = false


func on_exit():
	pass


func state_process(delta):
	if (player.direction.x != 0 and player.is_on_floor()):
		next_state = states["Running"]


func state_input(event: InputEvent):
	if not player.is_able_to_move:
		return 
		
	if event.is_action_pressed("jump") \
	and player.stamina.current_stamina - player_info.jump_stamina_cost >= 0:
		perform_jump()
	
	if event.is_action_pressed("right") or event.is_action_pressed("left"):
		perform_run()
	
	if event.is_action_pressed("dash") \
	and  player.stamina.current_stamina - player_info.roll_stamina_cost >= 0:
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


func perform_run():
	player.velocity.x = player.direction.x * player_info.run_speed
	next_state = states["Running"]
	
	
func perform_dash():
	if player.is_facing_right:
		player.velocity.x = move_toward(player.velocity.x + 300, 1 * player_info.dash_velocity, player_info.dash_speed)
	else:
		player.velocity.x = move_toward(player.velocity.x - 300, -1 * player_info.dash_velocity, player_info.dash_speed)
	
	next_state = states["Rolling"]


func perform_attack():
	next_state = states["Attacking"]


func perform_fly():
	next_state = states["Flying"]
