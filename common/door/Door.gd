class_name Door extends Node2D

@onready var spawn : Marker2D = $Spawn
@onready var interactable_area : InteractableArea = $InteractableArea
@onready var label : Label = $Label
@onready var timer : Timer = $Timer

@export var door_data : DoorData
@export var destination_door_data : DoorData


func _ready():
	interactable_area.interact = Callable(self, "_on_interact")
	label.visible = false
	

func _on_interact():
	if not door_data.is_unlocked:
		if HotBarManager.key_quantity > 0:
			HotBarManager.key_quantity -= 1
			door_data.is_unlocked = true
			destination_door_data.is_unlocked = true
			TravelManager.go_trough_door(destination_door_data)
		else:
			timer.start()
			label.visible = true
	else:
		TravelManager.go_trough_door(destination_door_data)


func _on_timer_timeout():
	label.visible = false
