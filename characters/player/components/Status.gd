class_name Status extends Resource

@export var health : int = 0
@export var mana : int = 0
@export var stamina : int = 0
@export var attack_power : int = 0

@export var level : int = 0
@export var runes_needed : int = 50


func load_data(status_data : Dictionary):
	health = status_data["health"]
	mana = status_data["mana"]
	stamina = status_data["stamina"]
	attack_power = status_data["attack_power"]
	level = status_data["level"]
	runes_needed = status_data["runes_needed"]


func to_save() -> Dictionary:
	return {
		"health" : health,
		"mana" : mana,
		"stamina" : stamina,
		"attack_power" : attack_power,
		"level" : level,
		"runes_needed" : runes_needed
	}
