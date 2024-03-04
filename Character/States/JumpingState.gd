class_name JumpingState extends State

@export var speed : float = 200.0
@export var jump_acceleration : float = 0.25
@export var jump_velocity : float = -300.0

const JUMP_ANIMATION : String = "jump"

func state_process(delta):
	if player.velocity.y > 0 and not player.is_on_floor():
		next_state = states["Falling"]
	
	#player.velocity.x = lerp(player.velocity.x, player.direction.x * speed, jump_acceleration)
	player.velocity.x = player.direction.x * speed


func state_input(event : InputEvent):
	if event.is_action_pressed("attack"):
		perform_jumping_attack()
	
	if event.is_action_pressed("jump") and not player.has_double_jumped:
		perform_jump()


func perform_jumping_attack():
	next_state = states["JumpAttacking"]


func perform_jump():
	player.velocity.y = jump_velocity
	player.has_double_jumped = true
	next_state = states["Jumping"]


func on_enter():
	playback.travel(JUMP_ANIMATION)


func on_exit():
	pass
