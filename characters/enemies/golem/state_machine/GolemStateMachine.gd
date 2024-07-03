class_name GolemStateMachine extends AbstractStateMachine

var golem : Golem

@onready var golem_states: Dictionary = {
	"Sleeping" : $Sleeping,
	"WakingUp" : $WakingUp,
	"Chasing" : $Chasing,
	"RangeAttacking" : $RangeAttacking,
	"MeleeAttacking" : $MeleeAttacking,
	"LaserAttacking" : $LaserAttacking,
	"SpecialAttacking" : $SpecialAttacking,
	"Dashing" : $Dashing,
	"Dying" : $Dying
}


func setup(_golem : Golem):
	golem = _golem
	for state in golem_states.values():
		state.setup(_golem, golem_states)

	switch_state(golem_states["Sleeping"])

