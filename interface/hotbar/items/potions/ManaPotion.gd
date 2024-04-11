class_name ManaPotionHotbarButton extends TextureButton

@onready var icon : TextureRect = $TextureRect
@onready var progress_bar : TextureProgressBar = $TextureProgressBar
@onready var timer : Timer = $Timer
@onready var time : Label = $Time
@onready var key : Label = $Key
@onready var amount_label = $Amount

@export var mana_potion : ManaPotion


func _ready():
	if mana_potion == null:
		OS.alert("mana potion resource has not been set!")
		pass
	
	icon.texture = mana_potion.texture	
	timer.wait_time = mana_potion.cool_down
	progress_bar.max_value = mana_potion.cool_down
	
	key.text = "Q"
	
	amount_label.text = str(mana_potion.quantity)
	
	shortcut = Shortcut.new()
	var input_key = InputEventKey.new()
	input_key.keycode = "Q".unicode_at(0)
	shortcut.events = [input_key]
	
	HotBarManager.connect("potions_restored", _on_potions_restored)
	HotBarManager.connect("potions_quantity_updated", _on_potions_quantity_updated)
	
	set_process(false)
	

func _on_potions_restored():
	amount_label.text = str(mana_potion.quantity)
	time.text = ""
	disabled = false
	progress_bar.value = 0
	set_process(false)


func _on_potions_quantity_updated():
	amount_label.text = str(mana_potion.quantity)


func _process(delta):
	time.text = "%3.1f" % timer.time_left
	progress_bar.value = timer.time_left


func _on_pressed():
	if mana_potion.quantity > 0:
		timer.start()
		disabled = true
		HotBarManager.drink_mana_potion()
		mana_potion.quantity -= 1
		amount_label.text = str(mana_potion.quantity) 
		set_process(true)


func _on_timer_timeout():
	if mana_potion.quantity > 0:
		disabled = false
	time.text = ""
	set_process(false)
