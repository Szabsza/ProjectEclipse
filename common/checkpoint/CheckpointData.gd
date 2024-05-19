class_name CheckpointData extends Resource

@export var parent_scene_path : String = "" 

@export var checkpoint_name : String
@export var is_activated : bool = false
@export var global_position : Vector2


func set_parent_scene_path(scene_path : String):
	parent_scene_path = scene_path
