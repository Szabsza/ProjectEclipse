class_name PlayerStateMachine extends AbstractStateMachine

var player : Player

@onready var player_states : Dictionary = {
	"Idling" : $Idling,
	"Jumping" : $Jumping,
	"Falling" : $Falling,
	"Rolling" : $Rolling,
	"Running" : $Running,
	"Attacking" : $Attacking,
	"JumpAttacking" : $JumpAttacking,
	"Interacting" : $Interacting,
	"Flying" : $Flying,
	"Dying" : $Dying, 
}


func setup(_player : Player):
	player = _player
	for state in player_states.values():
		state.setup(_player, player_states)

	switch_state(player_states["Idling"])
