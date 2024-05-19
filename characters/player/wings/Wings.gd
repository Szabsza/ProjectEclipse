class_name WingsSprite extends AnimatedSprite2D

@onready var spread_timer : Timer = $WingSpreadTimer
@onready var disapear_timer : Timer = $WingDisapearTimer

var current_animation : String = ""

const SPREAD_ANIMATION : String = "spread"
const LAUNCH_ANIMATION : String = "launch"


func _ready() -> void:
	visible = false
	

func launch():
	visible = true
	current_animation = SPREAD_ANIMATION
	spread_timer.start()
	play(SPREAD_ANIMATION)

	
func _on_animation_finished() -> void:	
	if current_animation == LAUNCH_ANIMATION:
		disapear_timer.start()


func _on_wing_spread_timer_timeout() -> void:
	current_animation = LAUNCH_ANIMATION
	play(LAUNCH_ANIMATION)


func _on_wing_disapear_timer_timeout() -> void:
	visible = false
