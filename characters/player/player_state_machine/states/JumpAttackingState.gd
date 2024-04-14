class_name JumpAttackinState extends PlayerState
 
const JUMP_ATTACK_ANIMATION : String = "jump_attack"

var attacking_direction : int


func on_enter():
	player.facing_direction_locked = true
	
	if player.is_facing_right:
		attacking_direction = 1
	else:
		attacking_direction = -1
	
	playback.travel(JUMP_ATTACK_ANIMATION)
	player.stamina.decrease_current_stamina(player.player_data.attack_stamina_cost)


func state_process(delta):
	player.velocity.x = move_toward(player.velocity.x, attacking_direction * 400, 300)	

func on_exit():
	player.facing_direction_locked = false


func _on_animation_tree_animation_finished(anim_name):
	if anim_name == JUMP_ATTACK_ANIMATION:
		next_state = states["Falling"]
