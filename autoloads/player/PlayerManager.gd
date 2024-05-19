extends Node2D

signal init()

var player : Player = preload("res://characters/player/Player.tscn").instantiate()


func rest():
	if player == null:
		return
	
	player.health.current_health = player.health.max_health
	player.mana.current_mana = player.mana.max_mana
	player.stamina.current_stamina = player.stamina.max_stamina


func setup(player : Player):
	self.player = player
	init.emit()
