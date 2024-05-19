class_name PlayerData extends CharacterData

@export var keys_held : int = 0

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
