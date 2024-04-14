class_name Key extends LootItem


func on_pickup():
	HotBarManager.increase_keys(self.quantity)
