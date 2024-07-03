class_name PlayerJumpAttackingState extends PlayerState
 
const JUMP_ATTACK_ANIMATION : String = "jump_attack"

var attacking_direction : int

var player_info : PlayerData


func on_enter():
	player_info = player.player_data
	player.animation_player.connect("animation_finished", _on_animation_finished)
	player.animation_player.play(JUMP_ATTACK_ANIMATION)

	player.facing_direction_locked = true
	if player.is_facing_right:
		attacking_direction = 1
	else:
		attacking_direction = -1

	player.stamina.decrease_current_stamina(player_info.attack_stamina_cost)


func on_exit():
	player.facing_direction_locked = false


func state_process(delta):
	player.velocity.x = move_toward(player.velocity.x, attacking_direction * 400, 300)	


func _on_animation_finished(anim_name):
	if anim_name == JUMP_ATTACK_ANIMATION:
		next_state = states["Falling"]
