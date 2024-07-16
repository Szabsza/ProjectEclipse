class_name Worm extends CharacterBody2D

@onready var sprite : Sprite2D = $Sprite2D
@onready var state_machine: WormStateMachine = $WormStateMachine
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var player_detection_area_idle: PlayerDetectionArea = $Sprite2D/PlayerDetectionAreaIdle
@onready var player_detection_area_alerted: PlayerDetectionArea = $Sprite2D/PlayerDetectionAreaAlerted
@onready var state_label : Label = $StateLabel
@onready var head_pivot : Node2D = $Sprite2D/HeadPivot

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var pushback_force : Vector2 = Vector2.ZERO
var is_facing_left : bool = false
var is_facing_right : bool = true
var is_facing_direction_locked : bool = false

#var worm_data : WormData

var waypoints : Array

@export var start_waypoint_index : int 
@export var end_waypoint_index : int 


func setup(_waypoints : Array):
	waypoints = _waypoints


func _ready():
	collision_layer = 4
	collision_mask = 1
	state_machine.setup(self)


func _physics_process(delta):
	state_label.text = state_machine.current_state.name
	
	if not is_on_floor():
		velocity.y += gravity / 3 * delta
	
	pushback_force = lerp(pushback_force, Vector2.ZERO, delta * 10)
	position += pushback_force
	
	move_and_slide()


func take_damage(amount : float):
	#health.decrease_current_health(amount)
	#if health.current_health <= 0:
		#state_machine.switch_state(state_machine.states["Dying"])
	pass


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


func can_see_player() -> bool:
	return player_detection_area_idle.is_able_to_see_player


func player_position() -> Vector2:
	return player_detection_area_alerted.player_position()


func random_destination_waypoint() -> Node2D:
	return waypoints[start_waypoint_index + randi() % (end_waypoint_index + 1)]


#func scale_up_player_detection():
	#player_detection_area
