class_name MerchantAppearingState extends MerchantState

const APPEAR_ANIMATION : String = "apear"


func on_enter():
	merchant.animation_player.connect("animation_finished", _on_animation_finished)
	merchant.animation_player.play(APPEAR_ANIMATION)


func on_exit():
	merchant.animation_player.disconnect("animation_finished", _on_animation_finished)


func state_process(delta):
	pass


func state_input(event: InputEvent):
	pass


func _on_animation_finished(anim_name):
	if anim_name == APPEAR_ANIMATION:
		next_state = states["Idling"]
