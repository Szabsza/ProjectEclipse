class_name Door extends Node2D

@onready var spawn : Marker2D = $Spawn
@onready var interactable_area : InteractableArea = $InteractableArea
@onready var label : Label = $Label
@onready var timer : Timer = $Timer
@onready var audio_player : DoorAudioStreamPlayer = $DoorAudioStreamPlayer

@export var door_data : DoorData
@export var destination_door_data : DoorData


func _ready():
	door_data.global_position = global_position
	interactable_area.interact = Callable(self, "_on_interact")
	label.visible = false
	

func _on_interact():
	if not door_data.is_unlocked:
		if HotBarManager.key_quantity > 0:
			HotBarManager.key_quantity -= 1
			door_data.is_unlocked = true
			destination_door_data.is_unlocked = true
			audio_player.play_open_fx_a()
			await audio_player.finished
			TravelManager.go_trough_door(destination_door_data)
		else:
			timer.start()
			label.visible = true
	else:
		audio_player.play_open_fx_a()
		await audio_player.finished
		TravelManager.go_trough_door(destination_door_data)


func _on_timer_timeout():
	label.visible = false
