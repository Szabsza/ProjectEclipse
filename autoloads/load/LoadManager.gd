extends Node2D

var save_path : String = "user://game.save"


func load_game_data(game_data):
	await PlayerManager.init
	
	PlayerManager.player.global_position.x = game_data["player_global_position_x"]
	PlayerManager.player.global_position.y = game_data["player_global_position_y"]
	PlayerManager.player.health.max_health = game_data["max_health"]
	PlayerManager.player.health.current_health = game_data["current_health"]
	PlayerManager.player.stamina.max_stamina = game_data["max_stamina"]
	PlayerManager.player.stamina.current_stamina = game_data["current_stamina"]
	PlayerManager.player.mana.max_mana = game_data["max_mana"]
	PlayerManager.player.mana.current_mana = game_data["current_mana"]
	
	RuneManager.runes_held = game_data["runes_held"]
	
	HotBarManager.health_potion_quantity = game_data["health_potion_quantity"]
	HotBarManager.health_potion_max_quantity = game_data["health_potion_max_quantity"]
	HotBarManager.mana_potion_quantity = game_data["mana_potion_quantity"]
	HotBarManager.mana_potion_max_quantity = game_data["mana_potion_max_quantity"]
	
	StatusManager.health_points = game_data["health_points"]
	StatusManager.stamina_points = game_data["stamina_points"]
	StatusManager.mana_points = game_data["mana_points"]
	StatusManager.power_points = game_data["power_points"]
	StatusManager.level = game_data["level"]
	StatusManager.runes_needed = game_data["runes_needed"]
	
	await WorldManager.init
	
	WorldManager.remains.global_position.x = game_data["remains_position_x"]
	WorldManager.remains.global_position.y = game_data["remains_position_y"]
	WorldManager.remains.runes_amount = game_data["remains_runes_amount"]
	
	for level in game_data["activated_checkpoints"]:
		for activated_checkpoint in game_data["activated_checkpoints"][level]:
			for checkpoint in WorldManager.checkpoints:
				if activated_checkpoint == checkpoint.get_name():
					checkpoint.load_as_activated()
	
	for level in game_data["opened_chests"]:
		for opened_chest in game_data["opened_chests"][level]:
			for chest in WorldManager.chests:
				if opened_chest == chest.get_name():
					chest.load_as_opened()
	

func load_game():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		var game_data = file.get_var(true)
		print(game_data)
		load_game_data(game_data)
