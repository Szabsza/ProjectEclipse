class_name RuinsLevel extends Level

@onready var waypoints : Node2D = $Waypoints
@onready var enemies : Node2D = $Enemies

var _waypoints : Array = []


func set_waypoints_for_enemies():
	for child in waypoints.get_children():
		_waypoints.append(child)
	
	for child in enemies.get_children():
		child.setup(_waypoints)


func _ready() -> void:
	AudioManager.play_ingame_standard_theme()
	set_waypoints_for_enemies()
	load_level()
