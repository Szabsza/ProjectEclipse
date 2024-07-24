class_name CheckpointAudioStreamPlayer extends AudioStreamPlayer2D

const FX_ACTIVATE = preload("res://Assets/Sound/FX/electric_shock.mp3")
const FX_ACTIVE = preload("res://Assets/Sound/FX/electric_sparks.mp3")



func _play_fx(fx : AudioStream, volume : float = 0.0):	
	stream = fx
	volume_db = volume
	play()
	
	
func clear():
	_play_fx(null)
	

func play_activate_fx():
	_play_fx(FX_ACTIVATE)
	
	
func play_active_fx():
	_play_fx(FX_ACTIVE)
