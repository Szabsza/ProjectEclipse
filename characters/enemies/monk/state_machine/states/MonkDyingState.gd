class_name MonkDyingState extends MonkState

const DEATH_ANIMATION : String = "death"


func on_enter():
	monk.animation_player.connect("animation_finished", _on_animation_finished)
	monk.animation_player.play(DEATH_ANIMATION)
	monk.velocity = Vector2.ZERO


func on_exit():
	monk.animation_player.disconnect("animation_finished", _on_animation_finished)


func state_process(delta):
	pass


func state_input(input : InputEvent):
	pass


func _on_animation_finished(anim_name : String):
	if anim_name == DEATH_ANIMATION:
		monk.visible = false
