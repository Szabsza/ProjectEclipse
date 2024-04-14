class_name PlayerStateMachine extends Node

var player : Player
var animation_tree : AnimationTree

var current_state : PlayerState
var states : Dictionary


func setup(player : Player):
	if player != null:
		self.player = player
	
	if animation_tree != null:
		self.animation_tree = player.animation_tree
		
	for child in get_children():
		if child is PlayerState:
			states[child.name] = child
			child.player = self.player
			child.playback = player.animation_tree["parameters/playback"]
	
	for child in get_children():
		if child is PlayerState:
			child.states = self.states
	
	switch_state(states["Idling"])
	
	set_physics_process(true)


func _ready() -> void:
	set_physics_process(false)


func _physics_process(delta):	
	if (current_state.next_state != null):
		switch_state(current_state.next_state)
	
	current_state.state_process(delta)
	

func _input(event : InputEvent):
	current_state.state_input(event)


func check_if_is_able_to_move() -> bool:
	return current_state.is_able_to_move


func switch_state(state : PlayerState):
	if (current_state != null):
		current_state.on_exit()
		current_state.next_state = null
	
	current_state = state
	current_state.on_enter()
