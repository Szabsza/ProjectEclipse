extends Node2D

@export var LOADING_SCENE_PATH : String
@export var RUINS_SCENE_PATH : String
@export var DUNGEON_SCENE_PATH : String

var current_scene : PackedScene = null

var scene_loading_progress : Array = []
var scene_loading_status : int = 0


func change_scene_to(scene_path : String):
	get_tree().change_scene_to_packed(load(LOADING_SCENE_PATH))
	
	ResourceLoader.load_threaded_request(scene_path)
	while scene_loading_status != ResourceLoader.THREAD_LOAD_LOADED:
		scene_loading_status = ResourceLoader.load_threaded_get_status(scene_path, scene_loading_progress)
		
	var new_scene = ResourceLoader.load_threaded_get(scene_path)
	get_tree().change_scene_to_packed(new_scene)


