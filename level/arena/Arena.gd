class_name ArenaLevel extends Node2D

@onready var player_spawn : Node2D = $PlayerSpawns
@onready var arena_hud : ArenaHud = $ArenaHud
@onready var single_player : Player = $Player

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
	var player_server : Player = player_spawn.get_children()[0] as Player
	var player_client : Player = player_spawn.get_children()[1] as Player
	
	player_server.global_position = start_position_a.global_position
	player_client.global_position = start_position_b.global_position


@rpc('call_local')
func hide_player_huds():
	for player : Player in player_spawn.get_children() as Array[Player]:
		player.hud.visible = false


@rpc('call_local')
func setup_player_huds():
	var player_server : Player = player_spawn.get_children()[0] as Player
	var player_client : Player = player_spawn.get_children()[1] as Player
	
	arena_hud.setup_player_a(player_server)
	arena_hud.setup_player_b(player_client)
	
	
@rpc("call_local")
func setup_player_collisions():
	var player_server : Player = player_spawn.get_children()[0] as Player
	var player_client : Player = player_spawn.get_children()[1] as Player
	
	player_server.setup_hurtbox(0, 8)
	player_server.setup_hitboxes(2, 0)
	
	player_client.setup_hurtbox(0, 2)
	player_client.setup_hitboxes(8, 0)
	
	
@rpc('call_local')
func setup_multiplayer_mode():
	var player_server : Player = player_spawn.get_children()[0] as Player
	var player_client : Player = player_spawn.get_children()[1] as Player
		
	player_server.multiplayer_mode = true
	player_client.multiplayer_mode = true


@rpc('call_local')
func setup_player_health():
	var player_server : Player = player_spawn.get_children()[0] as Player
	var player_client : Player = player_spawn.get_children()[1] as Player
	
	player_server.player_data.died = false
	player_client.player_data.died = false
	
	player_server.player_data.health.reset_health()
	player_client.player_data.health.reset_health()
	

@rpc('call_local')
func setup_player_signals():
	for player : Player in player_spawn.get_children() as Array[Player]:
		player.connect("on_death", _on_player_died.bind(player))


func assign_score(defeated_player : Player):
	var player_server : Player = player_spawn.get_children()[0] as Player
	var player_client : Player = player_spawn.get_children()[1] as Player
	
	if player_server == defeated_player:
		arena_hud.assign_score_player_b.rpc()
	elif player_client == defeated_player:
		arena_hud.assign_score_player_a.rpc()
	

func on_player_joined() -> void:
	if multiplayer.is_server():
		hide_player_huds.rpc()
		arena_hud.start_count_down.rpc()
		place_players_to_their_starting_position.rpc()
		setup_player_huds.rpc()
		setup_player_collisions.rpc()
		setup_multiplayer_mode.rpc()
		setup_player_signals.rpc()
			
			
func _on_player_died(player: Player) -> void:
	if multiplayer.is_server():		
		arena_hud.start_count_down.rpc()
		place_players_to_their_starting_position.rpc()
		setup_player_health.rpc()
		assign_score(player)
