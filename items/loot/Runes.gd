class_name Runes extends LootItem


func on_pickup():
	PlayerManager.player.runes_held.increase_runes(self.quantity)
