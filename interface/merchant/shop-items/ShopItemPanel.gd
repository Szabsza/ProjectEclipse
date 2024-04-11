class_name ShopItemPanel extends Panel

@onready var icon : TextureRect = $VBoxContainer/Icon
@onready var name_label : Label = $VBoxContainer/Name
@onready var description_label : Label = $VBoxContainer/Description
@onready var cost_label : Label = $VBoxContainer/HBoxContainer/CostLabel

@export var item : ShopItem


func set_item(item : ShopItem):
	self.item = item
	icon.texture = item.texture
	name_label.text = item.item_name
	description_label.text = item.description
	cost_label.text = str(item.cost)
