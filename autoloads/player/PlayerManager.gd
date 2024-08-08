extends Node2D

signal init()

var player_scene : PackedScene = preload("res://characters/player/Player.tscn")
var remains_scene : PackedScene = preload("res://common/remains/Remains.tscn")

var player_data : PlayerData = null
var player : Player = null

var remains : Remains = null
var remains_data : RemainsData = null


func _ready() -> void:
	player = player_scene.instantiate() as Player
	player.name = "1"
	player_data = player.player_data
	
	remains = remains_scene.instantiate() as Remains
	

func spawn_player(_position : Vector2):
	player.player_data.died = false
	player.global_position = _position
	add_child(player)


func remove_player():
	remove_child(player)


func spawn_remains():
	remains.global_position = remains.position_to_place
	remains.z_index = 20
	add_child(remains)


func remove_remains():
	remove_child(remains)


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
	
	HotBarManager.reset_potions()
	
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
