class_name Potion extends Item

@export var regeneration_amount : int
@export var cool_down : float
@export var max_quantity : int


func load_data(potion_data : Dictionary):
	regeneration_amount = potion_data["regeneration_amount"]
	cool_down = potion_data["cool_down"]
	max_quantity = potion_data["max_quantity"]


func to_save() -> Dictionary:
	return {
		"regeneration_amount" : regeneration_amount,
		"cool_down" : cool_down,
		"max_quantity" : max_quantity,
	}
