class_name MonkIdlingState extends MonkState

@onready var patrolling_timer : Timer = $PatrollingTimer

const IDLE_ANIMATION : String = "idle"


func on_enter():
	monk.animation_player.play(IDLE_ANIMATION)
	patrolling_timer.start()
	monk.velocity.x = 0


func on_exit():
	pass


func state_process(delta):
	pass


func state_input(event: InputEvent):
	pass


func _on_patrolling_timer_timeout() -> void:
	next_state = states["Patrolling"]
