extends Control

@export var scene_name : String = ""

@onready var label : Label = $Label

var progress : Array = []
var scene_load_status : int = 0


func _ready():
	ResourceLoader.load_threaded_request(scene_name)


func _process(delta):
	if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
		var new_scene = ResourceLoader.load_threaded_get(scene_name)
		get_tree().change_scene_to_packed(new_scene)
		
	scene_load_status = ResourceLoader.load_threaded_get_status(scene_name, progress)
	label.text = "Loading... " + str(floor(progress[0]*100)) + "%"
