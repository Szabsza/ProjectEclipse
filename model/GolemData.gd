class_name GolemData extends Resource

@export var name : String
@export var is_dead : bool

@export var collision_layer : int
@export var collision_mask : int

@export var MELEE_ATTACK_DMG : int
@export var RANGE_ATTACK_DMG : int
@export var LASER_ATTACK_DMG : int
@export var DASH_ATTACK_DMG : int

@export var CHASING_SPEED : float
@export var LASER_SPEED : float

@export var MIN_RANGE_RANGE_ATTACKS : float
@export var MIN_RANGE_MELEE_ATTACKS : float

@export var P_RANGE_ATTACK : float
@export var P_LASER_ATTACK : float
@export var P_MELEE_ATTACK : float
@export var P_DASH_ATTACK : float
@export var P_SPECIAL_ATTACK : float

@export var LASER_START_OFFSET : Vector2
@export var LASER_END_OFFSET : Vector2

@export var health : Health


func init_from_golem_data(_golem_data : GolemData):
	name = _golem_data.name
	is_dead = _golem_data.is_dead

	collision_layer = _golem_data.collision_layer
	collision_mask = _golem_data.collision_mask

	RANGE_ATTACK_DMG = _golem_data.RANGE_ATTACK_DMG
	MELEE_ATTACK_DMG = _golem_data.MELEE_ATTACK_DMG
	LASER_ATTACK_DMG = _golem_data.LASER_ATTACK_DMG
	DASH_ATTACK_DMG = _golem_data.DASH_ATTACK_DMG

	CHASING_SPEED = _golem_data.CHASING_SPEED
	LASER_SPEED = _golem_data.LASER_SPEED

	MIN_RANGE_RANGE_ATTACKS = _golem_data.MIN_RANGE_RANGE_ATTACKS
	MIN_RANGE_MELEE_ATTACKS = _golem_data.MIN_RANGE_MELEE_ATTACKS

	P_RANGE_ATTACK = _golem_data.P_RANGE_ATTACK
	P_LASER_ATTACK = _golem_data.P_LASER_ATTACK
	P_DASH_ATTACK = _golem_data.P_DASH_ATTACK
	P_SPECIAL_ATTACK = _golem_data.P_SPECIAL_ATTACK

	LASER_START_OFFSET = _golem_data.LASER_START_OFFSET
	LASER_END_OFFSET = _golem_data.LASER_END_OFFSET

	health = Health.new(_golem_data.health.max_health, _golem_data.health.current_health)


func init_default():
	name = "Rock Man"
	is_dead = false

	collision_layer = 4
	collision_mask = 1

	RANGE_ATTACK_DMG = 10
	MELEE_ATTACK_DMG = 15
	LASER_ATTACK_DMG = 30
	DASH_ATTACK_DMG = 5

	CHASING_SPEED = 150.0
	LASER_SPEED = 200.0

	MIN_RANGE_RANGE_ATTACKS = 200.0
	MIN_RANGE_MELEE_ATTACKS = 50.0

	P_RANGE_ATTACK = 0.1
	P_LASER_ATTACK = 0.2
	P_DASH_ATTACK = 0.2
	P_SPECIAL_ATTACK = 0.5

	LASER_START_OFFSET = Vector2(0, -600)
	LASER_END_OFFSET = Vector2(0, 300)

	health = Health.new(500, 500)


func _init(_golem_data : GolemData = null):
	if _golem_data:
		init_from_golem_data(_golem_data)
	else:
		init_default()
