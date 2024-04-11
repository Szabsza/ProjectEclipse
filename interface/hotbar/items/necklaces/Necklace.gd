class_name NecklaceHotbarButton extends TextureButton

@onready var icon : TextureRect = $TextureRect

@export var necklace : Necklace


func set_necklace(necklace : Necklace):
	self.necklace = necklace
	icon.texture = necklace.texture
	visible = true
