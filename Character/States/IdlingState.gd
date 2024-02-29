extends State
class_name IdlingState

@export var jump_velocity : float = -400.0

var JUMPING_STATE : State = JumpingState.new()

func state_input(event: InputEvent):
	if (event.is_action_pressed("jump")):
		perform_jump()

func perform_jump():
	player.velocity.y = jump_velocity
	next_state = JUMPING_STATE
