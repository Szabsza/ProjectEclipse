class_name FireTrapActivatingState extends TrapState

const ACTIVATING_ANIMATION : String = "activate"


func on_enter():
	playback.travel(ACTIVATING_ANIMATION)


func _on_animation_tree_animation_finished(anim_name):
	if anim_name == ACTIVATING_ANIMATION:
		next_state = states["Active"]
