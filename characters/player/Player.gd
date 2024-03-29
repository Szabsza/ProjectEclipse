class_name Player extends CharacterBody2D

@onready var sprite : Sprite2D = $Sprite2D
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine
@onready var hurtbox : HurtBox = $Sprite2D/HurtBox
@onready var health : Health = $Health
@onready var mana : Mana = $Mana
@onready var stamina : Stamina = $Stamina

var is_facing_left : bool = false
var is_facing_right : bool = true
var has_double_jumped : bool = false
var facing_direction_locked : bool = false

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2

const INITIAL_ATTACK_POWER = 10
const INITIAL_MAX_HEALTH = 100
const INITIAL_MAX_MANA = 20

const INITIAL_MAX_STAMINA = 100
const STAMINA_REGENERATION_RATE = 5

const ATTACK_STAMINA_COST : int = 25
const JUMP_STAMINA_COST : int = 25
const ROLL_STAMINA_COST : int = 25


func _ready():
	add_to_group("player")
	collision_layer = 4
	collision_mask = 1
	animation_tree.active = true
	state_machine.setup(self, animation_tree)
	health.setup(INITIAL_MAX_HEALTH)
	mana.setup(INITIAL_MAX_MANA)
	stamina.setup(INITIAL_MAX_STAMINA, STAMINA_REGENERATION_RATE)
	
	hurtbox.setup(0, 2)
	
	for child in sprite.get_children():
		if child is HitBox:
			child.setup(INITIAL_ATTACK_POWER, 2, 0)


func _physics_process(delta):
	direction = Input.get_vector("left", "right", "up", "down")
			
	if not is_on_floor():
		velocity.y += gravity * delta
		
	move_and_slide()
	update_facing_direction()
	

func update_facing_direction():
	if not facing_direction_locked:
		if direction.x < 0:
			sprite.scale.x = -1
			is_facing_right = false
			is_facing_left = true
		elif direction.x > 0:
			sprite.scale.x = 1
			is_facing_right = true
			is_facing_left = false
			

func take_damage(amount):
	health.decrease_current_health(amount)
	if health.current_health <= 0:
		state_machine.switch_state(state_machine.states["Dying"])
