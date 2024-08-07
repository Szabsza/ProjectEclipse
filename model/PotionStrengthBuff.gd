class_name PotionStrengthBuff extends Buff


func on_buy():
	HotBarManager.increase_health_potions_regeneration(25)
	HotBarManager.increase_mana_potions_regeneration(10)
