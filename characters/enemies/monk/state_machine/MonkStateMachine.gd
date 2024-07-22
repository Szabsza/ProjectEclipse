class_name MonkStateMachine extends AbstractStateMachine

var monk : Monk

@onready var monk_states: Dictionary = {
	"Idling" : $Idling,
	"Patrolling" : $Patrolling,
	"Chasing" : $Chasing,
	"Attacking" : $Attacking,
	#"SpecialAttacking" : $SpecialAttacking,
	"Hurting" : $Hurting,
	"Dying" : $Dying
}


func setup(_monk : Monk):
	monk = _monk
	for state in monk_states.values():
		state.setup(_monk, monk_states)

	switch_state(monk_states["Idling"])
