class_name WormChasingState extends WormState

const WALKING_ANIMATION: String = "walk"

var worm_info : WormData 


func on_enter():
	worm_info = worm.worm_data
	worm.animation_player.play(WALKING_ANIMATION)


func on_exit():
	pass


func state_process(delta):
	var direction: Vector2 = (worm.player_position() - worm.global_position).normalized()
	worm.velocity.x = direction.x * worm_info.CHASING_SPEED
	if direction.x < 0:
		worm.sprite.scale.x = -1
	else:
		worm.sprite.scale.x = 1
	
	var distance_from_player = abs(worm.player_position().x - worm.position.x)
	if distance_from_player < worm_info.MIN_RANGE_DASH_ATTACKS:
		next_state = states["Dashing"]
	elif distance_from_player < worm_info.MIN_RANGE_FIREBALL_ATTACKS:
		next_state = states["Attacking"]

	if not worm.player_detection_area_alerted.is_able_to_see_player:
		next_state = states["Patrolling"]


func state_input(event: InputEvent):
	pass
