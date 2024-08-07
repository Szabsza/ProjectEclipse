extends Node2D

@export var LOADING_SCENE_PATH : String
@export var RUINS_SCENE_PATH : String
@export var DUNGEON_SCENE_PATH : String

var current_scene : PackedScene = null

var scene_loading_progress : Array = []
var scene_loading_status : int = 0


func change_scene_to(scene_path : String):
	PlayerManager.remove_player()
	LoadManager.scene_to_load = scene_path
	get_tree().change_scene_to_packed(load(LOADING_SCENE_PATH))
