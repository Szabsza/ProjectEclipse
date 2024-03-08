class_name MonkAttackingState extends State

const ATTACK_A_ANIMATION : String = "attack_chain_a"
const ATTACK_A_ANIMATION_FINISH : String = "attack_chain_a_finish"

func on_enter():
	playback.travel(ATTACK_A_ANIMATION)


func state_process(delta):
	if not character.player_detection_area.is_able_to_see_player:
		next_state = states["Idling"]

	if abs(character.player_detection_area.player_position.x - character.position.x) > 50:
		next_state = states["Idling"]


func _on_animation_tree_animation_finished(anim_name):
	if anim_name == ATTACK_A_ANIMATION:
		playback.travel(ATTACK_A_ANIMATION_FINISH)
	
	if anim_name == ATTACK_A_ANIMATION_FINISH:
		next_state = states["Idling"]
