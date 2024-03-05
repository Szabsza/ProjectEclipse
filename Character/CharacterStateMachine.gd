class_name CharacterStateMachine extends Node

var character : CharacterBody2D
var animation_tree : AnimationTree

var current_state : State
var states : Dictionary

func setup(character : CharacterBody2D, animation_tree : AnimationTree):
	if (character != null):
		self.character = character
	
	if (animation_tree != null):
		self.animation_tree = animation_tree
		
	for child in get_children():
		if (child is State):
			states[child.name] = child
			child.character = self.character
			child.playback = animation_tree["parameters/playback"]
	
	for child in get_children():
		if (child is State):
			child.states = self.states
			
	switch_state(states["Idling"])


func _physics_process(delta):	
	if (current_state.next_state != null):
		switch_state(current_state.next_state)
	
	current_state.state_process(delta)
	

func _input(event : InputEvent):
	current_state.state_input(event)


func check_if_is_able_to_move() -> bool:
	return current_state.is_able_to_move


func switch_state(state : State):
	if (current_state != null):
		current_state.on_exit()
		current_state.next_state = null
		
	current_state = state
	current_state.on_enter()


