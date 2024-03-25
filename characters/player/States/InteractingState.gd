class_name InteractingState extends State


func on_enter():
	character.facing_direction_locked = true	


func on_exit():
	character.facing_direction_locked = false
