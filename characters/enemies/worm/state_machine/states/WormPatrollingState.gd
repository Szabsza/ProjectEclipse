class_name WormPatrollingState extends WormState

const WALKING_ANIMATION : String = "walking"


func on_enter():
	worm.animation_player.play(WALKING_ANIMATION)


func on_exit():
	pass


func state_process(delta):
	if worm.can_see_player():
		next_state = states["Chasing"]


func state_input(event: InputEvent):
	pass

