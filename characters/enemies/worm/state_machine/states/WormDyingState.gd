class_name WormDyingState extends WormState

const DEATH_ANIMATION : String = "death"


func on_enter():
	worm.animation_player.connect("animation_finished", _on_animation_finished)
	worm.animation_player.play(DEATH_ANIMATION)
	worm.velocity = Vector2.ZERO


func on_exit():
	worm.animation_player.disconnect("animation_finished", _on_animation_finished)
	

func state_process(delta):
	pass
	
	
func state_input(input : InputEvent):
	pass


func _on_animation_finished(anim_name : String):
	if anim_name == DEATH_ANIMATION:
		worm.visible = false
		
