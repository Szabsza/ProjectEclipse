class_name Buff extends ShopItem

@export var behaviors : Array[BuffBehavior]


func apply():
	BuffManager.apply_buff(self)


func on_buy():
	apply()
