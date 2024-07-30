class_name MainMenu extends Control

const RUINS_LEVEL_PATH : String = "res://level/ruins/Ruins.tscn" 
const LOADING_SCENE : String = "res://level/loading/Loading.tscn"
const ARENA_LEVEL_PATH : String = "res://level/arena/Arena.tscn"

@onready var standard_menu : VBoxContainer = $StandardMenu
@onready var arena_menu : VBoxContainer = $ArenaMenu


func _ready():
	standard_menu.visible = true
	arena_menu.visible = false
	AudioManager.play_main_menu_theme()


func _on_continue_pressed():
	LoadManager.load_game()
	SceneManager.change_scene_to(WorldManager.current_level_data.level_scene_path)
	

func _on_new_game_pressed():
	SceneManager.change_scene_to(RUINS_LEVEL_PATH)


func _on_arena_pressed() -> void:
	standard_menu.visible = false
	arena_menu.visible = true
	
	
func _on_how_to_play_pressed():
	pass


func _on_exit_pressed():
	get_tree().quit()


func _on_host_game_pressed() -> void:
	MultiplayerManager.host_game()


func _on_join_game_pressed() -> void:
	MultiplayerManager.join_game()
	
	
func _on_start_game_pressed() -> void:
	MultiplayerManager.start_game.rpc()


func _on_back_pressed() -> void:
	standard_menu.visible = true
	arena_menu.visible = false


func _on_player_name_text_changed(new_text: String) -> void:
	MultiplayerManager.player_name = new_text


