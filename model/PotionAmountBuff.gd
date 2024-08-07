class_name PotionAmountBuff extends Buff


func on_buy():
	HotBarManager.increase_health_potions_quantity(1)
	HotBarManager.increase_mana_potions_quantity(1)
