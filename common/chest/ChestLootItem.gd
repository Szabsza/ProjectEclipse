class_name ChestLootItem extends Sprite2D

@onready var interactable_area : InteractableArea = $InteractableArea 

var loot_item : LootItem = null 


func set_loot_item(loot_item : LootItem):
	self.loot_item = loot_item
	texture = loot_item.texture


func _ready():
	visible = false
	interactable_area.interact = Callable(self, "_on_interact")


func _on_interact():
	loot_item.on_pickup()
	visible = false
	InteractionManager.unregister_interactable_area(interactable_area)
	interactable_area.is_interactable = false
