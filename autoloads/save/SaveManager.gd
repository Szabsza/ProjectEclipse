extends Node2D

var save_path : String = "user://save.tres"


func _ready():
	verify_save_directory()


func verify_save_directory():
	DirAccess.make_dir_absolute(save_path)


func load_save_data() -> SaveData:
	var save_data = SaveData.new()
	save_data.player_data = PlayerManager.player.player_data
	
	save_data.health_potions = HotBarManager.health_potion
	save_data.mana_potion = HotBarManager.mana_potion
	save_data.bracelet = HotBarManager.bracelet
	save_data.necklace = HotBarManager.necklace
	save_data.wings = HotBarManager.wings
	
	save_data.current_level_data = WorldManager.current_level_data
	save_data.levels = WorldManager.levels

	return save_data


func save_game():
	var save_data = load_save_data()
	print(save_data.to_save())
