class_name TrapStateMachine extends Node

var trap : RigidBody2D
var animation_tree : AnimationTree

var current_state : TrapState
var states : Dictionary


func setup(trap : RigidBody2D, animation_tree : AnimationTree):
	if trap != null:
		self.trap = trap
	
	if animation_tree != null:
		self.animation_tree = animation_tree
		
	for child in get_children():
		if child is TrapState:
			states[child.name] = child
			child.trap = self.trap
			child.playback = animation_tree["parameters/playback"]
	
	for child in get_children():
		if child is TrapState:
			child.states = self.states
			
	switch_state(states["Inactive"])


func _physics_process(delta):	
	if (current_state.next_state != null):
		switch_state(current_state.next_state)
	
	current_state.state_process(delta)


func switch_state(state : TrapState):
	if (current_state != null):
		current_state.on_exit()
		current_state.next_state = null
		
	current_state = state
	current_state.on_enter()
