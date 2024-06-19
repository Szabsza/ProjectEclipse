class_name ShopItem extends Item


@export var cost : int

func on_buy():
	pass


func load_data(shop_item_data : Dictionary):
	cost = shop_item_data["cost"]


func to_save() -> Dictionary:
	return {
		"cost" : cost,
	}
