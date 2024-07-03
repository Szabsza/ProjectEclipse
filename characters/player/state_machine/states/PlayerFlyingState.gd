class_name PlayerFlyingState extends PlayerState

@onready var launch_timer : Timer = $LaunchTimer

const JUMP_ANIMATION : String = "jump"
const FALL_ANIMATION : String = "fall"
const IDLING_ANIMATION : String = "idle"

var player_info : PlayerData


func on_enter():
	player_info = player.player_data
	player.animation_player.play(IDLING_ANIMATION)
	launch_timer.start()
	player.velocity.x = 0
	player.is_able_to_move = false
	player.wings_sprite.launch()


func on_exit():
	pass


func state_process(delta):
	if player.velocity.y > 0 and not player.is_on_floor():
		next_state = states["Falling"]
	
	if player.is_able_to_move:
		player.velocity.x = player.direction.x * player_info.speed


func state_input(event: InputEvent):
	pass


func _on_launch_timer_timeout() -> void:
	player.mana.decrease_current_mana(HotBarManager.wings.mana_cost)
	player.animation_player.play(JUMP_ANIMATION)
	player.velocity.y = player_info.jump_velocity * 2
	player.is_able_to_move = true

