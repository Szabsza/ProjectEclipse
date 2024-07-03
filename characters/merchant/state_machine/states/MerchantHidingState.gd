class_name MerchantHidingState extends MerchantState

const HIDDEN_ANIMATION : String = "hidden"


func on_enter():
	merchant.animation_player.play(HIDDEN_ANIMATION)


func on_exit():
	pass
	

func state_process(delta):
	if merchant.player_detection_area.is_able_to_see_player:
		next_state = states["Appearing"]


func state_input(event: InputEvent):
	pass
