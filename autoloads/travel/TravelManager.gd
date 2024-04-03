extends Node2D

var player : Player = null


func travel_to_checkpoint(checkpoint : Checkpoint):
	if WorldManager.checkpoints.find(checkpoint) != -1:
		player.global_position = checkpoint.global_position 


func get_available_checkpoints():
	return WorldManager.checkpoints.filter(func(checkpoint): return checkpoint.is_activated)
	

func get_available_checkpoints_name():
	return get_available_checkpoints().map(func(checkpoint): return checkpoint.name)


func go_trough_door(door : Door):
	if WorldManager.doors.find(door.destination_door) != -1:
		player.global_position = door.destination_door.spawn.global_position


func connect_doors():
	var doors_to_connect = {}
	for door in WorldManager.doors as Array[Door]:
		doors_to_connect[door.door_name] = []
	
	for door in WorldManager.doors as Array[Door]:
		doors_to_connect[door.door_name].append(door)
	
	for key in doors_to_connect.keys():
		if len(doors_to_connect[key]) == 2:
			doors_to_connect[key][0].destination_door = doors_to_connect[key][1]
			doors_to_connect[key][1].destination_door = doors_to_connect[key][0]
		else:
			OS.alert("There are more than 2 doors with the same name!") 
