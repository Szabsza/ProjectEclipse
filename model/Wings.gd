class_name Wings extends LootItem

@export var mana_cost : int = 10


func on_pickup():
	picked_up = true
	HotBarManager.set_wings(self)
