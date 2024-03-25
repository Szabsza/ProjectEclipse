class_name TravelMenu extends Control

@onready var container : VBoxContainer = $MarginContainer/ScrollContainer/VBoxContainer

var available_checkpoints : Array = []
var checkpoint_menu : CheckpointMenu = null

func setup(checkpoint_menu : CheckpointMenu):
	self.checkpoint_menu = checkpoint_menu


func refresh_traveling_options():
	for child in container.get_children():
		if child is Button:
			child.queue_free()

	for checkpoint in TravelManager.get_available_checkpoints():
		var button : Button = Button.new()
		button.text = checkpoint.name
		button.pressed.connect(self._checkpoint_button_pressed.bind(checkpoint))
		container.add_child(button)


func _ready():
	visible = false


func _checkpoint_button_pressed(checkpoint : Checkpoint):
	checkpoint_menu.visible = false
	visible = false
	checkpoint_menu.exited.emit()
	TravelManager.travel_to_checkpoint(checkpoint)
