class_name DyingState extends PlayerState

const DEATH_ANIMATION : String = "death"


func on_enter():
	player.velocity.x = 0
	player.facing_direction_locked = true
	playback.travel(DEATH_ANIMATION)


func on_exit():
	player.facing_direction_locked = false


func _on_animation_tree_animation_finished(anim_name):
	if anim_name == DEATH_ANIMATION:
		PlayerManager.die_and_respawn(player.global_position)
		next_state = states["Idling"]
