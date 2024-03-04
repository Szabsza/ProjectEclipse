class_name IdlingState extends State

@export var jump_velocity : float = -300.0
@export var run_speed : float = 200.0
@export var dash_speed : float = 1.0
@export var dash_velocity : float = 500
@export var run_acceleration : float = 0.25

const IDLE_ANIMATION : String = "idle"

func state_process(delta):
	if (player.direction.x != 0 and player.is_on_floor()):
		next_state = states["Running"]


func state_input(event: InputEvent):
	if event.is_action_pressed("jump"):
		perform_jump()
	
	if event.is_action_pressed("right") or event.is_action_pressed("left"):
		perform_run()
	
	if event.is_action_pressed("dash"):
		perform_dash()
	
	if event.is_action_pressed("attack"):
		perform_attack()


func perform_jump():
	player.velocity.y = jump_velocity
	next_state = states["Jumping"]


func perform_run():
	#player.velocity.x = lerp(player.velocity.x, player.direction.x * run_speed, run_acceleration)
	player.velocity.x = player.direction.x * run_speed
	next_state = states["Running"]
	
	
func perform_dash():
	if player.is_facing_right:
		player.velocity.x = move_toward(player.velocity.x + 300, 1 * dash_velocity, dash_speed)
	else:
		player.velocity.x = move_toward(player.velocity.x - 300, -1 * dash_velocity, dash_speed)
	
	next_state = states["Rolling"]


func perform_attack():
	next_state = states["Attacking"]


func on_enter():
	playback.travel(IDLE_ANIMATION)
	player.has_double_jumped = false


func on_exit():
	pass
