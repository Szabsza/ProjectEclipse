class_name Remains extends RigidBody2D

@onready var interactable_area : InteractableArea = $InteractableArea

var starting_position : Vector2
var runes_amount : int = 0


func setup(runes_amount: int, position : Vector2):
	self.runes_amount = runes_amount
	global_position = position
	collision_layer = 2


func _ready():
	lock_rotation = true
	starting_position = global_position
	interactable_area.interact = Callable(self, "_on_interact")
	

func _on_interact():
	RuneManager.increase_runes(runes_amount)
	runes_amount = 0
	global_position = starting_position
