class_name Door extends Node2D

@onready var spawn : Marker2D = $Spawn
@onready var interactable_area : InteractableArea = $InteractableArea
@onready var label : Label = $Label
@onready var timer : Timer = $Timer

@export var destination_door : Door
@export var requires_key : bool

var level_name : String = ""
var door_name : String = ""

func _ready():
	level_name = get_parent().get_name()
	door_name = get_name()
	interactable_area.interact = Callable(self, "_on_interact")
	label.visible = false
	

func _on_interact():
	if requires_key:
		if HotBarManager.key_quantity > 0:
			HotBarManager.key_quantity -= 1
			requires_key = false
			TravelManager.go_trough_door(self)
		else:
			timer.start()
			label.visible = true
	else:
		TravelManager.go_trough_door(self)


func _on_timer_timeout():
	label.visible = false
