class_name Checkpoint extends Node2D

@onready var interactable_area : InteractableArea = $InteractableArea
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var checkpoint_menu : CheckpointMenu = $CheckpointMenu

@export var checkpoint_data : CheckpointData

const ACTIVE_ANIMATION : String = "active"
const ACTIVATED_ANIMATION : String = "activated"

var playback : AnimationNodeStateMachinePlayback


func load_as_activated():
	playback.travel(ACTIVE_ANIMATION)
	checkpoint_data.is_activated = true


func _ready():
	if checkpoint_data == null:
		OS.alert("checkpoint resource has not been set!")
		return
	
	checkpoint_data.global_position = global_position
	
	playback = animation_tree["parameters/playback"]
	interactable_area.interact = Callable(self, "_on_interact")
	
	checkpoint_menu.setup(checkpoint_data.checkpoint_name)


func _on_interact():
	if not checkpoint_data.is_activated:
		checkpoint_data.is_activated = true
		playback.travel(ACTIVATED_ANIMATION)
	else:
		checkpoint_menu.visible = true
		await checkpoint_menu.exited
		

func _on_animation_tree_animation_finished(anim_name):
	if anim_name == ACTIVATED_ANIMATION:
		playback.travel(ACTIVE_ANIMATION)
		checkpoint_data.is_activated = true
