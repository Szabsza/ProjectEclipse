class_name CheckpointMenu extends Control

@onready var name_label : Label = $MarginContainer/VBoxContainer/Name
@onready var travel_menu : Control = $TravelMenu

var checkpoint_name : String = ""

signal exited()


func setup(checkpoint_name : String):
	self.checkpoint_name = checkpoint_name
	name_label.text = checkpoint_name
	

func _ready():
	visible = false
	travel_menu.setup(self)


func _on_rest_pressed():
	pass


func _on_level_pressed():
	pass


func _on_travel_pressed():
	if not travel_menu.visible:
		travel_menu.refresh_traveling_options()
	travel_menu.visible = not travel_menu.visible


func _on_exit_pressed():
	visible = false
	travel_menu.visible = false
	exited.emit()
	pass
