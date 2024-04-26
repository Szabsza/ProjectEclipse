class_name GhostMerchant extends CharacterBody2D

@onready var state_machine : CharacterStateMachine = $CharacterStateMachine
@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var player_detection_area : Area2D = $Sprite2D/PlayerDetectionArea
@onready var interactable_area : InteractableArea = $InteractableArea
@onready var shop : Shop = $Shop

@export var shop_items : Array[ShopItem]
#@export var merchant_data : MerchantData


func _ready():
	collision_layer = 8
	collision_mask = 1
	shop.visible = false
	animation_tree.active = true
	state_machine.setup(self)
	state_machine.switch_state(state_machine.states["Hiding"])
	interactable_area.interact = Callable(self, "_on_interact")
	shop.setup(get_name(), shop_items)


func _on_interact():
	shop.visible = true
	await shop.exited
