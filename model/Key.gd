class_name Key extends LootItem


func on_pickup():
	picked_up = true
	HotBarManager.increase_keys(self.quantity)
