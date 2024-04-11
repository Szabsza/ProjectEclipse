class_name CheckpointMenu extends Control

@onready var name_label : Label = $MarginContainer/VBoxContainer/Name
@onready var travel_menu : Control = $TravelMenu
@onready var status_menu : Control = $StatusMenu

var checkpoint_name : String = ""

signal exited()


func setup(checkpoint_name : String):
	self.checkpoint_name = checkpoint_name
	name_label.text = checkpoint_name


func close_all_open_tabs():
	travel_menu.visible = false
	status_menu.visible = false


func _ready():
	visible = false
	travel_menu.setup(self)


func _on_rest_pressed():
	close_all_open_tabs()
	HotBarManager.reset_potions()
	#SaveManager.save_game()


func _on_level_pressed():
	close_all_open_tabs()
	status_menu.visible = not status_menu.visible


func _on_travel_pressed():
	close_all_open_tabs()
	travel_menu.visible = not travel_menu.visible
	travel_menu.refresh_traveling_options()


func _on_exit_pressed():
	visible = false
	close_all_open_tabs()
	exited.emit()
