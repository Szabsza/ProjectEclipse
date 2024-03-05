class_name PlayerDetectionArea extends Area2D

var enemy : CharacterBody2D

func setup(enemy):
	self.enemy = enemy


func _init():
	collision_layer = 1
	collision_mask = 4


func _ready():
	connect("body_entered", self._on_body_entered)


func _on_body_entered(character : Node2D):
	if character == null:
		return
	
	if character is Player:
		enemy.state_machine.current_state = enemy.state_machine.states["Chasing"]
	
