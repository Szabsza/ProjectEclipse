class_name MonkSpecialAttackingState extends MonkState

const SPECIAL_ATTACK_ANIMATION : String = "special_attack"

var monk_info : MonkData
var rng = RandomNumberGenerator.new()


func on_enter():
	monk_info = monk.monk_data
	monk.animation_player.connect("animation_finished", _on_animation_finished)
	monk.animation_player.play(SPECIAL_ATTACK_ANIMATION)
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
	if anim_name == SPECIAL_ATTACK_ANIMATION:
		var choice = rng.randf()
		if choice < monk_info.P_FOLLOW_UP_ATTACK:
			next_state = states["Attacking"]
		else:
			next_state = states["Idling"]
