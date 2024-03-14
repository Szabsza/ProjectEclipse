class_name Checkpoint extends Node2D

@onready var interactable_area : InteractableArea = $InteractableArea
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var checkpoint_menu : CheckpointMenu = $CheckpointMenu

const ACTIVE_ANIMATION : String = "active"
const ACTIVATED_ANIMATION : String = "activated"

var is_activated : bool = false
var playback : AnimationNodeStateMachinePlayback


func _ready():
	playback = animation_tree["parameters/playback"]
	interactable_area.interact = Callable(self, "_on_interact")
	checkpoint_menu.setup(get_name())


func _on_interact():
	if not is_activated:
		playback.travel(ACTIVATED_ANIMATION)
	else:
		checkpoint_menu.visible = true
		await checkpoint_menu.exited
		

func _on_animation_tree_animation_finished(anim_name):
	if anim_name == ACTIVATED_ANIMATION:
		playback.travel(ACTIVE_ANIMATION)
		is_activated = true
