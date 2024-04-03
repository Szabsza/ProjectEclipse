class_name JumpingState extends State

@export var speed : float = 200.0
@export var jump_acceleration : float = 0.25
@export var jump_velocity : float = -300.0

const JUMP_ANIMATION : String = "jump"


func state_process(delta):
	if character.is_on_floor():
		next_state = states["Idling"]
	
	if character.velocity.y > 0 and not character.is_on_floor():
		next_state = states["Falling"]
	
	character.velocity.x = character.direction.x * speed


func state_input(event : InputEvent):
	if event.is_action_pressed("attack") \
	and character.stamina.current_stamina - character.ATTACK_STAMINA_COST > 0:
		perform_jumping_attack()
	
	if event.is_action_pressed("jump") \
	and not character.has_double_jumped \
	and character.stamina.current_stamina - character.JUMP_STAMINA_COST > 0:
		perform_jump()


func perform_jumping_attack():
	next_state = states["JumpAttacking"]


func perform_jump():
	character.velocity.y = jump_velocity
	character.has_double_jumped = true
	next_state = states["Jumping"]


func on_enter():
	playback.travel(JUMP_ANIMATION)
	character.stamina.decrease_current_stamina(character.JUMP_STAMINA_COST)


func on_exit():
	pass
