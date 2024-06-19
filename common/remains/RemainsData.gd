class_name RemainsData extends Resource

@export var scene_path : String
@export var position : Vector2
@export var runes_amount : int = 0
@export var picked_up : bool = true


func load_data(remains_data : Dictionary):
	scene_path = remains_data["scene_path"]
	position = remains_data["position"]
	runes_amount = remains_data["runes_amount"]
	picked_up = remains_data["picked_up"]


func to_save() -> Dictionary:
	return {
		"scene_path" : scene_path,
		"position" : position,
		"runes_amount" : runes_amount,
		"picked_up" : picked_up,
	}
