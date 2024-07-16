class_name WormPatrollingState extends WormState

const WALKING_ANIMATION : String = "walk"

var destination_waypoint : Node2D


func on_enter():
	worm.animation_player.play(WALKING_ANIMATION)
	var new_destination_waypoint = worm.random_destination_waypoint()
	if new_destination_waypoint != destination_waypoint:
		destination_waypoint = new_destination_waypoint
	

func on_exit():
	worm.velocity.x = 0


func state_process(delta):
	var direction: Vector2 = (destination_waypoint.global_position - worm.global_position).normalized()
	var distance_to_destination = worm.global_position.distance_to(destination_waypoint.global_position)
	
	if distance_to_destination > 10:
		worm.velocity.x = direction.x * 100
		if direction.x < 0:
			worm.sprite.scale.x = -1
		else:
			worm.sprite.scale.x = 1
	else:
		print("asd")
		next_state = states["Idling"]
		
	if worm.can_see_player():
		next_state = states["Chasing"]


func state_input(event: InputEvent):
	pass

