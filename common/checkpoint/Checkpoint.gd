class_name Checkpoint extends Node2D

@onready var interactable_area : InteractableArea = $InteractableArea
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var checkpoint_menu : CheckpointMenu = $CheckpointMenu
@onready var audio_player : CheckpointAudioStreamPlayer = $CheckpointAudioStreamPlayer

@export var checkpoint_data : CheckpointData

const ACTIVE_ANIMATION : String = "active"
const ACTIVATED_ANIMATION : String = "activated"

var playback : AnimationNodeStateMachinePlayback


func refresh():
	if checkpoint_data.is_activated:
		playback.travel(ACTIVE_ANIMATION)


func _ready():
	if checkpoint_data == null:
		OS.alert("checkpoint resource has not been set!")
		return
	
	checkpoint_data.global_position = global_position
	
	playback = animation_tree["parameters/playback"]
	interactable_area.interact = Callable(self, "_on_interact")
	
	checkpoint_menu.setup(checkpoint_data)
	
	refresh()


func _on_interact():
	PlayerManager.set_last_interacted_checkpoint(checkpoint_data)
	
	if not checkpoint_data.is_activated:
		TravelManager.add_to_available_checkpoints(checkpoint_data)
		checkpoint_data.is_activated = true
		playback.travel(ACTIVATED_ANIMATION)
		audio_player.play_activate_fx()
		await audio_player.finished
		audio_player.play_active_fx()
	else:
		checkpoint_menu.visible = true
		await checkpoint_menu.exited
		

func _on_animation_tree_animation_finished(anim_name):
	if anim_name == ACTIVATED_ANIMATION:
		playback.travel(ACTIVE_ANIMATION)
		checkpoint_data.is_activated = true
