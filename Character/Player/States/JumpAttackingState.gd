class_name JumpAttackinState extends State
 
const JUMP_ATTACK_ANIMATION : String = "jump_attack"

var attacking_direction : int


func on_enter():
	character.facing_direction_locked = true
	
	if character.is_facing_right:
		attacking_direction = 1
	else:
		attacking_direction = -1
	
	playback.travel(JUMP_ATTACK_ANIMATION)


func state_process(delta):
	character.velocity.x = move_toward(character.velocity.x, attacking_direction * 400, 300)	

func on_exit():
	character.facing_direction_locked = false


func _on_animation_tree_animation_finished(anim_name):
	if anim_name == JUMP_ATTACK_ANIMATION:
		next_state = states["Falling"]
