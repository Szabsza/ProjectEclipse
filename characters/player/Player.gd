class_name Player extends CharacterBody2D

@onready var sprite : Sprite2D = $Sprite2D
@onready var wings_sprite : WingsSprite = $Wings
@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var state_machine : PlayerStateMachine = $PlayerStateMachine
@onready var hurtbox : HurtBox = $Sprite2D/HurtBox
@onready var stamina_regen_timer : Timer = $StaminaRegenerationTimer
@onready var audio_player : PlayerAudioStreamPlayer = $PlayerAudioStreamPlayer
@onready var hud : PlayerHud = $PlayerHud
@onready var multiplayer_synchronizer : MultiplayerSynchronizer = $MultiplayerSynchronizer
@onready var camera : Camera2D = $Camera2D

@export var player_data : PlayerData

var health : Health
var mana : Mana
var stamina : Stamina
var power : Power
var runes_held : RunesHeld
var status : Status

var is_facing_left : bool = false
var is_facing_right : bool = true
var facing_direction_locked : bool = false
var is_able_to_move : bool = true
var multiplayer_mode : bool = false

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2


func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())


func _init() -> void:
	player_data = PlayerData.new()


func _ready():
	health = player_data.health
	mana = player_data.mana
	stamina = player_data.stamina
	power = player_data.power
	runes_held = player_data.runes_held
	status = player_data.status
	
	collision_layer = 4
	collision_mask = 1

	state_machine.setup(self)	 
	
	setup_hurtbox()
	setup_hitboxes()
			
	hud.setup(self)
			
	power.on_power_changed.connect(setup_hitboxes)
			
	InteractionManager.connect("interacted", _interacted)
	InteractionManager.connect("interaction_finished", _interaction_finished)


func setup_hurtbox(layer = 0, mask = 8):
	hurtbox.setup(layer, mask)


func setup_hitboxes(layer = 2, mask = 0):
	for child in sprite.get_children():
		if child is HitBox:
			child.setup(power.current_power + player_data.attack_damage, layer, mask)


func refresh_hurtbox():
	for child in hurtbox.get_children():
		if child is CollisionShape2D:
			child.disabled = false


func refresh_hitboxes():
	for child in sprite.get_children():
		if child is HitBox:
			for child_of_child in child.get_children():
				if child_of_child is CollisionShape2D:
					child_of_child.disabled = true


func _physics_process(delta):
	if is_multiplayer_authority():
		camera.make_current()
		
		direction = Input.get_vector("left", "right", "up", "down")
				
		if not is_on_floor():
			velocity.y += gravity * delta
			
		update_facing_direction()
		move_and_slide()
	

func update_facing_direction():
	if not facing_direction_locked:
		if direction.x < 0:
			sprite.scale.x = -1
			wings_sprite.scale.x = -1
			is_facing_right = false
			is_facing_left = true
		elif direction.x > 0:
			sprite.scale.x = 1
			wings_sprite.scale.x = 1
			is_facing_right = true
			is_facing_left = false
			

func take_damage(amount):
	health.decrease_current_health(amount)
	if health.current_health <= 0 and not player_data.died:
		state_machine.switch_state(state_machine.player_states["Dying"])


func _on_stamina_regeneration_timer_timeout():
	stamina.regen_stamina()


func _interaction_finished():
	state_machine.switch_state(state_machine.player_states["Idling"])


func _interacted():
	state_machine.switch_state(state_machine.player_states["Idling"])
	state_machine.switch_state(state_machine.player_states["Interacting"])
