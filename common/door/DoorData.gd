class_name DoorData extends Resource

@export var parent_scene_path : String = ""

@export var required_key : Key = null
@export var is_unlocked : bool = false


func set_parent_scene_path(scene_path : String):
	parent_scene_path = scene_path