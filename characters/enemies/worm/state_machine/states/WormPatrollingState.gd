class_name WormPatrollingState extends WormState

const WALKING_ANIMATION : String = "walk"

var destination_waypoint : Node2D
var worm_info : WormData 


func on_enter():
	worm_info = worm.worm_data
	worm.animation_player.play(WALKING_ANIMATION)
	var new_destination_waypoint: Node2D = worm.random_destination_waypoint()
	if new_destination_waypoint != destination_waypoint:
		destination_waypoint = new_destination_waypoint
	

func on_exit():
	worm.velocity.x = 0


func state_process(delta):
	var direction: Vector2             = (destination_waypoint.global_position - worm.global_position).normalized()
	var distance_to_destination: float = worm.global_position.distance_to(destination_waypoint.global_position)
	
	if distance_to_destination > worm_info.MIN_WAYPOINT_DISTANCE:
		worm.velocity.x = direction.x * worm_info.WALKING_SPEED
		if direction.x < 0:
			worm.sprite.scale.x = -1
		else:
			worm.sprite.scale.x = 1
	else:
		next_state = states["Idling"]
		
	if worm.can_see_player():
		next_state = states["Chasing"]


func state_input(event: InputEvent):
	pass
