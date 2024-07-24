class_name Chest extends Node2D

@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var interactable_area : InteractableArea = $InteractableArea
@onready var point_light : PointLight2D = $PointLight2D
@onready var chest_loot_item : ChestLootItem = $ChestLootItem
@onready var audio_player : ChestAudioStreamPlayer = $ChestAudioStreamPlayer

@export var chest_data : ChestData

const IDLE_ANIMATION : String = "idle"
const OPEN_ANIMATION : String = "open"
const OPENED_ANIMATION : String = "opened"	


func refresh():
	if not chest_data.is_opened:
		animated_sprite.play(IDLE_ANIMATION)
		point_light.energy = 2
		chest_loot_item.visible = false

	if chest_data.is_opened:
		animated_sprite.play(OPENED_ANIMATION)
		point_light.energy = 0
		chest_loot_item.visible = true
		InteractionManager.unregister_interactable_area(interactable_area)
		interactable_area.is_interactable = false


func _ready():
	if chest_data == null:
		OS.alert("chest data resource has not been set!" + self.get_name())
		pass
	
	chest_data.loot_item.global_position = global_position
	chest_loot_item.set_loot_item(chest_data.loot_item)
	interactable_area.interact = Callable(self, "_on_interact")
	
	refresh()
	chest_loot_item.refresh()
	

func _on_interact():
	if not chest_data.is_opened:
		animated_sprite.play(OPEN_ANIMATION)
		audio_player.play_open_fx_a()
		chest_data.is_opened = true
		point_light.energy = 0
		InteractionManager.unregister_interactable_area(interactable_area)
		interactable_area.is_interactable = false


func _on_animated_sprite_2d_animation_finished():
	chest_loot_item.visible = true
