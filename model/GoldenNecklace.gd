class_name GoldenNecklace extends Necklace

func on_buy():
	super.on_buy()
	StatusManager.increase_attack_power(true, 5)
	var max_health : int = PlayerManager.player_data.health.max_health
	var loss : int = (max_health * 25 / 100) as int
	PlayerManager.player_data.health.decrease_max_health(loss)
