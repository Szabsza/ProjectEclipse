class_name Hotbar extends Control

@onready var health_potion_button : HealthPotionHotbarButton = $HBoxContainer/HealthPotion
@onready var mana_potion_button : ManaPotionHotbarButton = $HBoxContainer/ManaPotion
@onready var bracelet_placeholder : TextureButton = $HBoxContainer/BraceletPlaceholder
@onready var necklace_placeholder : TextureButton = $HBoxContainer/NecklacePlaceholder
@onready var wings_placeholder : TextureButton = $HBoxContainer/WingsPlaceholder
@onready var necklace_hotbar_button : NecklaceHotbarButton = $HBoxContainer/Necklace
@onready var bracelet_hotbar_button : BraceletHotbarButton = $HBoxContainer/Bracelet
@onready var wings_hotbar_button : WingsHotbarButton = $HBoxContainer/Wings


func refresh():
	if HotBarManager.bracelet != null:
		bracelet_placeholder.visible = false
		bracelet_hotbar_button.set_bracelet(HotBarManager.bracelet)
	
	if HotBarManager.necklace != null:
		necklace_placeholder.visible = false
		necklace_hotbar_button.set_necklace(HotBarManager.necklace)
		
	if HotBarManager.wings != null:
		wings_placeholder.visible = false
		wings_hotbar_button.set_wings(HotBarManager.wings)
	

func _ready():
	init_hotbar()
	
	HotBarManager.set_health_potion(health_potion_button.health_potion)
	HotBarManager.set_mana_potion(mana_potion_button.mana_potion)
	
	HotBarManager.connect("bracelet_slot_changed", _on_bracelet_slot_changed)
	HotBarManager.connect("necklace_slot_changed", _on_necklace_slot_changed)
	HotBarManager.connect("wings_slot_changed", _on_wings_slot_changed)
	
	refresh()
	

func init_hotbar():
	bracelet_placeholder.visible = true
	necklace_placeholder.visible = true
	wings_placeholder.visible = true
	bracelet_hotbar_button.visible = false
	necklace_hotbar_button.visible = false
	wings_hotbar_button.visible = false
		

func _on_bracelet_slot_changed(bracelet : Bracelet):
	bracelet_placeholder.visible = false
	bracelet_hotbar_button.set_bracelet(bracelet)
	

func _on_necklace_slot_changed(necklace : Necklace):
	necklace_placeholder.visible = false
	necklace_hotbar_button.set_necklace(necklace)
	
	
func _on_wings_slot_changed(wings : Wings):
	wings_placeholder.visible = false
	wings_hotbar_button.set_wings(wings)
