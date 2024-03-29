extends Node2D

@onready var player : Player = $Player
@onready var remains : Remains = $Remains
@onready var levels : Array = get_tree().get_nodes_in_group("level")
@onready var checkpoints : Array = get_tree().get_nodes_in_group("checkpoint")
@onready var chests : Array = get_tree().get_nodes_in_group("chest")


func _ready():
	PlayerManager.setup(player)
	WorldManager.setup(levels, checkpoints, chests, remains)
