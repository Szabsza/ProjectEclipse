class_name ChestData extends Resource

@export var parent_scene_path : String = "" 

@export var loot_item : LootItem
@export var is_opened : bool = false


func set_parent_scene_path(scene_path : String):
	parent_scene_path = scene_path
