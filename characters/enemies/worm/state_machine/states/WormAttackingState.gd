class_name WormAttackingState extends WormState

const ATTACK_ANIMATION : String = "attack"
const FIREBALL_SCENE : String = "res://characters/enemies/worm/FireBall.tscn"

var launched : bool = false
var worm_info : WormData


func on_enter():
	worm_info = worm.worm_data
	worm.animation_player.connect("animation_finished", _on_animation_finished)
	worm.animation_player.play(ATTACK_ANIMATION)
	worm.velocity.x = 0
	launched = false


func on_exit():
	worm.animation_player.disconnect("animation_finished", _on_animation_finished)


func state_process(delta):
	if worm.sprite.frame == 12 and not launched:
		launch_fireball()
	
	var direction: Vector2 = (worm.player_position() - worm.global_position).normalized()
	if direction.x < 0:
		worm.sprite.scale.x = -1
	else:
		worm.sprite.scale.x = 1
	

func state_input(event: InputEvent):
	pass


func perform_dash():
	pass
	
	
func _on_animation_finished(anim_name : String):
	if anim_name == ATTACK_ANIMATION:
		next_state = states["Idling"]
		
		
func launch_fireball():
	launched = true
	
	var fireball_scene     = load(FIREBALL_SCENE)
	var fireball: FireBall = fireball_scene.instantiate() as FireBall
	
	get_parent().add_child(fireball)
	
	fireball.global_position = worm.head_pivot.global_position
	fireball.setup(worm, worm.player_position())
	fireball.launch()
	
	worm.velocity.x = -1 * worm.sprite.scale.x * worm_info.DASHBACK_SPEED
