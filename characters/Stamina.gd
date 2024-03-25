class_name Stamina extends Node

var max_stamina : int = 0
var current_stamina : int = 0

var stamina_regeneration_rate : int = 0


func setup(max_stamina : int, stamina_regeneration_rate : int):
	self.max_stamina = max_stamina
	self.current_stamina = max_stamina
	self.stamina_regeneration_rate = stamina_regeneration_rate


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


func _on_stamina_regen_timer_timeout():
	increase_current_stamina(stamina_regeneration_rate)
