class_name MerchantVanishingState extends MerchantState

const VANISH_ANIMATION : String = "vanish"


func on_enter():
	merchant.animation_player.connect("animation_finished", _on_animation_finished)
	merchant.animation_player.play(VANISH_ANIMATION)


func on_exit():
	merchant.animation_player.disconnect("animation_finished", _on_animation_finished)


func state_process(delta):
	pass


func state_input(event: InputEvent):
	pass


func _on_animation_finished(anim_name):
	if anim_name == VANISH_ANIMATION:
		next_state = states["Hiding"]
