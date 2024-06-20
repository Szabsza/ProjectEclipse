class_name DoorData extends Resource

@export var parent_scene_path : String = ""

@export var required_key : Key = null
@export var is_unlocked : bool = false
@export var global_position : Vector2


func set_parent_scene_path(scene_path : String):
	parent_scene_path = scene_path


func load_data(door_data : Dictionary):
	parent_scene_path = door_data["parent_scene_path"]
	
	#var _required_key = Key.new()
	#_required_key.load_data(door_data["required_key"])
	#
	#required_key.free()
	#required_key = _required_key
	
	is_unlocked = door_data["is_unlocked"]
	global_position.x = door_data["global_position_x"]
	global_position.y = door_data["global_position_y"]


func to_save() -> Dictionary:
	return {
		"parent_scene_path" : parent_scene_path,
		#"required_key" : required_key.to_save(),
		"is_unlocked" : is_unlocked,
		"global_position_x" : global_position.x,
		"global_position_y" : global_position.y,
	}
