class_name MonkIdlingState extends State

const IDLE_ANIMATION : String = "idle"

func on_enter():
	playback.travel(IDLE_ANIMATION)



