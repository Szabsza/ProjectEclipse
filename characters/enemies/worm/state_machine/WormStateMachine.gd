class_name WormStateMachine extends AbstractStateMachine

var worm : Worm

@onready var worm_states: Dictionary = {
	"Attacking" : $Attacking,
	"Walking" : $Walking,
	"Chasing" : $Chasing,
	"Patrolling" : $Patrolling,
	"Hurting" : $Hurting,
	"Dying" : $Dying,
	"Dashing" : $Dashing,
}


func setup(_worm : Worm):
	worm = _worm
	for state in worm_states.values():
		state.setup(_worm, worm_states)

	switch_state(worm_states["Idling"])
