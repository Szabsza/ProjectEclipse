class_name WormDashingState extends WormState

const DASH_ANIMATION: String = "dash"


func on_enter():
    worm.animation_player.connect("animation_finished", _on_animation_finished)
    worm.animation_player.play(DASH_ANIMATION)


func on_exit():
    worm.animation_player.disconnect("animation_finished", _on_animation_finished)


func state_process(delta):
    pass


func state_input(event: InputEvent):
    pass


func _on_animation_finished(anim_name : String):
    if anim_name == DASH_ANIMATION:
        next_state = states["Chasing"]