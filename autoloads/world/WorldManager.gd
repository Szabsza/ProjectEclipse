extends Node2D

var levels : Array = []
var checkpoints : Array = []
var chests : Array = []
var doors : Array = []
var remains : Remains = null
var current_level : String = ""

signal init()


func setup(levels : Array, checkpoints : Array, chests : Array, doors : Array, remains : Remains):
	self.levels = levels
	self.chests = chests
	self.doors = doors
	self.checkpoints = checkpoints
	self.remains = remains
	
	init.emit()
	

func get_opened_chests_for_each_level():
	var opened_chests = {}
	
	for level in levels:
		var chests : Array = []
		for child in level.get_children():
			if child.is_in_group("chest"):
				chests.append(child)
			
		opened_chests[level.get_name()] = chests.filter(func(chest) : return chest.is_opened).map(func(chest) : return chest.get_name())
	
	return opened_chests


func get_activated_checkpoints_for_each_level():
	var activated_checkpoints = {}
	
	for level in levels:
		var checkpoints : Array = []
		for child in level.get_children():
			if child.is_in_group("checkpoint"):
				checkpoints.append(child)
		
		activated_checkpoints[level.get_name()] = checkpoints.filter(func(checkpoint) : return checkpoint.is_activated).map(func(checkpoint) : return checkpoint.get_name())
	
	return activated_checkpoints
