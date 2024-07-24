class_name DoorAudioStreamPlayer extends AudioStreamPlayer2D

const FX_OPEN = preload("res://Assets/Sound/FX/door1.mp3")


func _play_fx(fx : AudioStream, volume : float = 0.0):	
	stream = fx
	volume_db = volume
	play()
	
	
func clear():
	_play_fx(null)
	

func play_open_fx_a():
	_play_fx(FX_OPEN)
	
