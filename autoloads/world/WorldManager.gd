extends Node2D

signal init()

var levels : Dictionary = {}
var current_level_data : LevelData = null


func set_current_level(level : LevelData):
	if is_new_level(level.level_scene_path):
		levels[level.level_scene_path] = level
	current_level_data = level	


func get_level(level_scene_path):
	return levels[level_scene_path]


func is_new_level(level_scene_path : String):
	return not levels.has(level_scene_path)
