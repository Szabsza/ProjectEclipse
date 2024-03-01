class_name State extends Node

var player : Player
var states : Dictionary
var playback : AnimationNodeStateMachinePlayback
var next_state : State
var is_able_to_move : bool = true

func state_process(delta):
	pass


func state_input(event: InputEvent):
	pass


func on_enter():
	pass

	
func on_exit():
	pass
