class_name StatusMenu extends Control

@onready var health_label : Label = $MarginContainer2/VBoxContainer2/HBoxContainer/Health
@onready var stamina_label : Label = $MarginContainer2/VBoxContainer2/HBoxContainer2/Stamina
@onready var mana_label : Label = $MarginContainer2/VBoxContainer2/HBoxContainer3/Mana
@onready var power_label : Label = $MarginContainer2/VBoxContainer2/HBoxContainer4/Power

@onready var level_label : Label  = $MarginContainer/VBoxContainer/HBoxContainer3/Level
@onready var runes_held_label : Label = $MarginContainer/VBoxContainer/HBoxContainer2/RunesHeld
@onready var runes_needed_label : Label = $MarginContainer/VBoxContainer/HBoxContainer/RunesNeeded


func refresh_labels():
	health_label.text = "Health: " + str(StatusManager.health_points)
	stamina_label.text = "Stamina: " + str(StatusManager.stamina_points)
	mana_label.text = "Mana: " + str(StatusManager.mana_points)
	power_label.text = "Power: " + str(StatusManager.power_points)
	level_label.text = "Level: " + str(StatusManager.level)
	runes_held_label.text = "Runes held: " + str(RuneManager.runes_held)
	runes_needed_label.text = "Runes needed: " + str(StatusManager.runes_needed)


func _ready(): 
	visible = false
	refresh_labels()


func _process(delta):
	refresh_labels()


func _on_decrease_health_pressed():
	if StatusManager.health_points > 0:
		StatusManager.decrease_health()
		StatusManager.decrease_needed_runes()
		RuneManager.increase_runes(StatusManager.runes_needed)
		refresh_labels()


func _on_increase_health_pressed():
	if StatusManager.runes_needed <= RuneManager.runes_held:
		RuneManager.decrease_runes(StatusManager.runes_needed)
		StatusManager.increase_needed_runes()
		StatusManager.increase_health()
		refresh_labels()


func _on_decrease_stamina_pressed():
	if StatusManager.stamina_points > 0:
		StatusManager.decrease_stamina()
		StatusManager.decrease_needed_runes()
		RuneManager.increase_runes(StatusManager.runes_needed)
		refresh_labels()


func _on_increase_stamina_pressed():
	if StatusManager.runes_needed <= RuneManager.runes_held:
		RuneManager.decrease_runes(StatusManager.runes_needed)
		StatusManager.increase_needed_runes()
		StatusManager.increase_stamina()
		refresh_labels()


func _on_decrease_mana_pressed():
	if StatusManager.mana_points > 0:
		StatusManager.decrease_mana()
		StatusManager.decrease_needed_runes()
		RuneManager.increase_runes(StatusManager.runes_needed)
		refresh_labels()


func _on_increase_mana_pressed():
	if StatusManager.runes_needed <= RuneManager.runes_held:
		RuneManager.decrease_runes(StatusManager.runes_needed)
		StatusManager.increase_needed_runes()
		StatusManager.increase_mana()
		refresh_labels()


func _on_decrease_power_pressed():
	if StatusManager.power_points > 0:
		StatusManager.decrease_power()
		StatusManager.decrease_needed_runes()
		RuneManager.increase_runes(StatusManager.runes_needed)
		refresh_labels()


func _on_increase_power_pressed():
	if StatusManager.runes_needed <= RuneManager.runes_held:
		RuneManager.decrease_runes(StatusManager.runes_needed)
		StatusManager.increase_needed_runes()
		StatusManager.increase_power()
		refresh_labels()
