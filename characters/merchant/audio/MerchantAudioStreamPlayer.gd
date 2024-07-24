class_name MerchantAudioStreamPlayer extends AudioStreamPlayer2D

const FX_GHOST_APPEAR = preload("res://Assets/Sound/FX/appear.mp3")


func _play_fx(fx : AudioStream, volume : float = 0.0):	
	stream = fx
	volume_db = volume
	play()
	
	
func clear():
	_play_fx(null)
	

func play_appear_fx():
	_play_fx(FX_GHOST_APPEAR)
