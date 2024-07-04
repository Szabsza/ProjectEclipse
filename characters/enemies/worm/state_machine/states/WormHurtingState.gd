class_name WormHurtingState extends State

const HURT_ANIMATION : String = "hit"


func on_enter():
	playback.travel(HURT_ANIMATION)
