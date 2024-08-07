class_name PlayerAttackingState extends PlayerState

const ATTACK_A_ANIMATION : String = "attack_chain_a"
const ATTACK_A_FINISH_ANIMATION : String = "attack_chain_a_finish"
const ATTACK_B_ANIMATION : String = "attack_chain_b"
const ATTACK_B_FINISH_ANIMATION : String = "attack_chain_b_finish"
const ATTACK_C_ANIMATION : String = "attack_chain_c"

@onready var timer : Timer = $Timer
@onready var idlling_timer : Timer = $IdlingTimer

var attacking_direction : int
var player_info : PlayerData


func on_enter():
	player.refresh_hitboxes()
	player.refresh_hurtbox()
	player_info = player.player_data
	player.animation_player.connect("animation_finished", _on_animation_finished)
	player.animation_player.play(ATTACK_A_ANIMATION)
	player.audio_player.play_sword_fx_a()

	player.facing_direction_locked = true

	if player.is_facing_right:
		attacking_direction = 1
	else:
		attacking_direction = -1

	player.stamina.decrease_current_stamina(player_info.attack_stamina_cost)
	player.velocity.x = attacking_direction * player_info.attack_move_speed


func on_exit():
	player.animation_player.disconnect("animation_finished", _on_animation_finished)
	player.velocity.x = 0
	player.facing_direction_locked = false


func state_process(delta):
	if not player.is_on_floor():
		next_state = states["Falling"]


func state_input(event: InputEvent):
	if not player.is_able_to_move:
		return 
		
	if event.is_action_pressed("attack"):
		timer.start()


func _on_animation_finished(anim_name):
	if anim_name == ATTACK_A_ANIMATION:
		player.velocity.x = attacking_direction * player_info.attack_move_speed
		if timer.is_stopped():
			player.animation_player.play(ATTACK_A_FINISH_ANIMATION)
		else:
			player.velocity.x = 0
			player.animation_player.play(ATTACK_B_ANIMATION)
			player.audio_player.play_sword_fx_b()
	
	if anim_name == ATTACK_A_FINISH_ANIMATION:
		player.velocity.x = 0
		if idlling_timer.is_stopped():
			next_state = states["Idling"]
	
	if anim_name == ATTACK_B_ANIMATION:
		player.velocity.x = 0
		if timer.is_stopped():
			player.animation_player.play(ATTACK_B_FINISH_ANIMATION)
		else:
			player.velocity.x = attacking_direction * 10
			player.animation_player.play(ATTACK_C_ANIMATION)
			player.audio_player.play_sword_fx_a()
	
	if anim_name == ATTACK_B_FINISH_ANIMATION:
		if idlling_timer.is_stopped():
			next_state = states["Idling"]
	
	if anim_name == ATTACK_C_ANIMATION:
		player.velocity.x = 0
		if idlling_timer.is_stopped():
			next_state = states["Idling"]
