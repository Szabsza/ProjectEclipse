class_name AbstractStateMachine extends Node

var current_state : State


func _physics_process(delta):
	if (current_state.next_state != null):
		switch_state(current_state.next_state)

	current_state.state_process(delta)


func _input(event : InputEvent):
	current_state.state_input(event)


func switch_state(state : State):
	if (current_state != null):
		current_state.on_exit()
		current_state.next_state = null

	current_state = state
	current_state.on_enter()
