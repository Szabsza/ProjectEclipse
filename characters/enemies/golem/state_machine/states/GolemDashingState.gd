class_name GolemDashingState extends GolemState

const GLOWING_ANIMATION : String = "buffed"


func on_enter():
	golem.animation_player.connect("animation_finished", _on_animation_finished)
	golem.animation_player.play(GLOWING_ANIMATION)


func on_exit():
	golem.velocity = Vector2.ZERO


func state_process(delta):
	var direction: Vector2 = (golem.player_position() - golem.position).normalized()

	golem.velocity.x = direction.x * 750
	if direction.x < 0:
		golem.sprite.scale.x = -1
	else:
		golem.sprite.scale.x = 1


func state_input(event: InputEvent):
	pass


func _on_animation_finished(anim_name):
	if anim_name == GLOWING_ANIMATION:
		next_state = states["Chasing"]
		
