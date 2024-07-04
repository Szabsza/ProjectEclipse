class_name WormDyingState extends State

const DEATH_ANIMATION : String = "death"


func on_enter():
	playback.travel(DEATH_ANIMATION)
