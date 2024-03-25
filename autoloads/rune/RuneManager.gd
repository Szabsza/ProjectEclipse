extends Node2D

var runes_held : int = 2000


func increase_runes(amount : int):
	runes_held += amount


func decrease_runes(amount : int):
	if amount <= runes_held:
		runes_held -= amount
		

func take_all_runes():
	runes_held = 0
	
