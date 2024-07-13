class_name Player extends CharacterBody2D

@onready var sprite : Sprite2D = $Sprite2D
@onready var wings_sprite : WingsSprite = $Wings
@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var state_machine : PlayerStateMachine = $PlayerStateMachine
@onready var hurtbox : HurtBox = $Sprite2D/HurtBox
@onready var stamina_regen_timer : Timer = $StaminaRegenerationTimer
@onready var hud : PlayerHud = $PlayerHud

var player_data : PlayerData
var health : Health
var mana : Mana
var stamina : Stamina
var runes_held : RunesHeld
var status : Status

var is_facing_left : bool = false
var is_facing_right : bool = true
var facing_direction_locked : bool = false
var is_able_to_move : bool = true
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2
	

func _ready():
	player_data = PlayerManager.player_data
	
	health = player_data.health
	mana = player_data.mana
	stamina = player_data.stamina
	runes_held = player_data.runes_held
	status = player_data.status
	
	collision_layer = 4
	collision_mask = 1

	state_machine.setup(self)	 
	#hurtbox.setup(0, 2)
	
	for child in sprite.get_children():
		if child is HitBox:
			child.setup(player_data.attack_damage, 2, 0)
			
	hud.setup(self)
			
	InteractionManager.connect("interacted", _interacted)
	InteractionManager.connect("interaction_finished", _interaction_finished)


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
	if health.current_health <= 0:
		state_machine.switch_state(state_machine.player_states["Dying"])


func _on_stamina_regeneration_timer_timeout():
	stamina.regen_stamina()


func _interaction_finished():
	state_machine.switch_state(state_machine.player_states["Idling"])


func _interacted():
	state_machine.switch_state(state_machine.player_states["Idling"])
	state_machine.switch_state(state_machine.player_states["Interacting"])
