extends Node2D

var save_path : String = "user://game.save"
var scene_to_load : String = ""	


func set_scene_to_load(scene_path : String):
	scene_to_load = scene_path


func load_game():
	if not FileAccess.file_exists(save_path):
		return
	
	var save_file = FileAccess.open(save_path, FileAccess.READ)
	var json = save_file.get_as_text()
	
	var save_data_dict = JSON.parse_string(json)
	
	var save_data = SaveData.new()
	save_data.load_data(save_data_dict)
	
	ResourceSaver.save(save_data.player_data, PlayerManager.PLAYER_RESOURCE_PATH)
	PlayerManager.load_player_data_from_resource()
	
	HotBarManager.health_potion = save_data.health_potions 
	HotBarManager.mana_potion = save_data.mana_potion
	HotBarManager.bracelet = save_data.bracelet
	HotBarManager.necklace = save_data.necklace
	HotBarManager.wings = save_data.wings
	HotBarManager.key_quantity = save_data.key_quantity
	
	WorldManager.current_level_data = save_data.current_level_data
	WorldManager.levels = save_data.levels 
