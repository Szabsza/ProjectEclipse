extends CharacterBody2D


@export var speed : float = 300.0
@export var dash_speed : float = 1.0
@export var dash_velocity : float = 500

@onready var sprite : Sprite2D = $Sprite2D
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine

var is_animation_locked : bool = false

var is_falling : bool = false
var is_jumping : bool = false
var is_running : bool = false
var is_idling : bool = false
var is_dashing : bool = false

var is_facing_left = false
var is_facing_right = true
 
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2

func _ready():
	animation_tree.active = true

func _physics_process(delta):
	direction = Input.get_vector("left", "right", "up", "down")
		
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if not is_on_floor() and velocity.y < 0:
		pass
		
	if not is_on_floor() and velocity.y > 0:
		pass
		
	if is_on_floor() and velocity.x == 0:
		pass
		
	if is_on_floor() and velocity.x != 0:
		pass
		
	#if Input.is_action_just_pressed("jump") and is_on_floor() and not is_dashing:
		#perform_jump()
		#
	#if Input.is_action_just_pressed("dash") and is_on_floor() and not is_dashing:
		#perform_dash()
	
	if direction && state_machine.check_if_is_able_to_move():
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()
	update_animation()
	update_facing_direction()


func perform_dash():
	if direction.x == 0:
		if is_facing_right:
			velocity.x = move_toward(velocity.x + 300, 1 * dash_velocity, dash_speed)
		else:
			velocity.x = move_toward(velocity.x - 300, -1 * dash_velocity, dash_speed)
	else:
		velocity.x = move_toward(velocity.x, direction.x * dash_velocity, dash_speed)


func update_animation():
	animation_tree.set("parameters/Move/blend_position", direction.x)
	


func update_facing_direction():
	if direction.x < 0:
		sprite.flip_h = true
		is_facing_right = false
		is_facing_left = true
	elif direction.x > 0:
		sprite.flip_h = false
		is_facing_right = true
		is_facing_left = false
