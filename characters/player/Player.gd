class_name Player extends CharacterBody2D

@onready var sprite : Sprite2D = $Sprite2D
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine : PlayerStateMachine = $PlayerStateMachine
@onready var hurtbox : HurtBox = $Sprite2D/HurtBox
@onready var stamina_regen_timer : Timer = $StaminaRegenerationTimer

@export var health : Health
@export var mana : Mana
@export var stamina : Stamina
@export var runes_held : RunesHeld
@export var status : Status
@export var player_data : PlayerData

var is_facing_left : bool = false
var is_facing_right : bool = true
var facing_direction_locked : bool = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2


func resources_loaded():
	if player_data == null:
		OS.alert("player data has not been set!")
		return false
		
	if status == null:
		OS.alert("player status has not been set!")
		return false
		
	if runes_held == null:
		OS.alert("player runes has not been set!")
		return false
		
	if health == null:
		OS.alert("player health has not been set!")
		return false
		
	if mana == null:
		OS.alert("player mana has not been set!")
		return false	
	
	if stamina == null:
		OS.alert("player stamina has not been set!")
		return false
	
	return true
	

func _ready():
	add_to_group("player")
	
	if not resources_loaded():
		return
	
	collision_layer = 4
	collision_mask = 1
	animation_tree.active = true
	state_machine.setup(self)
	
	hurtbox.setup(0, 2)
	
	for child in sprite.get_children():
		if child is HitBox:
			child.setup(player_data.attack_damage, 2, 0)


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


func _on_stamina_regeneration_timer_timeout():
	stamina.regen_stamina()
