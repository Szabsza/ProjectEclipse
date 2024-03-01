class_name RunningState extends State

@export var jump_velocity : float = -300.0
@export var dash_speed : float = 1.0
@export var dash_velocity : float = 500
@export var run_speed : float = 200.0
@export var minimum_run_speed : float = 0.005

const RUN_ANIMATION : String = "run"

func state_process(delta):
	if player.velocity.y > 0 and not player.is_on_floor():
		next_state = states["Falling"]
	elif player.direction.x == 0:
		next_state = states["Idling"]
	
	player.velocity.x = player.direction.x * run_speed


func state_input(event: InputEvent):
	if event.is_action_pressed("jump"):
		perform_jump()
	
	if event.is_action_pressed("dash"):
		perform_dash()


func perform_jump():
	player.velocity.y = jump_velocity
	next_state = states["Jumping"]


func perform_dash():
	if player.is_facing_right:
		player.velocity.x = move_toward(300, 1 * dash_velocity, dash_speed)
	else:
		player.velocity.x = move_toward(-300, -1 * dash_velocity, dash_speed)
	
	next_state = states["Rolling"]


func on_enter():
	playback.travel(RUN_ANIMATION)


func on_exit():
	pass
