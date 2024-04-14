class_name RunesHeld extends Resource

@export var amount : int = 2000


func increase_runes(amount : int):
	self.amount += amount


func decrease_runes(amount : int):
	if amount <= self.amount:
		self.amount -= amount
		

func take_all_runes():
	amount = 0
