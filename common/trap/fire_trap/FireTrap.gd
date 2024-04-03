class_name FireTrap extends RigidBody2D

@onready var player_detection_area : PlayerDetectionArea = $PlayerDetectionArea
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine : TrapStateMachine = $TrapStateMachine
@onready var hitbox : HitBox = $Sprite2D/HitBox

var attack_damage : int = 50


func _ready():
	collision_layer = 2
	collision_mask = 1
	lock_rotation = true
	state_machine.setup(self, animation_tree)
	hitbox.setup(attack_damage, 2, 0)
