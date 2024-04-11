class_name BuffBehavior extends Resource

enum Target {
	MAX_POTIONS_QUANTITY,
	POTIONS_REGENERATION,
	STATUS_ATTACK_POWER,
	STATUS_MANA,
	STATUS_HEALTH,
	STATUS_STAMINA,
}

@export var is_increasing : bool
@export var is_decreasing : bool
@export var amount : int
@export_range(0, 100) var percent : int = 0
@export var target : Target
