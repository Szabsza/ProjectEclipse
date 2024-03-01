class_name FallingState extends State

@export var speed : float = 200.0

const FALL_ANIMATION : String = "fall"

func state_process(delta):
	if player.is_on_floor() and player.velocity.x != 0:
		next_state = states["Running"]
	elif player.is_on_floor():
		next_state = states["Idling"]
		
	player.velocity.x = player.direction.x * speed


func on_enter():
	playback.travel(FALL_ANIMATION)


func on_exit():
	pass
