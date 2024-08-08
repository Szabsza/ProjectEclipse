class_name Power extends Resource

signal on_power_changed()

@export var current_power : int = 0


func _init(_current_power = 0):
	current_power = _current_power
	

func increase_attack_power(amount : int):
	current_power += amount
	on_power_changed.emit()


func decrease_attack_power(amount : int):
	if current_power - amount >= 0:
		current_power -= amount
		on_power_changed.emit()
