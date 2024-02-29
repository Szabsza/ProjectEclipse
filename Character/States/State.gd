extends Node
class_name State

var player : CharacterBody2D

var next_state : State

var is_able_to_move : bool = true

func state_input(event: InputEvent):
	pass

func on_enter():
	pass
	
func on_exit():
	pass
