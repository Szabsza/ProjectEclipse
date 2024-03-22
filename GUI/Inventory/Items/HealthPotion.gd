class_name HealthPotion extends TextureButton

@onready var progress_bar : TextureProgressBar = $TextureProgressBar
@onready var timer : Timer = $Timer
@onready var time : Label = $Time
@onready var key : Label = $Key
@onready var amount_label = $Amount


func _ready():
	progress_bar.max_value = timer.wait_time
	key.text = "R"
	
	amount_label.text = str(HotBarManager.health_potion_quantity)
	
	shortcut = Shortcut.new()
	var input_key = InputEventKey.new()
	input_key.keycode = "R".unicode_at(0)
	shortcut.events = [input_key]
	
	HotBarManager.connect("potions_restored", _on_potions_restored)
	
	set_process(false)


func _on_potions_restored():
	amount_label.text = str(HotBarManager.health_potion_quantity)
	time.text = ""
	progress_bar.value = 0
	disabled = false
	set_process(false)

	
func _process(delta):
	time.text = "%3.1f" % timer.time_left
	progress_bar.value = timer.time_left
	

func _on_pressed():
	if HotBarManager.health_potion_quantity > 0:
		timer.start()
		disabled = true
		HotBarManager.drink_health_potion()
		HotBarManager.health_potion_quantity -= 1
		set_process(true)
	amount_label.text = str(HotBarManager.health_potion_quantity) 


func _on_timer_timeout():
	if HotBarManager.health_potion_quantity > 0:
		disabled = false
	time.text = ""
	set_process(false)
