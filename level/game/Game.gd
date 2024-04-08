extends Node2D

@onready var player : Player = $Player
@onready var transition : Transition = $Transition
@onready var remains : Remains = $Remains
@onready var levels : Array = get_tree().get_nodes_in_group("level")
@onready var checkpoints : Array = get_tree().get_nodes_in_group("checkpoint")
@onready var chests : Array = get_tree().get_nodes_in_group("chest")
@onready var doors : Array = get_tree().get_nodes_in_group("door")


func _ready():
	PlayerManager.setup(player)
	TransitionManager.setup(transition)
	WorldManager.setup(levels, checkpoints, chests, doors, remains)
	TravelManager.connect_doors()
	
