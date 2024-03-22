class_name DyingState extends State

const DEATH_ANIMATION : String = "death"


func on_enter():
	character.velocity.x = 0
	character.facing_direction_locked = true
	playback.travel(DEATH_ANIMATION)


func on_exit():
	character.facing_direction_locked = false


func _on_animation_tree_animation_finished(anim_name):
	if anim_name == DEATH_ANIMATION:
		DeathManager.place_runes_where_player_died(character as Player)
		DeathManager.respawn_player(character as Player)
		next_state = states["Idling"]
