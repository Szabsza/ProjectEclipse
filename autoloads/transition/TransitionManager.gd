extends Node

var transition : Transition = null


func setup(transition : Transition):
	self.transition = transition
	
	
func play_transition():
	transition.play()
