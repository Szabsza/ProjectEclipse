class_name MerchantData extends Resource

@export var parent_scene_path : String = ""

@export var merchant_name : String = "Merchant"
@export var shop_items : Array[ShopItem]


func set_parent_scene_path(scene_path : String):
	parent_scene_path = scene_path
