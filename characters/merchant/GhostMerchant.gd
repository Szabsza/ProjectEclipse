class_name GhostMerchant extends CharacterBody2D

@onready var state_machine : MerchantStateMachine = $MerchantStateMachine
@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var player_detection_area : PlayerDetectionArea = $Sprite2D/PlayerDetectionArea
@onready var interactable_area : InteractableArea = $InteractableArea
@onready var shop : Shop = $Shop
@onready var audio_player : MerchantAudioStreamPlayer = $MerchantAudioStreamPlayer

@export var merchant_data : MerchantData


func _ready():
	collision_layer = 8
	collision_mask = 1

	shop.visible = false
	state_machine.setup(self)

	interactable_area.interact = Callable(self, "_on_interact")
	shop.setup(merchant_data.merchant_name, merchant_data.shop_items)


func _on_interact():
	shop.visible = true
	await shop.exited
