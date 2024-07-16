class_name FireBall extends AnimatedSprite2D

@onready var hitbox : HitBox = $HitBox

const EXPLOSION_ANIMATION : String = "explosion"
const GRAVITY : Vector2 = Vector2(0, 100)
const TARGET_POSITION_OFFSET : Vector2 = Vector2(0, 25)

var target_position : Vector2 = Vector2.ZERO
var acceleration : Vector2 = Vector2.ZERO
var velocity : Vector2 = Vector2.ZERO
var direction : Vector2 = Vector2.ZERO
var hit : bool = false

var worm : Worm 


func setup(_worm : Worm, _target_position : Vector2):
	worm = _worm
	target_position = _target_position - TARGET_POSITION_OFFSET
	direction = (target_position - global_position).normalized()


func _ready():
	visible = false
	
	

func _physics_process(delta: float) -> void:
	if not hit:
		velocity = direction * 200
		velocity += GRAVITY * delta
		global_position += velocity * delta
		direction = velocity.normalized()
		rotation = direction.angle()


func launch():	
	visible = true


func _on_hit_box_body_entered(body: Node2D) -> void:
	hit = true
	velocity = Vector2.ZERO
	animation = EXPLOSION_ANIMATION
	
	
func _on_animation_finished():
	if animation == EXPLOSION_ANIMATION:
		queue_free()
