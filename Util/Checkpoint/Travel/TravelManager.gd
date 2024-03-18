extends Node2D

@onready var checkpoints = get_tree().get_nodes_in_group("checkpoint")
@onready var player : Player = get_tree().get_first_node_in_group("player")


func travel_to_checkpoint(checkpoint : Checkpoint):
	if checkpoints.find(checkpoint) != -1:
		player.global_position = checkpoint.global_position 


func get_available_checkpoints():
	return checkpoints.filter(func(checkpoint): return checkpoint.is_activated)
	
