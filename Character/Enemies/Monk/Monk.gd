class_name Monk extends CharacterBody2D

@onready var sprite : Sprite2D = $Sprite2D
@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine
@onready var player_detection_area : Area2D = $Sprite2D/PlayerDetectionArea

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var pushback_force : Vector2 = Vector2.ZERO

func take_damage(amount : float):
	print("hit")


func knock_back(source_position : Vector2):
	pushback_force = -global_position.direction_to(source_position) * 3
	if source_position.x > position.x:
		sprite.scale.x = 1
	elif source_position.x < position.x:
		sprite.scale.x = -1
	

func _ready():
	collision_layer = 4
	collision_mask = 1
	animation_tree.active = true
	state_machine.setup(self, animation_tree)
	player_detection_area.setup(self)

	
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	pushback_force = lerp(pushback_force, Vector2.ZERO, delta * 10)
	position += pushback_force
	
	move_and_slide()
