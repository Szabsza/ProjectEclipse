extends AudioStreamPlayer

const MAIN_MENU_THEME = preload("res://Assets/Sound/rains_of_castamere.mp3")
const INGAME_STANDARD_THEME = preload("res://Assets/Sound/desert_caravan.mp3")


func _play_music(music : AudioStream, volume : float = 0.0):
	if stream == music:
		return
		
	stream = music
	volume_db = volume
	play()
	

func play_main_menu_theme():
	_play_music(MAIN_MENU_THEME)
	

# TODO: SFX AND SOUND VOLUME TO OPTIONS
func play_ingame_standard_theme():
	_play_music(INGAME_STANDARD_THEME, -15.0)
