class_name Status extends Resource

@export var health : int
@export var mana : int
@export var stamina : int
@export var attack_power : int

@export var level : int
@export var runes_needed : int


func _init(
	_health : int = 0,
	_mana : int = 0,
	_stamina : int = 0,
	_attack_power : int = 0,
	_level : int = 0,
	_runes_needed : int = 50
) -> void:
	health = _health
	mana = _mana
	stamina = _stamina
	attack_power = _attack_power
	level = _level
	runes_needed = _runes_needed


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
