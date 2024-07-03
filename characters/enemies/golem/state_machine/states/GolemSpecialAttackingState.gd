class_name GolemSpecialAttackingState extends GolemState

@onready var top_targeting_timer : Timer = $TopTargetingTimer
@onready var left_right_targeting_timer : Timer = $LeftRightTargetingTimer

const SPECIAL_ATTACK_ANIMATION : String = "immune"

var can_top_laser_lock_on : bool = false
var can_left_and_right_laser_lock_on : bool = false


func calculate_angle(from_position : Vector2) -> float:
	var direction: Vector2 = (golem.player_position() - from_position).normalized()
	var angle: float = direction.angle()

	if golem.sprite.scale.x < 0:
		angle = PI - angle

	return angle


func on_enter():
	golem.animation_player.connect("animation_finished", _on_animation_finished)
	golem.animation_player.play(SPECIAL_ATTACK_ANIMATION)
	golem.velocity = Vector2.ZERO
	top_targeting_timer.start()
	can_top_laser_lock_on = true
	can_left_and_right_laser_lock_on = true


func on_exit():
	golem.animation_player.disconnect("animation_finished", _on_animation_finished)


func state_process(delta):
	if can_top_laser_lock_on:
		golem.top_pivot.rotation = calculate_angle(golem.top_pivot.global_position)
	
	if can_left_and_right_laser_lock_on:
		golem.left_pivot.rotation = calculate_angle(golem.left_pivot.global_position)
		golem.right_pivot.rotation = calculate_angle(golem.right_pivot.global_position)


func state_input(event: InputEvent):
	pass


func _on_animation_finished(anim_name):
	if anim_name == SPECIAL_ATTACK_ANIMATION:
		next_state = states["Chasing"]


func _on_top_targeting_timer_timeout():
	can_top_laser_lock_on = false
	left_right_targeting_timer.start()
	


func _on_left_right_targeting_timer_timeout():
	can_left_and_right_laser_lock_on = false
