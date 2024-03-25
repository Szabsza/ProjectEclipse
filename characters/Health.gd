class_name Health extends Node

var max_health : int = 0
var current_health : int = 0


func setup(max_health : int):
	self.max_health = max_health
	self.current_health = max_health


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


func decrease_current_health(amount : int):
	if current_health - amount >= 0:
		current_health -= amount
