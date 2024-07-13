extends Node2D

signal interacted()
signal interaction_finished()

@onready var label : Label = $Label 

const BASE_TEXT : String = "[E] to "

var active_areas : Array = []
var is_interactable : bool = true



func _ready():
	label.z_index = 20


func register_interactable_area(area : InteractableArea):
	active_areas.push_back(area)
	

func unregister_interactable_area(area : InteractableArea):
	var index = active_areas.find(area)
	if index != -1:
		active_areas.remove_at(index)
		
		
func _sort_by_distance_to_player(area_a : InteractableArea, area_b : InteractableArea):
	var area_a_to_player = PlayerManager.player.global_position.direction_to(area_a.global_position)
	var area_b_to_player = PlayerManager.player.global_position.direction_to(area_b.global_position)
	
	return area_a_to_player < area_b_to_player
		
		
func _process(delta): 
	if active_areas.size() > 0 && is_interactable:
		active_areas.sort_custom(_sort_by_distance_to_player)
		label.text = BASE_TEXT + active_areas[0].action_name
		label.global_position = active_areas[0].global_position
		label.global_position.y -= 36
		label.global_position.x -= label.size.x / 2
		label.show()
	else:
		label.hide()
		
		
func _input(event : InputEvent):
	if event.is_action_pressed("interact") && is_interactable:
		if active_areas.size() != 0:
			is_interactable = false
			label.hide()
			
			interacted.emit()
			await active_areas[0].interact.call()
			interaction_finished.emit()
			
			is_interactable = true
