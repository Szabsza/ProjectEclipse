class_name MerchantVanishingState extends State

const VANISH_ANIMATION : String = "vanish"


func on_enter():
	playback.travel(VANISH_ANIMATION)


func _on_animation_tree_animation_finished(anim_name):
	if anim_name == VANISH_ANIMATION:
		next_state = states["Hiding"]
