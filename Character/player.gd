class_name Player extends CharacterBody2D

@onready var sprite : Sprite2D = $Sprite2D
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine

var is_facing_left = false
var is_facing_right = true
 
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2

func _ready():
	animation_tree.active = true
	state_machine.setup(self, animation_tree)


func _physics_process(delta):
	direction = Input.get_vector("left", "right", "up", "down")
		
	if not is_on_floor():
		velocity.y += gravity * delta
	
	move_and_slide()
	update_animation()
	update_facing_direction()


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
