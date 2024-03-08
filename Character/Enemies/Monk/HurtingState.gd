class_name MonkHurtingState extends State

const HIT_ANIMATION : String = "hit"
const IDLE_ANIMATION : String = "idle"

func on_enter():
	playback.travel(HIT_ANIMATION)


func _on_animation_tree_animation_finished(anim_name):
	if anim_name == HIT_ANIMATION:
		next_state = states["Idling"]
