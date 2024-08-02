extends Node2D

signal on_player_joined()

const MAX_PLAYER = 2

var player_scene : PackedScene = preload("res://characters/player/Player.tscn")
var player_spawn_node : Node2D
var single_player : Player

@export var address = "127.0.0.1"
@export var port = 8080

var peer : ENetMultiplayerPeer
var player_name : String = "Player"


func _ready() -> void:
	multiplayer.peer_connected.connect(on_peer_connected)
	multiplayer.peer_disconnected.connect(on_peer_disconnected)
	multiplayer.connected_to_server.connect(on_connected_to_server)
	multiplayer.connection_failed.connect(on_connection_failed)
	multiplayer.server_disconnected.connect(on_server_disconected)


func remove_single_player():
	if not single_player:
		print("Single player not set!")
		return
		
	single_player.queue_free()


func host_game() -> void:
	print("Starting host!")
	
	peer = ENetMultiplayerPeer.new()
	var error = peer.create_server(port, MAX_PLAYER)
	if error != OK:
		print('Cannot host!')
		return
	
	peer.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER)
	multiplayer.set_multiplayer_peer(peer)
	
	remove_single_player()
	on_peer_connected(1)


func join_game() -> void:
	print("Joining host!")
	peer = ENetMultiplayerPeer.new()
	peer.create_client(address, port)
	peer.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER)
	multiplayer.set_multiplayer_peer(peer)
	
	remove_single_player()
	
			
func on_peer_connected(id):
	if multiplayer.is_server():
		print('Player %s connected to the game!' % str(id))
		
		if not player_spawn_node:
			print("Error : Player spawn node not set!")
			return 
		
		var player_to_add : Player = player_scene.instantiate() as Player
		player_to_add.name = str(id)
		player_spawn_node.add_child(player_to_add, true)
		
		if player_spawn_node.get_child_count() == 2:
			on_player_joined.emit()
		
	
func on_peer_disconnected(id):
	if multiplayer.is_server():
		print('Player %s disconnected from the game!' % str(id))
		
		if not player_spawn_node.has_node(str(id)):
			return
			
		player_spawn_node.get_node(str(id)).queue_free()
	

func on_connected_to_server():
	print('Connected to server!')
	

func on_server_disconected():
	print('Server disconnected!')
	
	
func on_connection_failed():
	print('Couldn`t connect!')
	
