class_name FireBreatherDeactivatingState extends TrapState

const DEACTIVATING_ANIMATION : String = "deactivate"


func on_enter():
	playback.travel(DEACTIVATING_ANIMATION)


func _on_animation_tree_animation_finished(anim_name):
	if anim_name == DEACTIVATING_ANIMATION:
		next_state = states["Inactive"]
