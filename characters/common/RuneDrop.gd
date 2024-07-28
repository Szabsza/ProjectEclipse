class_name RuneDrop extends Sprite2D

@onready var player_detection_area : PlayerDetectionArea = $PlayerDetectionArea
@onready var impact_detection_area : PlayerDetectionArea = $ImpactDetectionArea
@onready var time_until_homming : Timer = $TimeUntilHomming
@onready var coin_sound : AudioStreamPlayer2D = $CoinSound

var amount : int

var picked_up : bool = false
var launched : bool = false
var should_home_to_player : bool = false

var target_position : Vector2 = Vector2.ZERO
var acceleration : Vector2 = Vector2.ZERO
var velocity : Vector2 = Vector2.ZERO


func setup(_amount : int):
	amount = _amount
	

func _ready() -> void:
	visible = false

	
func _physics_process(delta: float) -> void:
	if launched and not should_home_to_player:
		var rng = -100 + randf() * 200 
		target_position = Vector2(global_position.x, global_position.y - 200)
		global_position = global_position.move_toward(target_position, 2.0)
		return 
	
	if launched and player_detection_area.can_see_player():
		target_position = player_detection_area.player_position()
		global_position = global_position.move_toward(target_position, 7.0)
		
	if not picked_up and impact_detection_area.can_see_player():
		picked_up = true
		coin_sound.play()
		impact_detection_area.player.player_data.runes_held.increase_runes(amount)
		visible = false
		
		await coin_sound.finished
		
		queue_free()
	

func launch():
	launched = true
	visible = true
	time_until_homming.start()


func _on_time_until_homming_timeout() -> void:
	should_home_to_player = true
