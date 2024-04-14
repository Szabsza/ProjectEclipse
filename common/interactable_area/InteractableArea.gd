class_name InteractableArea extends Area2D

@export var action_name : String = ""

var is_interactable : bool = true

func _ready():
	collision_mask = 4
	collision_layer = 0
	connect("body_entered", self._on_body_entered)
	connect("body_exited", self._on_body_exited)
	

var interact : Callable = func():
	pass	


func _on_body_entered(body : Node2D):
	if body is Player and is_interactable:
		InteractionManager.register_interactable_area(self)
	
	
func _on_body_exited(body : Node2D):
	if body is Player:
		InteractionManager.unregister_interactable_area(self)
