class_name GolemAudioStreamPlayer extends AudioStreamPlayer2D

const FX_HIT = preload('res://Assets/Sound/FX/golem_hit.mp3')
const FX_LASER = preload('res://Assets/Sound/FX/golem_laser2.mp3')
const FX_SHOOT = preload('res://Assets/Sound/FX/golem_shoot.wav')


func _play_fx(fx : AudioStream, volume : float = 0.0):	
	stream = fx
	volume_db = volume
	play()
	
	
func clear():
	_play_fx(null)
	
	
func play_get_hit_fx():
	_play_fx(FX_HIT)
	

func play_laser_fx():
	_play_fx(FX_LASER)
	

func play_shoot_fx():
	_play_fx(FX_SHOOT)
	
