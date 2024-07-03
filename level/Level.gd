class_name Level extends Node2D

@onready var checkpoints : Array = get_tree().get_nodes_in_group("checkpoint")
@onready var chests : Array = get_tree().get_nodes_in_group("chest")
@onready var merchants : Array = get_tree().get_nodes_in_group("merchant")
@onready var chest_loots : Array = get_tree().get_nodes_in_group("chest_loot")
@onready var doors : Array = get_tree().get_nodes_in_group("door")

@onready var level_entry_point : Marker2D = $LevelEntryPoint

var level_data : LevelData
var level_scene_path : String


func spawn_player(position : Vector2):
	var player : Player = preload("res://characters/player/Player.tscn").instantiate()
	player.global_position = position
	add_child(player)


func spawn_remains(scene_path : String, position : Vector2, runes_amount : int):
	var remains : Remains = preload("res://common/remains/Remains.tscn").instantiate()
	remains.setup(scene_path, runes_amount, position)
	add_child(remains)


func load_level_data():
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
			
		#for merchant in merchants as Array[GhostMerchant]:
			#merchant.merchant_data.set_parent_scene_path(level_data.level_scene_path)
			#level_data.add_merchant(merchant.merchant_data)
		
		for chest_loot in chest_loots as Array[ChestLootItem]:
			level_data.add_chest_loot(chest_loot.loot_item)
		
		for door in doors as Array[Door]:
			level_data.add_door(door.door_data)
	else:
		level_data = WorldManager.get_level(level_scene_path)
		

func load_level() -> void:
	level_scene_path = get_tree().current_scene.scene_file_path
	load_level_data()
	WorldManager.set_current_level(level_data)
	
	if PlayerManager.died() and PlayerManager.died_on_the_same_scene(level_scene_path):
		spawn_remains(PlayerManager.player_data.scene_path_where_died, PlayerManager.player_data.position_where_died, PlayerManager.player_data.lost_runes_amount)
	
	if TravelManager.teleported_to_checkpoint:
		if PlayerManager.died():
			if PlayerManager.last_interacted_checkpoint == null:
				spawn_player(level_entry_point.global_position)
				PlayerManager.player_data.died = false
			else:
				spawn_player(TravelManager.checkpoint_teleported_to.global_position)
				PlayerManager.player_data.died = false
		else:
			spawn_player(TravelManager.checkpoint_teleported_to.global_position)
		TravelManager.clear()
		return
		
	if TravelManager.went_trough_door:
		spawn_player(TravelManager.door_went_trough_to.global_position)
		TravelManager.clear()
		return
		
	spawn_player(level_entry_point.global_position)
	
