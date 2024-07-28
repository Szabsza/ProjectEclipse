class_name Monk extends CharacterBody2D

@onready var sprite : Sprite2D = $Sprite2D
@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var state_machine : MonkStateMachine = $MonkStateMachine
@onready var player_detection_area_idle: PlayerDetectionArea = $Sprite2D/PlayerDetectionAreaIdle
@onready var player_detection_area_alerted: PlayerDetectionArea = $Sprite2D/PlayerDetectionAreaAlerted
@onready var health_bar : TextureProgressBar = $HealthBar
@onready var state_label : Label = $StateLabel
@onready var audio_player : MonkAudioStreamPlayer = $MonkAudioStreamPlayer
@onready var melee_hitbox : HitBox = $Sprite2D/MeleeHitbox
@onready var special_attack_hitbox : HitBox = $Sprite2D/SpecialAttackHitbox
@onready var hurtbox : HurtBox = $Sprite2D/HurtBox

const RUNE_DROP_SCENE_PATH : String = "res://characters/common/RuneDrop.tscn"

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var pushback_force : Vector2 = Vector2.ZERO
var is_facing_left : bool = false
var is_facing_right : bool = true
var is_facing_direction_locked : bool = false
var alerted : bool = false
var monk_data : MonkData
var waypoints : Array

@export var start_waypoint_index : int
@export var end_waypoint_index : int
@export var dropped_runes_amount : int


func setup(_waypoints : Array):
	waypoints = _waypoints


func _init():
	monk_data = MonkData.new()


func _ready():
	collision_layer = 4
	collision_mask = 1

	state_machine.setup(self)
	melee_hitbox.setup(monk_data.MELEE_ATTACK_DAMAGE, 8, 0)
	special_attack_hitbox.setup(monk_data.SPECIAL_ATTACK_DAMAGE, 8, 0)
	hurtbox.setup(0, 2)
	health_bar.max_value = monk_data.health.max_health

	
func _physics_process(delta):
	health_bar.visible = not monk_data.health.current_health == monk_data.health.max_health
	health_bar.value = monk_data.health.current_health
	state_label.text = state_machine.current_state.name

	if not is_on_floor():
		velocity.y += gravity / 3 * delta

	pushback_force = lerp(pushback_force, Vector2.ZERO, delta * 10)
	position += pushback_force

	move_and_slide()


func drop_runes():
	var rune_drop_scene = load(RUNE_DROP_SCENE_PATH)
	var rune_drop: RuneDrop = rune_drop_scene.instantiate() as RuneDrop
	
	get_parent().add_child(rune_drop)
	
	rune_drop.global_position = global_position
	rune_drop.setup(dropped_runes_amount)
	rune_drop.launch()


func take_damage(amount : float):
	if not monk_data.is_dead:
		audio_player.play_get_hit_fx()
		monk_data.health.decrease_current_health(amount)
		if monk_data.health.current_health <= 0:
			state_machine.switch_state(state_machine.monk_states["Dying"])
			drop_runes()
		else:
			state_machine.switch_state(state_machine.monk_states["Hurting"])


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


func random_destination_waypoint() -> Dictionary:
	var rng: int = start_waypoint_index + randi() % (end_waypoint_index - start_waypoint_index + 1)
	return {
		"waypoint" : waypoints[rng],
		"waypoint_index": rng,
	}
