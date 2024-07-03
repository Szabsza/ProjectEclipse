class_name GolemWakeupState extends GolemState

const APPEARING_ANIMATION: String = "appearance"


func on_enter():
	golem.animation_player.connect("animation_finished", _on_animation_finished)
	golem.animation_player.play(APPEARING_ANIMATION)
	golem.player_detection_area.scale = Vector2(10, 10)
	golem.hud.visible = true


func on_exit():
	golem.animation_player.disconnect("animation_finished", _on_animation_finished)


func state_process(delta):
	pass


func state_input(event: InputEvent):
	pass


func _on_animation_finished(anim_name):
	if anim_name == APPEARING_ANIMATION:
		next_state = states["Chasing"]
