class_name WormDashingState extends WormState

const DASH_ANIMATION: String = "dash"

var worm_info : WormData


func on_enter():
	worm_info = worm.worm_data
	worm.animation_player.connect("animation_finished", _on_animation_finished)
	worm.animation_player.play(DASH_ANIMATION)
	worm.velocity.x = worm.sprite.scale.x * worm_info.DASH_SPEED


func on_exit():
	worm.animation_player.disconnect("animation_finished", _on_animation_finished)


func state_process(delta):
	pass


func state_input(event: InputEvent):
	pass


func _on_animation_finished(anim_name : String):
	if anim_name == DASH_ANIMATION:
		next_state = states["Chasing"]
