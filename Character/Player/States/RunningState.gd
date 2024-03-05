class_name RunningState extends State

@export var jump_velocity : float = -300.0
@export var dash_speed : float = 1.0
@export var dash_velocity : float = 500
@export var run_speed : float = 200.0
@export var minimum_run_speed : float = 0.005
@export var run_acceleration : float = 0.25

const RUN_ANIMATION : String = "run"

func state_process(delta):
	if character.velocity.y > 0 and not character.is_on_floor():
		next_state = states["Falling"]
	elif character.direction.x == 0:
		next_state = states["Idling"]
	
	character.velocity.x = character.direction.x * run_speed


func state_input(event: InputEvent):
	if event.is_action_pressed("jump"):
		perform_jump()
	
	if event.is_action_pressed("dash"):
		perform_dash()
	
	if event.is_action_pressed("attack"):
		perform_attack()
	

func perform_jump():
	character.velocity.y = jump_velocity
	next_state = states["Jumping"]


func perform_dash():
	if character.is_facing_right:
		character.velocity.x = move_toward(300, 1 * dash_velocity, dash_speed)
	else:
		character.velocity.x = move_toward(-300, -1 * dash_velocity, dash_speed)
	
	next_state = states["Rolling"]


func perform_attack():
	next_state = states["Attacking"]


func on_enter():
	playback.travel(RUN_ANIMATION)
	character.has_double_jumped = false


func on_exit():
	pass
