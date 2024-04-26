extends Node2D

signal init()

var player : Player = null


func setup(player : Player):
	self.player = player
	init.emit()
