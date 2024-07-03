class_name ArmProjectile extends AnimatedSprite2D

signal impact()

@onready var player_detection_area : PlayerDetectionArea = $PlayerDetectionArea
@onready var impact_area : PlayerDetectionArea = $ImpactArea
@onready var fuse_timer : Timer = $FuseTimer
@onready var hitbox : HitBox = $HitBox
@onready var hitbox_collision : CollisionShape2D = $HitBox/CollisionShape2D


var target_postion : Vector2 = Vector2.ZERO
var last_known_targeted_direction : Vector2
var active : bool = false
var hit: bool = false

var acceleration : Vector2 = Vector2.ZERO
var velocity : Vector2 = Vector2.ZERO
var golem : Golem 


func setup(_golem : Golem):
	golem = _golem
	hitbox.setup(golem.golem_data.RANGE_ATTACK_DMG, 2, 0)


func _ready():
	visible = false
	

func _physics_process(delta: float) -> void:
	hitbox_collision.disabled = not active
	
	if not active:
		return
		
	if impact_area.can_see_player():
		hit = true
		impact.emit()
		reset()

	if player_detection_area.can_see_player():
		last_known_targeted_direction = (target_postion - global_position).normalized()
		target_postion = player_detection_area.player_position()
	
	var direction: Vector2 = last_known_targeted_direction
	acceleration = direction * 1000

	velocity += acceleration * delta
	velocity.limit_length(500)

	global_position += velocity * delta
	

func hit_the_target() -> bool:
	return hit


func launch():	
	fuse_timer.start()
	hit = false
	active = true
	visible = true


func reset():
	rotation = 0
	acceleration = Vector2.ZERO
	velocity = Vector2.ZERO
	target_postion = Vector2.ZERO
	global_position = golem.global_position
	active = false
	visible = false
	


func _on_fuse_timer_timeout():
	impact.emit()
	reset()
