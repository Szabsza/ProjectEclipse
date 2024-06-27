class_name InteractingState extends PlayerState


func on_enter():
	player.facing_direction_locked = true	
	player.velocity = Vector2.ZERO


func on_exit():
	player.facing_direction_locked = false
