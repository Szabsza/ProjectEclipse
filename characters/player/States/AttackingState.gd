class_name AttackingState extends State

const ATTACK_A_ANIMATION : String = "attack_chain_a"
const ATTACK_A_FINISH_ANIMATION : String = "attack_chain_a_finish"
const ATTACK_B_ANIMATION : String = "attack_chain_b"
const ATTACK_B_FINISH_ANIMATION : String = "attack_chain_b_finish"
const ATTACK_C_ANIMATION : String = "attack_chain_c"

@export var attack_move_speed : float = 10.0

@onready var timer : Timer = $Timer
@onready var idlling_timer : Timer = $IdlingTimer

var attacking_direction : int

func on_enter():
	character.facing_direction_locked = true
	
	if character.is_facing_right:
		attacking_direction = 1
	else:
		attacking_direction = -1
		
	playback.travel(ATTACK_A_ANIMATION)
	character.stamina.decrease_current_stamina(character.ATTACK_STAMINA_COST)
	character.velocity.x = attacking_direction * attack_move_speed


func state_process(delta):
	if not character.is_on_floor():
		next_state = states["Falling"]


func on_exit():
	character.velocity.x = 0
	character.facing_direction_locked = false


func state_input(event: InputEvent):
	if event.is_action_pressed("attack"):
		timer.start()


func _on_animation_tree_animation_finished(anim_name):
	if anim_name == ATTACK_A_ANIMATION:
		character.velocity.x = attacking_direction * attack_move_speed
		if timer.is_stopped():
			playback.travel(ATTACK_A_FINISH_ANIMATION)
		else:
			character.velocity.x = 0
			playback.travel(ATTACK_B_ANIMATION)
	
	if anim_name == ATTACK_A_FINISH_ANIMATION:
		character.velocity.x = 0
		if idlling_timer.is_stopped():
			next_state = states["Idling"]
	
	if anim_name == ATTACK_B_ANIMATION:
		character.velocity.x = 0
		if timer.is_stopped():
			playback.travel(ATTACK_B_FINISH_ANIMATION)
		else:
			character.velocity.x = attacking_direction * 10
			playback.travel(ATTACK_C_ANIMATION)
	
	if anim_name == ATTACK_B_FINISH_ANIMATION:
		if idlling_timer.is_stopped():
			next_state = states["Idling"]
	
	if anim_name == ATTACK_C_ANIMATION:
		character.velocity.x = 0
		if idlling_timer.is_stopped():
			next_state = states["Idling"]
