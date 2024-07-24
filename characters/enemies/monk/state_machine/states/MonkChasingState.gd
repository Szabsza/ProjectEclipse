class_name MonkChasingState extends MonkState

const RUN_ANIMATION : String = "run"

var monk_info : MonkData
var rng = RandomNumberGenerator.new()


func on_enter():
	monk.alerted = true
	monk_info = monk.monk_data
	monk.animation_player.play(RUN_ANIMATION)
	monk.audio_player.play_walk_fx()


func on_exit():
	monk.audio_player.clear()


func state_process(delta):
	var direction: Vector2 = (monk.player_position() - monk.global_position).normalized()
	monk.velocity.x = direction.x * monk_info.CHASING_SPEED
	if direction.x < 0:
		monk.sprite.scale.x = -1
	else:
		monk.sprite.scale.x = 1

	var distance_from_player = abs(monk.player_position().x - monk.position.x)
	if distance_from_player < monk_info.MIN_RANGE_MELEE_ATTACKS:
		var choice = rng.randf()
		if not monk.player_detection_area_alerted.player.is_on_floor():
			next_state = states["SpecialAttacking"]
		elif choice < monk_info.P_SPECIAL_ATTACK:
			next_state = states["SpecialAttacking"]
		else:
			next_state = states["Attacking"]


	if not monk.player_detection_area_alerted.is_able_to_see_player:
		next_state = states["Patrolling"]


func state_input(event: InputEvent):
	pass
