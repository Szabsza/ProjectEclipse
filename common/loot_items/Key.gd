class_name Key extends Sprite2D

@onready var interactable_area : InteractableArea = $InteractableArea 

var amount : int = 1

func _ready():
	interactable_area.interact = Callable(self, "_on_interact")


func _on_interact():
	HotBarManager.increase_keys(amount)
	queue_free()
