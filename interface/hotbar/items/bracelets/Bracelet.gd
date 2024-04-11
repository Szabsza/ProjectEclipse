class_name BraceletHotbarButton extends TextureButton

@onready var icon : TextureRect = $TextureRect

@export var bracelet : Bracelet


func set_bracelet(bracelet : Bracelet):
	self.bracelet = bracelet
	icon.texture = bracelet.texture
	visible = true
