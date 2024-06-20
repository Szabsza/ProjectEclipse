class_name Runes extends LootItem


func on_pickup():
	picked_up = true
	PlayerManager.player.runes_held.increase_runes(self.quantity)
