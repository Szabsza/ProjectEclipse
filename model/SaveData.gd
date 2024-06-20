class_name SaveData extends Resource

# Player
@export var player_data : PlayerData

# Equipment
@export var health_potions : HealthPotion
@export var mana_potion : ManaPotion
@export var bracelet : Bracelet
@export var necklace : Necklace
@export var wings : Wings
@export var key_quantity : int

# Levels
@export var current_level_data : LevelData
@export var levels : Dictionary


func load_data(save_data : Dictionary):
	var _player_data = PlayerData.new()
	_player_data.load_data(save_data["player_data"])
	player_data = _player_data
	
	var _health_potions = HealthPotion.new()
	_health_potions.load_data(save_data["health_potions"])
	health_potions = _health_potions

	var _mana_potion = ManaPotion.new()
	_mana_potion.load_data(save_data["mana_potion"])
	mana_potion = _mana_potion
	
	if save_data["bracelet"].is_empty():
		bracelet = null
	else:
		var _bracelet = Bracelet.new()
		_bracelet.load_data(save_data["bracelet"])
		bracelet = _bracelet
	
	if save_data["necklace"].is_empty():
		necklace = null
	else:
		var _necklace = Necklace.new()
		_necklace.load_data(save_data["necklace"])
		necklace = _necklace
	
	if save_data["wings"].is_empty():
		wings = null
	else:
		var _wings = Wings.new()
		_wings.load_data(save_data["wings"])
		wings = _wings
	
	key_quantity = save_data["key_quantity"]
	
	var _current_level_data = LevelData.new()
	_current_level_data.load_data(save_data["current_level_data"])
	current_level_data = _current_level_data
	
	levels = {}
	for level in save_data["levels"]:
		var _level = LevelData.new()
		_level.load_data(save_data["levels"][level])
		levels[level] = _level
	

func to_save() -> Dictionary:
	var _levels : Dictionary = {}
	for level in levels:
		_levels[level] = levels[level].to_save()
		
	
	return {
		"player_data" : player_data.to_save(),
		"health_potions" : health_potions.to_save(),
		"mana_potion" : mana_potion.to_save(),
		"bracelet" : bracelet.to_save() if bracelet else {},
		"necklace" : necklace.to_save() if necklace else {},
		"wings" : wings.to_save() if wings else {},
		"key_quantity" : key_quantity,
		"current_level_data" : current_level_data.to_save(),
		"levels" : _levels,
	}
