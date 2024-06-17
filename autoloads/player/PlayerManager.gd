extends Node2D

signal init()

var player : Player = preload("res://characters/player/Player.tscn").instantiate()

var last_interacted_checkpoint : CheckpointData = null


func rest():
	if player == null:
		return
	
	player.health.current_health = player.health.max_health
	player.mana.current_mana = player.mana.max_mana
	player.stamina.current_stamina = player.stamina.max_stamina


func die_and_respawn():
	if player == null:
		return
	
	player.player_data.died = true
	player.player_data.position_where_died = player.global_position
	
	player.health.current_health = player.health.max_health
	player.mana.current_mana = player.mana.max_mana
	player.stamina.current_stamina = player.stamina.max_stamina
	
	if last_interacted_checkpoint != null:
		TravelManager.travel_to_checkpoint(last_interacted_checkpoint)
	else 
		TravelManager.travel_to_level_entry_position()
	

func setup(player : Player):
	self.player = player
	init.emit()
