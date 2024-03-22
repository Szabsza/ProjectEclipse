class_name ManaPotion extends TextureButton

@onready var progress_bar : TextureProgressBar = $TextureProgressBar
@onready var timer : Timer = $Timer
@onready var time : Label = $Time
@onready var key : Label = $Key
@onready var amount_label = $Amount


func _ready():
	progress_bar.max_value = timer.wait_time
	key.text = "Q"
	
	amount_label.text = str(HotBarManager.mana_potion_quantity)
	
	shortcut = Shortcut.new()
	var input_key = InputEventKey.new()
	input_key.keycode = "Q".unicode_at(0)
	shortcut.events = [input_key]
	
	HotBarManager.connect("potions_restored", _on_potions_restored)
	
	set_process(false)
	

func _on_potions_restored():
	amount_label.text = str(HotBarManager.mana_potion_quantity)
	time.text = ""
	disabled = false
	progress_bar.value = 0
	set_process(false)


func _process(delta):
	time.text = "%3.1f" % timer.time_left
	progress_bar.value = timer.time_left


func _on_pressed():
	if HotBarManager.mana_potion_quantity > 0:
		timer.start()
		disabled = true
		HotBarManager.drink_mana_potion()
		HotBarManager.mana_potion_quantity -= 1
		amount_label.text = str(HotBarManager.mana_potion_quantity) 
		set_process(true)


func _on_timer_timeout():
	if HotBarManager.mana_potion_quantity > 0:
		disabled = false
	time.text = ""
	set_process(false)
