class_name CheckpointMenu extends Control

@onready var name_label : Label = $MarginContainer/VBoxContainer/Name

var checkpoint_name : String = ""

signal exited()


func setup(checkpoint_name : String):
	self.checkpoint_name = checkpoint_name
	name_label.text = checkpoint_name
	

func _ready():
	visible = false


func _on_rest_pressed():
	pass


func _on_level_pressed():
	pass


func _on_storage_pressed():
	pass


func _on_exit_pressed():
	visible = false
	exited.emit()
	pass
