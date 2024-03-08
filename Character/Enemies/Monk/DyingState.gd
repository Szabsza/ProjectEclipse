class_name MonkDyingState extends State

const DEATH_ANIMATION : String = "death"


func on_enter():
	playback.travel(DEATH_ANIMATION)


func _on_animation_tree_animation_finished(anim_name):
	if anim_name == DEATH_ANIMATION:
		character.queue_free()

