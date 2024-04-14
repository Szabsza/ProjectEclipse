class_name StatusMenu extends Control

@onready var health_label : Label = $MarginContainer2/VBoxContainer2/HBoxContainer/Health
@onready var stamina_label : Label = $MarginContainer2/VBoxContainer2/HBoxContainer2/Stamina
@onready var mana_label : Label = $MarginContainer2/VBoxContainer2/HBoxContainer3/Mana
@onready var power_label : Label = $MarginContainer2/VBoxContainer2/HBoxContainer4/Power

@onready var level_label : Label  = $MarginContainer/VBoxContainer/HBoxContainer3/Level
@onready var runes_held_label : Label = $MarginContainer/VBoxContainer/HBoxContainer2/RunesHeld
@onready var runes_needed_label : Label = $MarginContainer/VBoxContainer/HBoxContainer/RunesNeeded

var player : Player = null


func set_interacted_player(player : Player):
	self.player = player
	refresh_labels()


func refresh_labels():
	health_label.text = "Health: " + str(player.status.health)
	stamina_label.text = "Stamina: " + str(player.status.stamina)
	mana_label.text = "Mana: " + str(player.status.mana)
	power_label.text = "Power: " + str(player.status.attack_power)
	level_label.text = "Level: " + str(player.status.level)
	runes_held_label.text = "Runes held: " + str(player.runes_held.amount)
	runes_needed_label.text = "Runes needed: " + str(player.status.runes_needed)	


func _ready(): 
	visible = false


func _on_decrease_health_pressed():
	StatusManager.decrease_health(player)
	refresh_labels()


func _on_increase_health_pressed():
	StatusManager.increase_health(player)
	refresh_labels()


func _on_decrease_stamina_pressed():
	StatusManager.decrease_stamina(player)
	refresh_labels()


func _on_increase_stamina_pressed():
	StatusManager.increase_stamina(player)
	refresh_labels()


func _on_decrease_mana_pressed():
	StatusManager.decrease_mana(player)
	refresh_labels()


func _on_increase_mana_pressed():
	StatusManager.increase_mana(player)
	refresh_labels()


func _on_decrease_power_pressed():
	StatusManager.increase_attack_power(player)
	refresh_labels()


func _on_increase_power_pressed():
	StatusManager.increase_attack_power(player)
	refresh_labels()
