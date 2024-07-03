class_name PlayerDetectionArea extends Area2D

var enemy : CharacterBody2D
var is_able_to_see_player : bool = false

var _player_position : Vector2 = Vector2.ZERO
var player : Player

func setup(enemy):
	self.enemy = enemy


func _init():
	collision_layer = 1
	collision_mask = 4


func _ready():
	connect("body_entered", self._on_body_entered)
	connect("body_exited", self._on_body_exited)


func _physics_process(delta):
	if is_able_to_see_player:
		_player_position = player.global_position


func _on_body_entered(character : Node2D) -> void:
	if character == null:
		return
	
	if character is Player:
		player = character
		is_able_to_see_player = true


func _on_body_exited(character : Node2D) -> void:
	if character == null:
		return
	
	if character is Player:
		player = null
		is_able_to_see_player = false


func can_see_player() -> bool:
	return is_able_to_see_player


func player_position() -> Vector2:
	return _player_position
