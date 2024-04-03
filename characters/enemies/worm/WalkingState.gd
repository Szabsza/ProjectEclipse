class_name WormChasingState extends State

const CHASE_ANIMATION : String = "walking"


func on_enter():
	playback.travel(CHASE_ANIMATION)
