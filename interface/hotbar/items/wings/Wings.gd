class_name WingsHotbarButton extends TextureButton

@onready var icon : TextureRect = $TextureRect

@export var wings : Wings


func set_wings(wings : Wings):
	self.wings = wings
	icon.texture = wings.texture
	visible = true
