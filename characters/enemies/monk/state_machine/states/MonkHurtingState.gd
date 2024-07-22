class_name MonkHurtingState extends MonkState

const HURT_ANIMATION : String = "hit"


func on_enter():
	monk.animation_player.connect("animation_finished", _on_animation_finished)
	monk.animation_player.play(HURT_ANIMATION)


func on_exit():
	monk.animation_player.disconnect("animation_finished", _on_animation_finished)


func state_process(delta):
	pass


func state_input(event: InputEvent):
	pass


func _on_animation_finished(anim_name : String):
	if anim_name == HURT_ANIMATION:
		next_state = states["Chasing"]
