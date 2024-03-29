class_name MainMenu extends Control

const GAME_SCENE : String = "res://levels/Game.tscn"
const LOADING_SCENE : String = "res://levels/Loading.tscn"


func _on_continue_pressed():
	get_tree().change_scene_to_packed(load(LOADING_SCENE))
	LoadManager.load_game()


func _on_new_game_pressed():
	get_tree().change_scene_to_packed(load(LOADING_SCENE))
	

func _on_how_to_play_pressed():
	pass


func _on_exit_pressed():
	get_tree().quit()
