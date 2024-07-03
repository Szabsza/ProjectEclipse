class_name GolemRangeAttackingState extends GolemState

@export var arm_projectile : ArmProjectile

const RANGE_ATTACK_ANIMATION: String = "range_attack"

var rng = RandomNumberGenerator.new()
var is_able_to_switch_direction : bool = false


func on_enter() -> void:
	golem.animation_player.connect("animation_finished", _on_animation_finished)
	golem.animation_player.play(RANGE_ATTACK_ANIMATION)
	golem.velocity = Vector2.ZERO
	is_able_to_switch_direction = true


func on_exit():
	golem.animation_player.disconnect("animation_finished", _on_animation_finished)


func state_process(delta):
	if is_able_to_switch_direction:
		var direction: Vector2 = (golem.player_position() - golem.global_position).normalized()
		if direction.x < 0:
			golem.sprite.scale.x = -1
		else:
			golem.sprite.scale.x = 1


func state_input(event: InputEvent):
	pass


func _on_animation_finished(anim_name):
	if anim_name == RANGE_ATTACK_ANIMATION:
		golem.projectile.launch()
		
		is_able_to_switch_direction = false
		await golem.projectile.impact
		is_able_to_switch_direction = true
		
		if golem.projectile.hit_the_target():
			next_state = states["Dashing"]
		else:
			next_state = states["Chasing"]
