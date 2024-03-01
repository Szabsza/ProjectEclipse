class_name JumpingState extends State

@export var speed : float = 200.0

const JUMP_ANIMATION : String = "jump"

func state_process(delta):
	if player.velocity.y > 0 and not player.is_on_floor():
		next_state = states["Falling"]
	
	player.velocity.x = player.direction.x * speed
	

func on_enter():
	playback.travel(JUMP_ANIMATION)


func on_exit():
	pass
