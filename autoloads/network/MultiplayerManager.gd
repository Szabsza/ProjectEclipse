extends Node2D

const ARENA_SCENE : String = "res://level/arena/Arena.tscn"
const MAX_PLAYER = 2

@export var address = "127.0.0.1"
@export var port = 8080

var peer

var player_name : String = "Player"
var players = {}


func _ready() -> void:
	multiplayer.peer_connected.connect(on_peer_connected)
	multiplayer.peer_disconnected.connect(on_peer_disconnected)
	multiplayer.connected_to_server.connect(on_connected_to_server)
	multiplayer.connection_failed.connect(on_connection_failed)


func host_game() -> void:
	peer = ENetMultiplayerPeer.new()
	var error = peer.create_server(port, MAX_PLAYER)
	if error != OK:
		print('cannot host: ' + error)
		return
	
	peer.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER)
	
	multiplayer.set_multiplayer_peer(peer)
	print("waiting for players")
	send_player_info(player_name, multiplayer.get_unique_id())


func join_game() -> void:
	peer = ENetMultiplayerPeer.new()
	peer.create_client(address, port)
	peer.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER)
	multiplayer.set_multiplayer_peer(peer)
	

@rpc("any_peer", "call_local")
func start_game():
	SceneManager.change_scene_to(ARENA_SCENE)
	

@rpc("any_peer")
func send_player_info(name, id) -> void:
	if not players.has(id):
		players[id] = {
			"name": name,
			"id": id,
			"score": 0
		}
	
	if multiplayer.is_server():
		for i in players:
			send_player_info.rpc(players[i].name, i)
			
			
func on_peer_connected(id):
	print('Player connected ' + str(id))
	
	
func on_peer_disconnected(id):
	print('Player disconnected ' + str(id))


func on_connected_to_server():
	print('Connected to server')
	send_player_info.rpc_id(1, player_name, multiplayer.get_unique_id())
	
	
func on_connection_failed():
	print('Couldnt connect')
	
