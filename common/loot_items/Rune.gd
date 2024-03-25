class_name Rune extends Sprite2D

@onready var interactable_area : InteractableArea = $InteractableArea 

var amount : int = 500

func _ready(): 
	interactable_area.interact = Callable(self, "_on_interact")


func _on_interact():
	RuneManager.increase_runes(amount)
	queue_free()
