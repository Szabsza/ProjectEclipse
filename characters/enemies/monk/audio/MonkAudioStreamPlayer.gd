class_name MonkAudioStreamPlayer extends AudioStreamPlayer2D

const FX_DAMAGE_A = preload("res://Assets/Sound/FX/damage1.wav")
const FX_DAMAGE_B = preload("res://Assets/Sound/FX/damage2.wav")
const FX_DAMAGE_C = preload("res://Assets/Sound/FX/damage3.wav")
const FX_FIST_ATTACK = preload("res://Assets/Sound/FX/fist_attack.mp3")
const FX_SPECIAL_ATTACK_A = preload("res://Assets/Sound/FX/monk_special_attack1.wav")
const FX_SPECIAL_ATTACK_B = preload("res://Assets/Sound/FX/monk_special_attack2.wav")
const FX_WALK = preload("res://Assets/Sound/FX/walking.mp3")


func _play_fx(fx : AudioStream, volume : float = 0.0):	
	stream = fx
	volume_db = volume
	play()
	
	
func clear():
	_play_fx(null)


func play_walk_fx():
	_play_fx(FX_WALK)
	

func play_get_hit_fx():
	var rng = randi() % 3
	
	if rng == 0:
		_play_fx(FX_DAMAGE_A)
	elif rng == 1: 
		_play_fx(FX_DAMAGE_B)
	elif rng ==2:
		_play_fx(FX_DAMAGE_C)
	

func play_fist_fx():
	_play_fx(FX_FIST_ATTACK)
	

func play_special_attack_fx():
	var rng = randi() % 2
	
	if rng == 0:
		_play_fx(FX_SPECIAL_ATTACK_A)
	else:
		_play_fx(FX_SPECIAL_ATTACK_B)
