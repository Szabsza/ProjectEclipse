class_name MonkChasingState extends State

const RUN_ANIMATION : String = "run"


func on_enter():
	playback.travel(RUN_ANIMATION)


func state_process(delta):
	if character.player_detection_area.is_able_to_see_player:
		var direction = (character.player_detection_area.player_position - character.position).normalized()
		character.velocity.x = direction.x * 150
		if direction.x < 0:
			character.is_facing_right = true
			character.is_facing_left = false
			character.sprite.scale.x = -1
		elif direction.x > 0:
			character.is_facing_right = false
			character.is_facing_left = true
			character.sprite.scale.x = 1
		
		if abs(character.player_detection_area.player_position.x - character.position.x) < 50:
			next_state = states["Attacking"] 
			
	else:
		next_state = states["Idling"]


func on_exit():
	character.velocity.x = 0
	character.velocity.y = 0
