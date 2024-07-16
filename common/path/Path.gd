class_name Path extends Node2D

var waypoints : Array

func _ready() -> void:
	for child in get_children():
		if child is Waypoint:
			waypoints.append(child)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
