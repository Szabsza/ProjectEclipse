class_name GolemMeleeAttackingState extends GolemState

const MELEE_ATTACK_ANIMATION: String = "melee_attack"


func on_enter():
	golem.animation_player.connect("animation_finished", _on_animation_finished)
	golem.animation_player.play(MELEE_ATTACK_ANIMATION)
	golem.velocity.x = golem.player_detection_area.player.velocity.x / 1.1


func on_exit():
	golem.animation_player.disconnect("animation_finished", _on_animation_finished)


func state_process(delta):
	pass


func state_input(event: InputEvent):
	pass


func _on_animation_finished(anim_name):
	if anim_name == MELEE_ATTACK_ANIMATION:
		next_state = states["Chasing"]
