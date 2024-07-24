class_name Torch extends Node2D

@onready var audio_player : TorchAudioStreamPlayer = $TorchAudioStreamPlayer


func _ready():
	audio_player.play_flame_fx()
