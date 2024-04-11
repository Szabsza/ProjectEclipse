class_name MerchantApearingState extends State

const APEAR_ANIMATION : String = "apear"


func on_enter():
	playback.travel(APEAR_ANIMATION)
	

func _on_animation_tree_animation_finished(anim_name):
	if anim_name == APEAR_ANIMATION:
		next_state = states["Idling"]
