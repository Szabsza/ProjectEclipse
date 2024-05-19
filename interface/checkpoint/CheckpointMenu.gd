class_name CheckpointMenu extends Control

signal exited()

@onready var name_label : Label = $MarginContainer/VBoxContainer/Name
@onready var travel_menu : TravelMenu = $TravelMenu
@onready var status_menu : StatusMenu = $StatusMenu

var checkpoint_data : CheckpointData


func setup(checkpoint_data : CheckpointData):
	self.checkpoint_data = checkpoint_data
	name_label.text = checkpoint_data.checkpoint_name
	

func close_all_open_tabs():
	travel_menu.visible = false
	status_menu.visible = false


func _ready():
	visible = false
	travel_menu.setup(self)


func _on_rest_pressed():
	close_all_open_tabs()
	HotBarManager.reset_potions()
	PlayerManager.rest()
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
	
