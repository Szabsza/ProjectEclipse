class_name MainMenu extends Control

const RUINS_LEVEL_PATH : String = "res://level/ruins/Ruins.tscn" 
const LOADING_SCENE : String = "res://level/loading/Loading.tscn"
const ARENA_LEVEL_PATH : String = "res://level/arena/Arena.tscn"


func _ready():
	AudioManager.play_main_menu_theme()


func _on_continue_pressed():
	LoadManager.load_game()
	SceneManager.change_scene_to(WorldManager.current_level_data.level_scene_path)
	

func _on_new_game_pressed():
	SceneManager.change_scene_to(RUINS_LEVEL_PATH)


func _on_how_to_play_pressed():
	pass


func _on_exit_pressed():
	get_tree().quit()
