class_name Stamina extends Resource

@export var max_stamina : int = 0
@export var current_stamina : int = 0
@export var stamina_regeneration_rate : int = 0


func increase_max_stamina(amount : int):
	max_stamina += amount


func decrease_max_stamina(amount : int):
	if max_stamina - amount >= 0:
		max_stamina -= amount
		if current_stamina > max_stamina:
			current_stamina = max_stamina
		

func increase_current_stamina(amount : float):
	if current_stamina + amount <= max_stamina:
		current_stamina += amount


func decrease_current_stamina(amount : int):
	if current_stamina - amount >= 0:
		current_stamina -= amount


func regen_stamina():
	if current_stamina + stamina_regeneration_rate > max_stamina:
		current_stamina = max_stamina
	else:
		current_stamina += stamina_regeneration_rate


func load_data(stamina_data : Dictionary):
	max_stamina = stamina_data["max_stamina"]
	current_stamina = stamina_data["current_stamina"]
	stamina_regeneration_rate = stamina_data["stamina_regeneration_rate"]


func to_save() -> Dictionary:
	return {
		"max_stamina" : max_stamina,
		"current_stamina" : current_stamina,
		"stamina_regeneration_rate" : stamina_regeneration_rate
	}
