class_name Golem extends CharacterBody2D

@onready var sprite : Sprite2D = $GolemSprite
@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine : GolemStateMachine = $GolemStateMachine
@onready var player_detection_area : PlayerDetectionArea = $GolemSprite/PlayerDetectionArea
@onready var projectile : ArmProjectile = $GolemSprite/Projectile/ArmProjectile
@onready var head_pivot : Node2D = $GolemSprite/HeadPivot
@onready var top_pivot : Node2D = $GolemSprite/PivotTop
@onready var left_pivot : Node2D = $GolemSprite/PivotLeft
@onready var right_pivot : Node2D = $GolemSprite/PivotRight
@onready var hud : BossHud = $BossHud
@onready var state_label : Label = $StateLabel
@onready var audio_player : GolemAudioStreamPlayer = $GolemAudioStreamPlayer
@onready var hurt_box : HurtBox = $GolemSprite/HurtBox
@onready var melee_hitbox : HitBox = $GolemSprite/MeleeHitBox
@onready var dash_hitbox : HitBox = $GolemSprite/DashHitbox
@onready var head_laser_hitbox : HitBox = $GolemSprite/HeadPivot/HeadLaser/HitBox
@onready var top_laser_hitbox : HitBox = $GolemSprite/PivotTop/TopLaser/HitBox
@onready var left_laser_hitbox : HitBox = $GolemSprite/PivotLeft/LeftLaser/HitBox
@onready var right_laser_hitbox : HitBox = $GolemSprite/PivotRight/RightLaser/HitBox


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var golem_data : GolemData


func setup(_golem_data = null):
	golem_data = GolemData.new(_golem_data)
	

func _init():
	golem_data = GolemData.new()


func _ready():
	sprite.scale.x = -1 * sprite.scale.x
	animation_tree.active = true
	
	collision_layer = golem_data.collision_layer
	collision_mask = golem_data.collision_mask
	
	melee_hitbox.setup(golem_data.MELEE_ATTACK_DMG, 8, 0)
	dash_hitbox.setup(golem_data.DASH_ATTACK_DMG, 8, 0)
	head_laser_hitbox.setup(golem_data.LASER_ATTACK_DMG, 8, 0)
	top_laser_hitbox.setup(golem_data.LASER_ATTACK_DMG, 8, 0)
	left_laser_hitbox.setup(golem_data.LASER_ATTACK_DMG, 8, 0)
	right_laser_hitbox.setup(golem_data.LASER_ATTACK_DMG, 8, 0)
	hurt_box.setup(0, 2)
	
	state_machine.setup(self)
	projectile.setup(self)
	hud.setup(golem_data.name, golem_data.health)
	

func _physics_process(delta):
	state_label.text = state_machine.current_state.get_name()
	
	if not is_on_floor():
		velocity.y += gravity * delta

	move_and_slide()


func take_damage(damage : int):
	if not dead():
		golem_data.health.decrease_current_health(damage)
		if golem_data.health.current_health <= 0:
			golem_data.is_dead = true
			state_machine.switch_state(state_machine.golem_states["Dying"]) 


func can_see_player() -> bool:
	return player_detection_area.can_see_player()


func player_position() -> Vector2:
	return player_detection_area.player_position()


func dead() -> bool:
	return golem_data.is_dead
