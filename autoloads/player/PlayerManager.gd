extends Node2D

var player : Player

var global_position_x : float = 225
var global_position_y : float = 737

signal init()


func setup(player : Player):
	self.player = player
	player.global_position.x = global_position_x
	player.global_position.y = global_position_y
	InteractionManager.player = player
	StatusManager.player = player
	SaveManager.player = player
	TravelManager.player = player
	HotBarManager.player = player
	
	print(player.collision_layer)
	print(player.collision_mask)
	init.emit()
