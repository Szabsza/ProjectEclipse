class_name LootItem extends Item

@export var global_position : Vector2
@export var picked_up : bool = false


func on_pickup():
	pass


func load_data(loot_item_data : Dictionary):
	global_position = loot_item_data["global_position"]
	picked_up = loot_item_data["picked_up"]


func to_save() -> Dictionary:
	return {
		"global_position" : global_position,
		"picked_up" : picked_up,
	}
