class_name MonkPatrollingState extends MonkState

const RUNING_ANIMATION : String = "run"

var destination_waypoint : Node2D
var monk_info : MonkData


func on_enter():
	monk.alerted = false
	monk_info = monk.monk_data
	monk.animation_player.play(RUNING_ANIMATION)
	monk.audio_player.play_walk_fx()
	var new_destination_waypoint: Node2D = monk.random_destination_waypoint()
	if new_destination_waypoint != destination_waypoint:
		destination_waypoint = new_destination_waypoint


func on_exit():
	monk.velocity.x = 0
	monk.audio_player.clear()


func state_process(delta):
	var direction: Vector2             = (destination_waypoint.global_position - monk.global_position).normalized()
	var distance_to_destination: float = monk.global_position.distance_to(destination_waypoint.global_position)

	if distance_to_destination > monk_info.MIN_WAYPOINT_DISTANCE:
		monk.velocity.x = direction.x * monk_info.WALKING_SPEED
		if direction.x < 0:
			monk.sprite.scale.x = -1
		else:
			monk.sprite.scale.x = 1
	else:
		next_state = states["Idling"]

	if monk.can_see_player():
		next_state = states["Chasing"]


func state_input(event: InputEvent):
	pass
