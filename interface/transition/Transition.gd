class_name Transition extends CanvasLayer

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var timer : Timer = $Timer

const DISSOLVE_ANIMATION : String = "dissolve"
const DISSOLVE_BACK_ANIMATION : String = "dissolve_back"


func play():
	animation_player.play(DISSOLVE_ANIMATION)


func _on_timer_timeout():
	animation_player.play(DISSOLVE_BACK_ANIMATION)


func _on_animation_player_animation_finished(anim_name):
	if anim_name == DISSOLVE_ANIMATION:
		timer.start()
	
	if anim_name == DISSOLVE_BACK_ANIMATION:
		timer.stop()
