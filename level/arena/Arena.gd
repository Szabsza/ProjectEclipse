class_name ArenaLevel extends Node2D

@onready var player_spawn_0 : Node2D = $'PlayerSpawns/0'
@onready var player_spawn_1 : Node2D = $'PlayerSpawns/1'

var player_scene : PackedScene = preload('res://characters/player/Player.tscn')


func _ready():
	AudioManager.play_ingame_standard_theme()
	InteractionManager.set_process(false)
	
	var index : int = 0
	for i in MultiplayerManager.players:
		var current_player : Player = player_scene.instantiate() as Player
		current_player.name = str(MultiplayerManager.players[i].id)
		add_child(current_player)
		
		if index == 0:
			current_player.global_position = player_spawn_0.global_position
			index += 1
		elif  index == 1:
			current_player.global_position = player_spawn_1.global_position
			index += 1 
			
	
