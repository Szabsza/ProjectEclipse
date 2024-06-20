class_name CheckpointData extends Resource

@export var parent_scene_path : String = "" 

@export var checkpoint_name : String
@export var is_activated : bool = false
@export var global_position : Vector2


func set_parent_scene_path(scene_path : String):
	parent_scene_path = scene_path


func load_data(checkpoint_data : Dictionary):	
	parent_scene_path = checkpoint_data["parent_scene_path"]
	checkpoint_name = checkpoint_data["checkpoint_name"]
	is_activated = checkpoint_data["is_activated"]
	global_position.x = checkpoint_data["global_position_x"]
	global_position.y = checkpoint_data["global_position_y"]


func to_save() -> Dictionary:
	return {
		"parent_scene_path" : parent_scene_path,
		"checkpoint_name" : checkpoint_name,
		"is_activated" : is_activated,
		"global_position_x" : global_position.x,
		"global_position_y" : global_position.y,
	}
