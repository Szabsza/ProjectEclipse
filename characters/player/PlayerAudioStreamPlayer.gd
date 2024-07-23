class_name PlayerAudioStreamPlayer extends AudioStreamPlayer2D

const FX_SWORD_A = preload("res://Assets/Sound/FX/swing-whoosh-5-198498.mp3")
const FX_SWORD_B = preload("res://Assets/Sound/FX/swing-whoosh-weapon-1-189819.mp3")
const FX_JUMP = preload("res://Assets/Sound/FX/swing-whoosh-9-198502.mp3")
const FX_LAND = preload("res://Assets/Sound/FX/landing.mp3")
const FX_WALK = preload("res://Assets/Sound/FX/walking.mp3")


func _play_fx(fx : AudioStream, volume : float = 0.0):	
	stream = fx
	volume_db = volume
	play()
	
	
func clear():
	_play_fx(null)
	

func play_sword_fx_a():
	_play_fx(FX_SWORD_A)
	

func play_sword_fx_b():
	_play_fx(FX_SWORD_B)


func play_jump_fx():
	_play_fx(FX_JUMP)


func play_land_fx():
	_play_fx(FX_LAND)


func play_walk_fx():
	_play_fx(FX_WALK)
