class_name TorchAudioStreamPlayer extends AudioStreamPlayer2D

const FX_FLAME = preload("res://Assets/Sound/FX/torch.mp3")


func _play_fx(fx : AudioStream, volume : float = 0.0):	
	stream = fx
	volume_db = volume
	play()
	
	
func clear():
	_play_fx(null)
	

func play_flame_fx():
	_play_fx(FX_FLAME)
	
