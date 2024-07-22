class_name MonkData extends Resource

@export var name : String
@export var is_dead : bool

@export var collision_layer : int
@export var collision_mask : int

@export var MELEE_ATTACK_DAMAGE : int
#@export var SPECIAL_ATTACK_DMG : int

@export var WALKING_SPEED : float
@export var CHASING_SPEED : float
@export var DASH_SPEED : float

@export var MIN_WAYPOINT_DISTANCE : float
@export var MIN_RANGE_MELEE_ATTACKS : float

@export var health : Health


func init_from_monk_data(_monk_data : MonkData):
	name = _monk_data.name
	is_dead = _monk_data.is_dead

	collision_layer = _monk_data.collision_layer
	collision_mask = _monk_data.collision_mask

	MELEE_ATTACK_DAMAGE = _monk_data.MELEE_ATTACK_DAMAGE

	WALKING_SPEED = _monk_data.WALKING_SPEED
	CHASING_SPEED = _monk_data.CHASING_SPEED
	DASH_SPEED = _monk_data.DASH_SPEED

	MIN_WAYPOINT_DISTANCE = _monk_data.MIN_WAYPOINT_DISTANCE
	MIN_RANGE_MELEE_ATTACKS = _monk_data.MIN_RANGE_MELEE_ATTACKS
	
	health = Health.new(_monk_data.health.max_health, _monk_data.health.current_health)


func init_default():
	name = "Sand Monk"
	is_dead = false

	collision_layer = 4
	collision_mask = 1

	MELEE_ATTACK_DAMAGE = 20

	WALKING_SPEED = 100.0
	CHASING_SPEED = 150.0
	DASH_SPEED = 350.0

	MIN_WAYPOINT_DISTANCE = 10.0
	MIN_RANGE_MELEE_ATTACKS = 50.0

	health = Health.new(40, 40)


func _init(_monk_data : MonkData = null):
	if _monk_data:
		init_from_monk_data(_monk_data)
	else:
		init_default()
