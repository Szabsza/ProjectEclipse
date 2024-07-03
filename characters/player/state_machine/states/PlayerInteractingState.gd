class_name PlayerInteractingState extends PlayerState


func on_enter():
	player.facing_direction_locked = true	
	player.velocity = Vector2.ZERO


func on_exit():
	player.facing_direction_locked = false


func state_process(delta):
	pass


func state_input(event: InputEvent):
	pass
