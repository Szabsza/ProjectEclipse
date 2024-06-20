class_name Necklace extends ShopItem


func on_buy():
	HotBarManager.set_necklace(self)
