class_name ChestLootItem extends Sprite2D

@onready var interactable_area : InteractableArea = $InteractableArea 

var loot_item : LootItem = null 


func refresh():
	texture = loot_item.texture
	if loot_item.picked_up:
		set_picked_up()
	

func set_picked_up():
	visible = false
	InteractionManager.unregister_interactable_area(interactable_area)
	interactable_area.is_interactable = false


func set_loot_item(loot_item : LootItem):
	self.loot_item = loot_item


func _ready():
	visible = false
	interactable_area.interact = Callable(self, "_on_interact")


func _on_interact():
	loot_item.on_pickup()
	set_picked_up()
