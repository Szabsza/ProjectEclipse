class_name Chest extends Node2D

@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var interactable_area : InteractableArea = $InteractableArea
@onready var point_light : PointLight2D = $PointLight2D

@export var drop_items : Array[PackedScene] = []

var is_opened : bool = false

const IDLE_ANIMATION : String = "idle"
const OPEN_ANIMATION : String = "open"
const OPENED_ANIMATION : String = "opened"


func load_as_opened():
	is_opened = true
	point_light.energy = 0
	animated_sprite.play(OPENED_ANIMATION)
	drop_items = []
	InteractionManager.unregister_interactable_area(interactable_area)
	interactable_area.is_interactable = false


func _ready():
	animated_sprite.play(IDLE_ANIMATION)
	interactable_area.interact = Callable(self, "_on_interact")


func _on_interact():
	if not is_opened:
		animated_sprite.play(OPEN_ANIMATION)
		is_opened = true
		point_light.energy = 0
		InteractionManager.unregister_interactable_area(interactable_area)
		interactable_area.is_interactable = false


func _on_animated_sprite_2d_animation_finished():
	for drop_item in drop_items:
			var item = drop_item.instantiate()
			owner.add_child(item)
			item.global_position = global_position
