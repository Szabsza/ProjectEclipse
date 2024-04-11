class_name MerchantHidingState extends State

const HIDDEN_ANIMATION : String = "hidden"


func on_enter():
	playback.travel(HIDDEN_ANIMATION)


func state_process(delta):
	if character.player_detection_area.is_able_to_see_player:
		next_state = states["Apearing"]
