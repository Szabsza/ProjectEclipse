class_name Remains extends RigidBody2D

@onready var interactable_area : InteractableArea = $InteractableArea

@export var remains_data : RemainsData


func setup(scene_path : String, runes_amount: int, position : Vector2):
	if remains_data == null:
		return
	
	remains_data.scene_path = scene_path
	remains_data.runes_amount = runes_amount
	remains_data.position = position
	global_position = position


func _ready():
	collision_layer = 2
	collision_mask = 1
	lock_rotation = true
	interactable_area.interact = Callable(self, "_on_interact")
	

func _on_interact():
	if remains_data == null:
		return
	
	PlayerManager.player_data.runes_held.increase_runes(remains_data.runes_amount)
	remains_data.scene_path = ""
	remains_data.runes_amount = 0
	remains_data.picked_up = true
	
	queue_free()
