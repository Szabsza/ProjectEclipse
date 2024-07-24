class_name FireBreatherAudioStreamPlayer extends AudioStreamPlayer2D

const FX_LAUNCH_A = preload("res://Assets/Sound/FX/fireball1.wav")
const FX_LAUNCH_B = preload("res://Assets/Sound/FX/fireball2.wav")
const FX_LAUNCH_C = preload("res://Assets/Sound/FX/fireball3.wav")
const FX_IMPACT_A = preload("res://Assets/Sound/FX/fireball_impact1.wav")
const FX_IMPACT_B = preload("res://Assets/Sound/FX/fireball_impact2.wav")
const FX_IMPACT_C = preload("res://Assets/Sound/FX/fireball_impact3.wav")


func _play_fx(fx : AudioStream, volume : float = 0.0):	
	stream = fx
	volume_db = volume
	play()
	
	
func clear():
	_play_fx(null)
	

func play_launch_fx():
	var rng = randi() % 3
	
	if rng == 0:
		_play_fx(FX_LAUNCH_A)
	elif rng == 1: 
		_play_fx(FX_LAUNCH_B)
	elif rng == 2:
		_play_fx(FX_LAUNCH_C)
	

func play_impact_fx():
	var rng = randi() % 3
	
	if rng == 0:
		_play_fx(FX_IMPACT_A)
	elif rng == 1: 
		_play_fx(FX_IMPACT_B)
	elif rng == 2:
		_play_fx(FX_IMPACT_C)
