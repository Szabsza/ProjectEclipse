extends Node2D

@onready var levels : Array = get_tree().get_nodes_in_group("level")


func get_opened_chests_for_each_level():
	var opened_chests = {}
	
	for level in levels:
		var chests : Array = []
		for child in level.get_children():
			if child.is_in_group("chest"):
				chests.append(child)
			
		opened_chests[level.get_name()] = chests.filter(func(chest) : return chest.is_opened).map(func(chest) : return chest.get_name())
	
	return opened_chests


func get_activated_checkpoints_for_each_level():
	var activated_checkpoints = {}
	
	for level in levels:
		var checkpoints : Array = []
		for child in level.get_children():
			if child.is_in_group("checkpoint"):
				checkpoints.append(child)
		
		activated_checkpoints[level.get_name()] = checkpoints.filter(func(checkpoint) : return checkpoint.is_activated).map(func(checkpoint) : return checkpoint.get_name())
	
	return activated_checkpoints

