extends Node2D

signal init()

var player : Player = preload("res://characters/player/Player.tscn").instantiate()

var last_interacted_checkpoint : CheckpointData = null
var died : bool = false
var position_where_died : Vector2
var scene_path_where_died : String
var lost_runes_amount : int

func rest():
	if player == null:
		return
	
	player.health.current_health = player.health.max_health
	player.mana.current_mana = player.mana.max_mana
	player.stamina.current_stamina = player.stamina.max_stamina


func die_and_respawn():
	if player == null:
		return
	
	died = true
	position_where_died = player.global_position
	scene_path_where_died = WorldManager.current_level_data.level_scene_path
	lost_runes_amount = player.player_data.runes_held.amount
	
	player.runes_held.amount = 0
	player.health.current_health = player.health.max_health
	player.mana.current_mana = player.mana.max_mana
	player.stamina.current_stamina = player.stamina.max_stamina
	
	if last_interacted_checkpoint != null:
		TravelManager.travel_to_checkpoint(last_interacted_checkpoint)
	else: 
		TravelManager.travel_to_level_entry_position()
	

func setup(player : Player):
	self.player = player
	init.emit()
