class_name LootItem extends Item

@export var global_position : Vector2
@export var picked_up : bool = false


func on_pickup():
	pass


func load_data(loot_item_data : Dictionary):
	global_position.x = loot_item_data["global_position_x"]
	global_position.y = loot_item_data["global_position_y"]
	picked_up = loot_item_data["picked_up"]


func to_save() -> Dictionary:
	return {
		"global_position_x" : global_position.x,
		"global_position_y" : global_position.y,
		"picked_up" : picked_up,
	}
