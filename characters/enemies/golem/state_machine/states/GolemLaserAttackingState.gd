class_name GolemLaserAttackingState extends GolemState

const LASER_ATTACK_ANIMATION: String = "laser_attack"

var rng = RandomNumberGenerator.new()

var target_position : Vector2
var start_position : Vector2
var end_position : Vector2

var golem_info : GolemData


func on_enter():
	golem_info = golem.golem_data

	golem.animation_player.connect("animation_finished", _on_animation_finished)
	golem.animation_player.play(LASER_ATTACK_ANIMATION)

	golem.velocity = Vector2.ZERO

	start_position = golem.player_position() + golem_info.LASER_START_OFFSET
	end_position = golem.player_position() + golem_info.LASER_END_OFFSET

	target_position = start_position


func on_exit():
	golem.animation_player.disconnect("animation_finished", _on_animation_finished)


func state_process(delta):
	var direction: Vector2 = (target_position - golem.global_position).normalized()
	var angle: float = direction.angle()

	if golem.sprite.scale.x < 0:
		angle = PI - angle

	golem.head_pivot.rotation = angle

	var laser_move_distance = golem_info.LASER_SPEED * delta
	var target_direction: Vector2 = (end_position - target_position).normalized()

	target_position += target_direction * laser_move_distance


func state_input(event: InputEvent):
	pass


func _on_animation_finished(anim_name):
	if anim_name == LASER_ATTACK_ANIMATION:
		if rng.randf() < golem_info.P_SPECIAL_ATTACK:
			next_state = states["SpecialAttacking"]
		else:
			next_state = states["Chasing"]
