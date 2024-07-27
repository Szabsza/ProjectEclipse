extends Node2D

signal init()

const PLAYER_SCENE_PATH : String = "res://characters/player/Player.tscn"
const PLAYER_RESOURCE_PATH : String = "res://resources/player_data_0.tres" 

var player_data : PlayerData = null
var player : Player = null


func load_player_data_from_resource():
	player_data = ResourceLoader.load(PLAYER_RESOURCE_PATH)


func _ready():
	load_player_data_from_resource()


func setup(_player : Player):
	player = _player


func rest():
	player_data.health.current_health = player_data.health.max_health
	player_data.mana.current_mana = player_data.mana.max_mana
	player_data.stamina.current_stamina = player_data.stamina.max_stamina


func die_and_respawn(position_where_died : Vector2):
	player_data.died = true
	player_data.position_where_died = position_where_died
	player_data.scene_path_where_died = WorldManager.current_level_data.level_scene_path
	player_data.lost_runes_amount = player_data.runes_held.amount
	
	player_data.runes_held.amount = 0
	player_data.health.current_health = player_data.health.max_health
	player_data.mana.current_mana = player_data.mana.max_mana
	player_data.stamina.current_stamina = player_data.stamina.max_stamina
	
	if player_data.last_interacted_checkpoint != null:
		TravelManager.travel_to_checkpoint(player_data.last_interacted_checkpoint)
	else: 
		TravelManager.travel_to_level_entry_position()


func died() -> bool:
	return player_data.died


func set_last_interacted_checkpoint(checkpoint_data : CheckpointData):
	player_data.last_interacted_checkpoint = checkpoint_data


func died_on_the_same_scene(scene_path) -> bool:
	return scene_path == player_data.scene_path_where_died


func is_loaded_player() -> bool:
	return player_data != null
