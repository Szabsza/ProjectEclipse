class_name GolemChasingState extends GolemState

const CHASING_ANIMATION: String = "idle"

var rng = RandomNumberGenerator.new()
var golem_info : GolemData


func on_enter():
	golem_info = golem.golem_data
	golem.animation_player.play(CHASING_ANIMATION)


func on_exit():
	pass


func state_process(delta):
	var direction: Vector2 = (golem.player_position() - golem.position).normalized()

	golem.velocity.x = direction.x * golem_info.CHASING_SPEED
	if direction.x < 0:
		golem.sprite.scale.x = -1
	else:
		golem.sprite.scale.x = 1

	var distance_from_player = abs(golem.player_detection_area.player_position().x - golem.position.x)
	if distance_from_player > golem_info.MIN_RANGE_RANGE_ATTACKS:
		var choice = rng.randf()
		if choice < golem_info.P_RANGE_ATTACK:
			next_state = states["RangeAttacking"]
		elif choice < golem_info.P_RANGE_ATTACK + golem_info.P_LASER_ATTACK:
			next_state = states["LaserAttacking"]
		elif choice < golem_info.P_RANGE_ATTACK + golem_info.P_LASER_ATTACK + golem_info.P_DASH_ATTACK:
			next_state = states["Dashing"]

	if distance_from_player < golem_info.MIN_RANGE_MELEE_ATTACKS:
		next_state = states["MeleeAttacking"]


func state_input(event: InputEvent):
	pass
