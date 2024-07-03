class_name MerchantStateMachine extends AbstractStateMachine

var merchant : GhostMerchant

@onready var merchant_states : Dictionary = {
	"Hiding" : $Hiding,
	"Vanishing" : $Vanishing,
	"Appearing" : $Appearing,
	"Idling" : $Idling,
}


func setup(_merchant : GhostMerchant):
	merchant = _merchant
	for state in merchant_states.values():
		state.setup(_merchant, merchant_states)

	switch_state(merchant_states["Hiding"])
