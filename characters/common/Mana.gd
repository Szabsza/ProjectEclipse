class_name Mana extends Resource

@export var max_mana : int = 0
@export var current_mana : int = 0


func increase_max_mana(amount : int):
	max_mana += amount


func decrease_max_mana(amount : int):
	if max_mana - amount >= 0:
		max_mana -= amount
		if current_mana > max_mana:
			current_mana = max_mana
		

func increase_current_mana(amount : int):
	if current_mana + amount <= max_mana:
		current_mana += amount


func decrease_current_mana(amount : int):
	if current_mana - amount >= 0:
		current_mana -= amount
		
