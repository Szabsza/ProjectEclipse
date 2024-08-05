class_name Health extends Resource

signal on_health_changed()

@export var max_health : int = 0
@export var current_health : int = 0


func _init(_max_health = 0, _current_health = 0):
	max_health = _max_health
	current_health = _current_health


func reset_health():
	current_health = max_health


func increase_max_health(amount : int):
	max_health += amount


func decrease_max_health(amount : int):
	if max_health - amount >= 0:
		max_health -= amount
		if current_health > max_health:
			current_health = max_health
		

func increase_current_health(amount : int):
	if current_health + amount <= max_health:
		current_health += amount
	
	on_health_changed.emit()


func decrease_current_health(amount : int):
	current_health -= amount
	if current_health - amount < 0:
		current_health = 0
	
	on_health_changed.emit()


func load_data(health_data : Dictionary):
	max_health = health_data["max_health"]
	current_health = health_data["current_health"]


func to_save() -> Dictionary:
	return {
		"max_health" : max_health,
		"current_health" : current_health,
	}
