class_name GolemSleepingState extends GolemState

const SLEEPING_ANIMATION: String = "sleeping"


func on_enter():
	golem.animation_player.play(SLEEPING_ANIMATION)


func on_exit():
	pass


func state_process(delta):
	if golem.can_see_player() and not golem.dead():
		next_state = states["WakingUp"]


func state_input(event: InputEvent):
	pass


