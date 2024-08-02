class_name ArenaLevel extends Node2D

@onready var player_spawn : Node2D = $PlayerSpawns
@onready var arena_hud : ArenaHud = $ArenaHud
@onready var single_player : Player = $Player
@onready var countdown_timer : Timer = $Timer
@onready var start_position_a : Node2D = $StartingPointA
@onready var start_position_b : Node2D = $StartingPointB


func _ready():
	AudioManager.play_ingame_standard_theme()
	single_player.hud.visible = false
	MultiplayerManager.player_spawn_node = player_spawn
	MultiplayerManager.single_player = single_player
	MultiplayerManager.connect("on_player_joined", on_player_joined)


@rpc('call_local')
func place_players_to_their_starting_position():
	var player_a : Player = player_spawn.get_children()[0] as Player
	var player_b : Player = player_spawn.get_children()[1] as Player
	
	player_a.global_position = start_position_a.global_position
	player_b.global_position = start_position_b.global_position


@rpc('call_local')
func hide_player_huds():
	for player : Player in player_spawn.get_children() as Array[Player]:
		player.hud.visible = false


@rpc('call_local')
func setup_player_huds():
	var player_a : Player = player_spawn.get_children()[0] as Player
	var player_b : Player = player_spawn.get_children()[1] as Player
	
	arena_hud.setup_player_a(player_a)
	arena_hud.setup_player_b(player_b)
	

func on_player_joined() -> void:
	hide_player_huds.rpc()
	arena_hud.start_count_down.rpc()
	place_players_to_their_starting_position.rpc()
	setup_player_huds.rpc()
	
