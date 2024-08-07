extends Node2D

var STARTING_LEVEL : String = "res://level/ruins/Ruins.tscn"
var available_checkpoints : Array[CheckpointData] = []

var checkpoint_teleported_to : CheckpointData
var teleported_to_checkpoint : bool = false

var door_went_trough_to : DoorData 
var went_trough_door : bool = false


func add_to_available_checkpoints(checkpoint : CheckpointData):
	available_checkpoints.append(checkpoint)


func get_available_checkpoints():
	return available_checkpoints


func clear():
	checkpoint_teleported_to = null
	teleported_to_checkpoint = false	
	
	door_went_trough_to = null
	went_trough_door = false
	

func travel_to_checkpoint(checkpoint : CheckpointData):
	if available_checkpoints.find(checkpoint) != -1:
		teleported_to_checkpoint = true
		checkpoint_teleported_to = checkpoint
		SceneManager.change_scene_to(checkpoint.parent_scene_path)
	

func go_trough_door(door : DoorData):
	went_trough_door = true
	door_went_trough_to = door
	SceneManager.change_scene_to(door.parent_scene_path)


func travel_to_level_entry_position():
	SceneManager.change_scene_to(STARTING_LEVEL)
