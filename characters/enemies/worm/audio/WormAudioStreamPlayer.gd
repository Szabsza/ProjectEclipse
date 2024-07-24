class_name WormAudioStreamPlayer extends AudioStreamPlayer2D

const FX_DAMAGE_A = preload("res://Assets/Sound/FX/damage1.wav")
const FX_DAMAGE_B = preload("res://Assets/Sound/FX/damage2.wav")
const FX_DAMAGE_C = preload("res://Assets/Sound/FX/damage3.wav")
const FX_WALK = preload("res://Assets/Sound/FX/worm_walk.wav")


func _play_fx(fx : AudioStream, volume : float = 0.0):	
	stream = fx
	volume_db = volume
	play()
	
	
func clear():
	_play_fx(null)
	

func play_get_hit_fx():
	var rng = randi() % 3
	
	if rng == 0:
		_play_fx(FX_DAMAGE_A)
	elif rng == 1: 
		_play_fx(FX_DAMAGE_B)
	elif rng ==2:
		_play_fx(FX_DAMAGE_C)
	

func play_walk_fx():
	_play_fx(FX_WALK)
	
