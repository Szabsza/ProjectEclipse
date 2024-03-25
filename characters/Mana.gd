class_name Mana extends Node

var max_mana : int = 0
var current_mana : int = 0


func setup(max_mana : int):
	self.max_mana = max_mana
	self.current_mana = max_mana


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
		
