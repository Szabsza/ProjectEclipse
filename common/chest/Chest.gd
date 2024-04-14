class_name Chest extends Node2D

@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var interactable_area : InteractableArea = $InteractableArea
@onready var point_light : PointLight2D = $PointLight2D
@onready var chest_loot_item : ChestLootItem = $ChestLootItem

@export var loot_item : LootItem

var is_opened : bool = false

const IDLE_ANIMATION : String = "idle"
const OPEN_ANIMATION : String = "open"
const OPENED_ANIMATION : String = "opened"


func load_as_opened():
	is_opened = true
	point_light.energy = 0
	animated_sprite.play(OPENED_ANIMATION)
	loot_item = null
	InteractionManager.unregister_interactable_area(interactable_area)
	interactable_area.is_interactable = false


func _ready():
	if loot_item == null:
		OS.alert("loot item resource has not been set!" + self.get_name())
		pass
	
	animated_sprite.play(IDLE_ANIMATION)
	interactable_area.interact = Callable(self, "_on_interact")
	loot_item.global_position = global_position
	chest_loot_item.set_loot_item(loot_item)
	

func _on_interact():
	if not is_opened:
		animated_sprite.play(OPEN_ANIMATION)
		is_opened = true
		point_light.energy = 0
		InteractionManager.unregister_interactable_area(interactable_area)
		interactable_area.is_interactable = false


func _on_animated_sprite_2d_animation_finished():
	chest_loot_item.visible = true
	
