extends Node2D

var player : Player = null


func travel_to_checkpoint(checkpoint : Checkpoint):
	if WorldManager.checkpoints.find(checkpoint) != -1:
		player.global_position = checkpoint.global_position 


func get_available_checkpoints():
	return WorldManager.checkpoints.filter(func(checkpoint): return checkpoint.is_activated)
	

func get_available_checkpoints_name():
	return get_available_checkpoints().map(func(checkpoint): return checkpoint.name)
