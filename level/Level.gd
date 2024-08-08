class_name Level extends Node2D

@onready var checkpoints : Array = get_tree().get_nodes_in_group("checkpoint")
@onready var chests : Array = get_tree().get_nodes_in_group("chest")
@onready var merchants : Array = get_tree().get_nodes_in_group("merchant")
@onready var chest_loots : Array = get_tree().get_nodes_in_group("chest_loot")
@onready var doors : Array = get_tree().get_nodes_in_group("door")

@onready var level_entry_point : Marker2D = $LevelEntryPoint

var level_data : LevelData
var level_scene_path : String = ""


func load_level_data():
	level_scene_path = get_tree().current_scene.scene_file_path
	
	if WorldManager.is_new_level(level_scene_path):
		level_data = LevelData.new()
		level_data.set_level_name(get_name())
		level_data.set_level_scene_path(level_scene_path)
	
		for chest in chests as Array[Chest]:
			chest.chest_data.set_parent_scene_path(level_data.level_scene_path)
			level_data.add_chest(chest.chest_data)
		
		for checkpoint in checkpoints as Array[Checkpoint]:
			checkpoint.checkpoint_data.set_parent_scene_path(level_data.level_scene_path)
			level_data.add_checkpoint(checkpoint.checkpoint_data)
			
		for merchant in merchants as Array[GhostMerchant]:
			merchant.merchant_data.set_parent_scene_path(level_data.level_scene_path)
			level_data.add_merchant(merchant.merchant_data)
		
		for chest_loot in chest_loots as Array[ChestLootItem]:
			level_data.add_chest_loot(chest_loot.loot_item)
		
		for door in doors as Array[Door]:
			level_data.add_door(door.door_data)
	else:
		level_data = WorldManager.get_level(level_scene_path)
		
	WorldManager.set_current_level(level_data)


func spawn_player():
	if TravelManager.teleported_to_checkpoint:
		if PlayerManager.died():
			if PlayerManager.player_data.last_interacted_checkpoint == null:
				PlayerManager.spawn_player(level_entry_point.global_position)
			else:
				PlayerManager.spawn_player(TravelManager.checkpoint_teleported_to.global_position)
		else:
			PlayerManager.spawn_player(TravelManager.checkpoint_teleported_to.global_position)
			TravelManager.clear()
		return
		
		
	if TravelManager.went_trough_door:
		PlayerManager.spawn_player(TravelManager.door_went_trough_to.global_position)
		TravelManager.clear()
		return

	PlayerManager.spawn_player(level_entry_point.global_position)
	

func spawn_remains():
	if PlayerManager.died_on_the_same_scene(level_scene_path):
		PlayerManager.spawn_remains()


func load_level() -> void:
	load_level_data()
	spawn_remains()
	spawn_player()
	
	
	
	
		
	
	
