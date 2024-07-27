class_name EnemyLootItem extends RigidBody2D

var direction : Vector2 = Vector2.ZERO
var acceleration : Vector2 = Vector2.ZERO
var velocity : Vector2 = Vector2.ZERO
const GRAVITY : Vector2 = Vector2(0, 300)
var should_toss : bool = false

func _ready() -> void:
	lock_rotation = true 
	visible = false


func _physics_process(delta: float) -> void:
	if should_toss:
		velocity = direction * 200
		velocity += GRAVITY * delta
		global_position += velocity * delta
		direction = velocity.normalized()


func toss_randomly():
	visible = true
	should_toss = true
	var target_position = PlayerManager.player.global_position + Vector2(0, -300)
	direction = (target_position - global_position).normalized()
