class_name ChestData extends Resource

@export var parent_scene_path : String = "" 

@export var loot_item : LootItem
@export var is_opened : bool = false


func set_parent_scene_path(scene_path : String):
	parent_scene_path = scene_path


func load_data(chest_data : Dictionary):	
	parent_scene_path = chest_data["parent_scene_path"]
	is_opened = chest_data["is_opened"]
	
	var _loot_item = LootItem.new()
	_loot_item.load_data(chest_data["loot_item"])
	
	loot_item.free()
	loot_item = _loot_item


func to_save() -> Dictionary:
	return {
		"parent_scene_path" : parent_scene_path,
		"is_opened" : is_opened,
		"loot_item" : loot_item.to_save(),
	}
