class_name RunesHeld extends Resource

@export var amount : int


func _init(_amount : int = 500) -> void:
	amount = _amount


func increase_runes(amount : int):
	self.amount += amount


func decrease_runes(amount : int):
	if amount <= self.amount:
		self.amount -= amount
		

func take_all_runes():
	amount = 0


func load_data(runes_held_data : Dictionary):
	amount = runes_held_data["amount"]


func to_save() -> Dictionary:
	return {
		"amount" : amount,
	}
