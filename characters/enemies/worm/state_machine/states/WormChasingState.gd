class_name WormChasingState extends WormState

const WALKING_ANIMATION: String = "walk"


func on_enter():
	worm.animation_player.play(WALKING_ANIMATION)


func on_exit():
	pass


func state_process(delta):
	if worm.player_position().x < 100:
		next_state = states["Attacking"]

	if not worm.player_detection_area_alerted.is_able_to_see_player:
		next_state = states["Patrolling"]


func state_input(event: InputEvent):
	pass
