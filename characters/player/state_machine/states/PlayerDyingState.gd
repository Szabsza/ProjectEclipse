class_name PlayerDyingState extends PlayerState

const DEATH_ANIMATION : String = "death"


func on_enter():
	player.animation_player.connect("animation_finished", _on_animation_finished)
	player.animation_player.play(DEATH_ANIMATION)
	player.velocity.x = 0
	player.facing_direction_locked = true
	player.player_data.died = true


func on_exit():
	player.animation_player.disconnect("animation_finished", _on_animation_finished)
	player.facing_direction_locked = false


func state_process(delta):
	pass


func state_input(event: InputEvent):
	pass


func _on_animation_finished(anim_name):
	if anim_name == DEATH_ANIMATION:
		if not player.multiplayer_mode:
			await player.hud.show_death_toast()
			PlayerManager.die_and_respawn(player.global_position)
		next_state = states["Idling"]
