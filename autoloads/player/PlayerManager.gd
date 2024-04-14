extends Node2D

signal init()

var player : Player


func setup(player : Player):
	self.player = player
		
	InteractionManager.player = player
	HotBarManager.player = player
	
	init.emit()
