class_name Monk extends CharacterBody2D

@onready var sprite : Sprite2D = $Sprite2D
@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine
@onready var player_detection_area : Area2D = $Sprite2D/PlayerDetectionArea

@export var health : float = 200.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var pushback_force : Vector2 = Vector2.ZERO

var is_facing_left : bool = false
var is_facing_right : bool = true
var is_facing_direction_locked : bool = false

func take_damage(amount : float):
	if amount > health:
		state_machine.switch_state(state_machine.states["Dying"])
	else:
		state_machine.switch_state(state_machine.states["Hurting"])
		health -= amount


func knock_back(source_position : Vector2):
	pushback_force = -global_position.direction_to(source_position) * 3
	if source_position.x > position.x:
		sprite.scale.x = 1
		is_facing_left = false
		is_facing_right = true
	elif source_position.x < position.x:
		sprite.scale.x = -1
		is_facing_left = true
		is_facing_right = false
	

func _ready():
	collision_layer = 4
	collision_mask = 1
	animation_tree.active = true
	state_machine.setup(self, animation_tree)

	
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	pushback_force = lerp(pushback_force, Vector2.ZERO, delta * 10)
	position += pushback_force
	
	move_and_slide()
