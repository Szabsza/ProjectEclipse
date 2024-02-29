extends Node
class_name CharacterStateMachine

@export var player : CharacterBody2D

var current_state : State = IdlingState.new()
var states : Array[State]


func _ready():
	for child in get_children():
		if (child is State):
			states.append(child)
			child.player = player


func _physics_process(delta):
	if (current_state.next_state != null):
		switch_state(current_state.next_state)


func _input(event : InputEvent):
	current_state.state_input(event)


func check_if_is_able_to_move() -> bool:
	return current_state.is_able_to_move


func switch_state(state : State):
	if (current_state != null):
		current_state.on_exit()
		current_state.next_state = null
		
	current_state.free()
	current_state = state
	current_state.on_enter()


