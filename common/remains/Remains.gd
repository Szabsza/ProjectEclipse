class_name Remains extends RigidBody2D

@onready var interactable_area : InteractableArea = $InteractableArea

var starting_position : Vector2
var runes_amount : int = 0


func setup(runes_amount: int, position : Vector2):
	self.runes_amount = runes_amount
	global_position = position
	

func _ready():
	collision_layer = 2
	collision_mask = 1
	lock_rotation = true
	starting_position = global_position
	interactable_area.interact = Callable(self, "_on_interact")
	

func _on_interact():
	PlayerManager.player.runes_held.increase_runes(runes_amount)
	runes_amount = 0
	queue_free()
