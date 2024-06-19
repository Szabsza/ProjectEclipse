extends Node2D

var save_path : String = "user://save.tres"
var scene_to_load : String = ""	


func set_scene_to_load(scene_path : String):
	scene_to_load = scene_path


func load_game():
	var save_data = load(save_path)
	
	print(save_data.player_data.runes_held.amount)
	
	PlayerManager.player.player_data = save_data.player_data
	
	HotBarManager.health_potion = save_data.health_potions 
	HotBarManager.mana_potion = save_data.mana_potion
	HotBarManager.bracelet = save_data.bracelet
	HotBarManager.necklace = save_data.necklace
	HotBarManager.wings = save_data.wings
	
	WorldManager.current_level_data = save_data.current_level_data
	WorldManager.levels = save_data.levels 
