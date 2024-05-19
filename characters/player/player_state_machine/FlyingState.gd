class_name FlyingState extends PlayerState

@onready var launch_timer : Timer = $LaunchTimer

const JUMP_ANIMATION : String = "jump"
const FALL_ANIMATION : String = "fall"
const IDLING_ANIMATION : String = "idle"


func on_enter():	
	playback.travel(IDLING_ANIMATION)
	launch_timer.start()
	player.velocity.x = 0
	is_able_to_move = false
	player.wings_sprite.launch()
	

func state_process(delta):
	if player.velocity.y > 0 and not player.is_on_floor():
		next_state = states["Falling"]
	
	if is_able_to_move:
		player.velocity.x = player.direction.x * player.player_data.speed


func _on_launch_timer_timeout() -> void:
	player.mana.decrease_current_mana(HotBarManager.wings.mana_cost)
	playback.travel(JUMP_ANIMATION)
	player.velocity.y = player.player_data.jump_velocity * 2
	is_able_to_move = true

