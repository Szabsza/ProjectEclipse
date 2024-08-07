class_name GoldenBracelet extends Bracelet

func on_buy():
	super.on_buy()
	StatusManager.increase_health(true, 2)
	StatusManager.increase_mana(true, 2)
	StatusManager.increase_stamina(true, 2)
	StatusManager.increase_attack_power(true, 2)
