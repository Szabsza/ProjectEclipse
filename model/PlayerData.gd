class_name PlayerData extends CharacterData

@export var keys_held : int = 0

@export var died : bool = false
@export var position_where_died : Vector2

@export var attack_stamina_cost : int = 25
@export var jump_stamina_cost : int = 25
@export var roll_stamina_cost : int = 25

@export var attack_damage = 10

@export var has_double_jumped : bool = false
@export var facing_direction_locked : bool = false

@export var jump_velocity : float = -300.0
@export var run_speed : float = 200.0
@export var dash_speed : float = 1.0
@export var dash_velocity : float = 500
@export var run_acceleration : float = 0.25
@export var attack_move_speed : float = 10.0
@export var minimum_run_speed : float = 0.005
@export var roll_frames : int = 20
@export var speed : float = 200.0
@export var fall_acceleration : float = 0.25

@export var health : Health
@export var mana : Mana 
@export var stamina : Stamina
@export var runes_held : RunesHeld
@export var status : Status


func load_data(player_data : Dictionary):
	keys_held = player_data["keys_held"]
	died = player_data["died"]
	position_where_died.x = player_data["position_where_died_x"]
	position_where_died.y = player_data["position_where_died_y"]
	attack_stamina_cost = player_data["attack_stamina_cost"]
	jump_stamina_cost = player_data["jump_stamina_cost"]
	roll_stamina_cost = player_data["roll_stamina_cost"]
	attack_damage = player_data["attack_damage"]
	has_double_jumped = player_data["has_double_jumped"]
	facing_direction_locked = player_data["facing_direction_locked"]
	jump_velocity = player_data["jump_velocity"]
	run_speed = player_data["run_speed"]
	dash_speed = player_data["dash_speed"]
	dash_velocity = player_data["dash_velocity"]
	run_acceleration = player_data["run_acceleration"]
	attack_move_speed = player_data["attack_move_speed"]
	minimum_run_speed = player_data["minimum_run_speed"]
	roll_frames = player_data["roll_frames"]
	speed = player_data["speed"]
	fall_acceleration = player_data["fall_acceleration"]
	
	var _health = Health.new()
	_health.load_data(player_data["health"])
	health = _health
	
	var _mana = Mana.new()
	_mana.load_data(player_data["mana"])
	mana = _mana
	
	var _stamina = Stamina.new()
	_stamina.load_data(player_data["stamina"])
	stamina = _stamina
	
	var _runes_held = RunesHeld.new()
	_runes_held.load_data(player_data["runes_held"])
	runes_held = _runes_held
	
	var _status = Status.new()
	_status.load_data(player_data["status"])
	status = _status
	

func to_save() -> Dictionary:
	return {
		"keys_held" : keys_held,
		"died" : died,
		"position_where_died_x" : position_where_died.x,
		"position_where_died_y" : position_where_died.y,
		"attack_stamina_cost" : attack_stamina_cost,
		"jump_stamina_cost" : jump_stamina_cost,
		"roll_stamina_cost" : roll_stamina_cost,
		"attack_damage" : attack_damage,
		"has_double_jumped" : has_double_jumped,
		"facing_direction_locked" : facing_direction_locked,
		"jump_velocity" : jump_velocity,
		"run_speed" : run_speed,
		"dash_speed" : dash_speed,
		"dash_velocity" : dash_velocity,
		"run_acceleration" : run_acceleration,
		"attack_move_speed" : attack_move_speed,
		"minimum_run_speed" : minimum_run_speed,
		"roll_frames" : roll_frames,
		"speed" : speed,
		"fall_acceleration" : fall_acceleration,
		"health" : health.to_save(),
		"mana" : mana.to_save(),
		"stamina" : stamina.to_save(),
		"runes_held" : runes_held.to_save(),
		"status" : status.to_save()
	}
