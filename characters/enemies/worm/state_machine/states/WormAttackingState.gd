class_name WormAttackingState extends WormState

const ATTACK_ANIMATION : String = "attack"


func on_enter():
	worm.animation_player.play(ATTACK_ANIMATION)


func on_exit():
	pass


func state_process(delta):
	if worm.player_position().x < 30:
		next_state = states["Dashing"]


func state_input(event: InputEvent):
	pass


func perform_dash():
	pass
