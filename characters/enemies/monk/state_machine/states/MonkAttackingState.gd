class_name MonkAttackingState extends MonkState

const ATTACK_A_ANIMATION : String = "attack_chain_a"
const ATTACK_A_ANIMATION_FINISH : String = "attack_chain_a_finish"

var monk_info : MonkData


func on_enter():
	monk_info = monk.monk_data
	monk.animation_player.connect("animation_finished", _on_animation_finished)
	monk.animation_player.play(ATTACK_A_ANIMATION)
	monk.velocity.x = 0


func on_exit():
	monk.animation_player.disconnect("animation_finished", _on_animation_finished)


func state_process(delta):
	var direction: Vector2 = (monk.player_position() - monk.global_position).normalized()
	if direction.x < 0:
		monk.sprite.scale.x = -1
	else:
		monk.sprite.scale.x = 1


func _on_animation_finished(anim_name):
	if anim_name == ATTACK_A_ANIMATION:
		monk.animation_player.play(ATTACK_A_ANIMATION_FINISH)

	if anim_name == ATTACK_A_ANIMATION_FINISH:
		next_state = states["Idling"]
