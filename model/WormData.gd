class_name WormData extends Resource

@export var name : String
@export var is_dead : bool

@export var collision_layer : int
@export var collision_mask : int

@export var FIREBALL_ATTACK_DMG : int
@export var DASH_ATTACK_DMG : int

@export var WALKING_SPEED : float
@export var CHASING_SPEED : float
@export var DASHBACK_SPEED : float
@export var DASH_SPEED : float

@export var MIN_WAYPOINT_DISTANCE : float

@export var MIN_RANGE_FIREBALL_ATTACKS : float
@export var MIN_RANGE_DASH_ATTACKS : float

@export var health : Health


func init_from_worm_data(_worm_data : WormData):
	name = _worm_data.name
	is_dead = _worm_data.is_dead

	collision_layer = _worm_data.collision_layer
	collision_mask = _worm_data.collision_mask

	FIREBALL_ATTACK_DMG = _worm_data.FIREBALL_ATTACK_DMG
	DASH_ATTACK_DMG = _worm_data.DASH_ATTACK_DMG

	WALKING_SPEED = _worm_data.WALKING_SPEED
	CHASING_SPEED = _worm_data.CHASING_SPEED
	DASHBACK_SPEED = _worm_data.DASHBACK_SPEED
	DASH_SPEED = _worm_data.DASH_SPEED

	MIN_WAYPOINT_DISTANCE = _worm_data.MIN_WAYPOINT_DISTANCE
	
	MIN_RANGE_FIREBALL_ATTACKS = _worm_data.MIN_RANGE_FIREBALL_ATTACKS
	MIN_RANGE_DASH_ATTACKS = _worm_data.MIN_RANGE_DASH_ATTACKS
	
	health = Health.new(_worm_data.health.max_health, _worm_data.health.current_health)


func init_default():
	name = "Man Eater"
	is_dead = false

	collision_layer = 4
	collision_mask = 1

	FIREBALL_ATTACK_DMG = 20
	DASH_ATTACK_DMG = 20

	WALKING_SPEED = 100.0
	CHASING_SPEED = 150.0
	DASHBACK_SPEED = 100.0
	DASH_SPEED = 350.0

	MIN_WAYPOINT_DISTANCE = 10.0

	MIN_RANGE_FIREBALL_ATTACKS = 200.0
	MIN_RANGE_DASH_ATTACKS = 100.0

	health = Health.new(40, 40)


func _init(_worm_data : WormData = null):
	if _worm_data:
		init_from_worm_data(_worm_data)
	else:
		init_default()
