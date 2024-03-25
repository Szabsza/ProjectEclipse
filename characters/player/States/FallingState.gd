class_name FallingState extends State

@export var speed : float = 200.0
@export var fall_acceleration : float = 0.25
@export var jump_velocity : float = -300.0

const FALL_ANIMATION : String = "fall"

func state_process(delta):
	if character.is_on_floor() and character.velocity.x != 0:
		next_state = states["Running"]
	elif character.is_on_floor():
		next_state = states["Idling"]
		
	character.velocity.x = character.direction.x * speed


func state_input(event : InputEvent):
	if event.is_action_pressed("jump") \
	and not character.has_double_jumped \
	and  character.stamina.current_stamina - character.JUMP_STAMINA_COST > 0:
		perform_jump()


func perform_jump():
	character.velocity.y = jump_velocity
	character.has_double_jumped = true
	next_state = states["Jumping"]
	

func on_enter():
	playback.travel(FALL_ANIMATION)


func on_exit():
	pass
