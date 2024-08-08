class_name Remains extends RigidBody2D

@onready var interactable_area : InteractableArea = $InteractableArea

var runes_amount : int = 0
var scene_path : String = ""
var position_to_place : Vector2 = Vector2.ZERO


func setup(_scene_path : String, _runes_amount: int, _position : Vector2) -> void:
	scene_path = _scene_path
	runes_amount = _runes_amount
	position_to_place = _position


func _ready():
	collision_layer = 2
	collision_mask = 1
	lock_rotation = true
	interactable_area.interact = Callable(self, "_on_interact")
	

func _on_interact() -> void:
	PlayerManager.player_data.runes_held.increase_runes(runes_amount)
	PlayerManager.remove_remains()
