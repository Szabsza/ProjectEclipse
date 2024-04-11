class_name HealthPotionHotbarButton extends TextureButton

@onready var icon : TextureRect = $TextureRect
@onready var progress_bar : TextureProgressBar = $TextureProgressBar
@onready var timer : Timer = $Timer
@onready var time : Label = $Time
@onready var key : Label = $Key
@onready var amount_label = $Amount

@export var health_potion : HealthPotion


func _ready():
	if health_potion == null:
		OS.alert("health potion resource has not been set!")
		pass
	
	icon.texture = health_potion.texture	
	timer.wait_time = health_potion.cool_down
	progress_bar.max_value = health_potion.cool_down
	key.text = "R"
	
	amount_label.text = str(health_potion.quantity)
	
	shortcut = Shortcut.new()
	var input_key = InputEventKey.new()
	input_key.keycode = "R".unicode_at(0)
	shortcut.events = [input_key]
	
	HotBarManager.connect("potions_restored", _on_potions_restored)
	HotBarManager.connect("potions_quantity_updated", _on_potions_quantity_updated)
	
	set_process(false)


func _on_potions_restored():
	amount_label.text = str(health_potion.quantity)
	time.text = ""
	progress_bar.value = 0
	disabled = false
	set_process(false)


func _on_potions_quantity_updated():
	amount_label.text = str(health_potion.quantity)

	
func _process(delta):
	time.text = "%3.1f" % timer.time_left
	progress_bar.value = timer.time_left
	

func _on_pressed():
	if health_potion.quantity > 0:
		timer.start()
		disabled = true
		HotBarManager.drink_health_potion()
		health_potion.quantity -= 1
		set_process(true)
	amount_label.text = str(health_potion.quantity) 


func _on_timer_timeout():
	if health_potion.quantity > 0:
		disabled = false
	time.text = ""
	set_process(false)
