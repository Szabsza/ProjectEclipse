extends CharacterBody2D


@export var speed : float = 300.0
@export var dash_speed : float = 1.0
@export var jump_velocity : float = -400.0
@export var dash_velocity : float = 500

@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D

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


func falling():
	is_falling = true
	is_jumping = false
	is_idling = false
	is_running = false
	is_dashing = false


func jumping():
	is_falling = false
	is_jumping = true
	is_idling = false
	is_running = false
	is_dashing = false


func idling():
	is_falling = false
	is_jumping = false
	is_idling = true
	is_running = false
	is_dashing = false


func running():
	is_falling = false
	is_jumping = false
	is_idling = false
	is_running = true
	is_dashing = false


func dashing():
	is_falling = false
	is_jumping = false
	is_idling = false
	is_running = false
	is_dashing = true


func _physics_process(delta):
	direction = Input.get_vector("left", "right", "up", "down")
		
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if not is_on_floor() and velocity.y < 0:
		jumping()
		
	if not is_on_floor() and velocity.y > 0:
		falling()
	
	if is_on_floor() and velocity.x == 0:
		if not is_dashing:
			idling()
		
	if is_on_floor() and velocity.x != 0:
		if not is_dashing:
			running()
	
	if Input.is_action_just_pressed("jump") and is_on_floor() and not is_dashing:
		perform_jump()
		
	if Input.is_action_just_pressed("dash") and is_on_floor() and not is_dashing:
		perform_dash()
	
	if not is_dashing:
		if direction:
			velocity.x = direction.x * speed
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()
	update_animation()
	update_facing_direction()


func perform_jump():
	velocity.y = jump_velocity


func perform_dash():
	dashing()
	
	if direction.x == 0:
		if is_facing_right:
			velocity.x = move_toward(velocity.x + 300, 1 * dash_velocity, dash_speed)
		else:
			velocity.x = move_toward(velocity.x - 300, -1 * dash_velocity, dash_speed)
	else:
		velocity.x = move_toward(velocity.x, direction.x * dash_velocity, dash_speed)
	
	await get_tree().create_timer(0.4).timeout
	
	idling()


func update_animation():
	if is_idling:
		animated_sprite.play("idle")
	elif is_running:
		animated_sprite.play("run")
	elif is_jumping:
		animated_sprite.play("jump_up")
	elif is_falling:
		animated_sprite.play("jump_down")
	elif is_dashing:
		animated_sprite.play("dash")


func update_facing_direction():
	if direction.x < 0:
		animated_sprite.flip_h = true
		is_facing_right = false
		is_facing_left = true
	elif direction.x > 0:
		animated_sprite.flip_h = false
		is_facing_right = true
		is_facing_left = false
