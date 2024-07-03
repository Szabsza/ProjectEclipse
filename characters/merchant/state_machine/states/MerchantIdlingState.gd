class_name MerchantIdlingState extends MerchantState

const IDLE_ANIMATION : String = "idle"


func on_enter():
	merchant.animation_player.play(IDLE_ANIMATION)


func on_exit():
	pass


func state_process(delta):
	print(merchant.animation_player.current_animation)
	if not merchant.player_detection_area.is_able_to_see_player:
		next_state = states["Vanishing"]


func state_input(event: InputEvent):
	pass
