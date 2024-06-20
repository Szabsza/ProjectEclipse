class_name MerchantData extends Resource

@export var parent_scene_path : String = ""

@export var merchant_name : String = "Merchant"
@export var shop_items : Array[ShopItem]


func set_parent_scene_path(scene_path : String):
	parent_scene_path = scene_path


func load_data(merchant_data : Dictionary):
	parent_scene_path = merchant_data["parent_scene_path"]
	merchant_name = merchant_data["merchant_name"]
	
	shop_items = []
	for shop_item in merchant_data["shop_items"]:
		var _shop_item = ShopItem.new()
		_shop_item.load_data(shop_item)
		shop_items.append(_shop_item)


func to_save() -> Dictionary:
	var _shop_items = []
	for data in shop_items:
		_shop_items.append(data.to_save())
	
	return {
		"parent_scene_path" : parent_scene_path,
		"merchant_name" : merchant_name,
		"shop_items" : _shop_items,
	}
