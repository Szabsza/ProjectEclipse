class_name RollingState extends State

const ROLL_ANIMATION : String = "roll"

var roll_frames : int = 20

func state_process(delta):
	if not character.is_on_floor():
		next_state = states["Falling"]
	
	roll_frames -= 1
	if roll_frames < 0:
		next_state = states["Idling"]
	

func on_enter():
	playback.travel(ROLL_ANIMATION)


func on_exit():
	roll_frames = 20
	character.velocity.x = 0
