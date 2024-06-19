class_name SaveData extends Resource

# Player
@export var player_data : PlayerData

# Equipment
@export var health_potions : HealthPotion
@export var mana_potion : ManaPotion
@export var bracelet : Bracelet
@export var necklace : Necklace
@export var wings : Wings

# Levels
@export var current_level_data : LevelData
@export var levels : Dictionary


func to_save() -> Dictionary:
	var _levels : Dictionary = {}
	for level in levels:
		_levels[level] = levels[level].to_save()
		
	
	return {
		"player_data" : player_data.to_save(),
		"health_potions" : health_potions.to_save(),
		"mana_potion" : mana_potion.to_save(),
		"bracelet" : bracelet.to_save() if bracelet else null,
		"necklace" : necklace.to_save() if necklace else null,
		"wings" : wings.to_save() if wings else null,
		"current_level_data" : current_level_data.to_save(),
		"levels" : _levels,
	}
