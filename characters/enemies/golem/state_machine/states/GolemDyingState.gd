class_name GolemDyingState extends GolemState

const DEATH_ANIMATION: String = "death"


func on_enter():
	golem.animation_player.connect("animation_finished", _on_animation_finished)
	golem.animation_player.play(DEATH_ANIMATION)

	golem.velocity.x = 0
	golem.head_pivot.visible = false
	golem.top_pivot.visible = false
	golem.left_pivot.visible = false
	golem.right_pivot.visible = false
	golem.projectile.visible = false


func on_exit():
	golem.animation_player.disconnect("animation_finished", _on_animation_finished)


func state_process(delta):
	pass


func state_input(event: InputEvent):
	pass


func _on_animation_finished(anim_name):
	golem.hud.show_victory_toast()
