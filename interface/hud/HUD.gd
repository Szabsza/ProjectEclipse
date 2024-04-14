class_name Hud extends CanvasLayer

@onready var health_bar : TextureProgressBar = $HealthBar
@onready var health_points : Label = $HealthPoints
@onready var stamina_bar : TextureProgressBar = $StaminaBar
@onready var stamina_points : Label = $StaminaPoints
@onready var mana_bar : TextureProgressBar = $ManaBar
@onready var mana_points : Label = $ManaPoints
@onready var runes_held_label : Label = $RunesHeldLabel
@onready var keys_held_label : Label = $Keys/KeysHeldLabel
@onready var player : Player = get_tree().get_first_node_in_group("player")


func update_stamina_bar():
	stamina_points.text = str(player.stamina.current_stamina) + "/" + str(player.stamina.max_stamina)
	stamina_bar.max_value = player.stamina.max_stamina
	stamina_bar.value = player.stamina.current_stamina


func update_health_bar():
	health_points.text = str(player.health.current_health) + "/" + str(player.health.max_health)
	health_bar.max_value = player.health.max_health
	health_bar.value = player.health.current_health


func update_mana_bar():
	mana_points.text = str(player.mana.current_mana) + "/" + str(player.mana.max_mana)
	mana_bar.max_value = player.mana.max_mana
	mana_bar.value = player.mana.current_mana


func update_runes_held():
	runes_held_label.text = str(player.runes_held.amount)	


func update_keys_held():
	keys_held_label.text = str(HotBarManager.key_quantity)


func _process(delta):
	update_health_bar()
	update_mana_bar()
	update_stamina_bar()
	update_runes_held()
	update_keys_held()
