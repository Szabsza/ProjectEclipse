class_name FallingState extends State

@export var speed : float = 200.0
@export var fall_acceleration : float = 0.25
@export var jump_velocity : float = -300.0

const FALL_ANIMATION : String = "fall"

func state_process(delta):
	if player.is_on_floor() and player.velocity.x != 0:
		next_state = states["Running"]
	elif player.is_on_floor():
		next_state = states["Idling"]
		
	player.velocity.x = player.direction.x * speed


func state_input(event : InputEvent):
	if event.is_action_pressed("jump") and not player.has_double_jumped:
		perform_jump()


func perform_jump():
	player.velocity.y = jump_velocity
	player.has_double_jumped = true
	next_state = states["Jumping"]
	

func on_enter():
	playback.travel(FALL_ANIMATION)


func on_exit():
	pass
