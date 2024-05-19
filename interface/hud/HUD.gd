class_name Hud extends CanvasLayer

@onready var health_bar : TextureProgressBar = $HealthBar
@onready var health_points : Label = $HealthPoints
@onready var stamina_bar : TextureProgressBar = $StaminaBar
@onready var stamina_points : Label = $StaminaPoints
@onready var mana_bar : TextureProgressBar = $ManaBar
@onready var mana_points : Label = $ManaPoints
@onready var runes_held_label : Label = $RunesHeldLabel
@onready var keys_held_label : Label = $Keys/KeysHeldLabel



func update_stamina_bar():
	stamina_points.text = str(PlayerManager.player.stamina.current_stamina) + "/" + str(PlayerManager.player.stamina.max_stamina)
	stamina_bar.max_value = PlayerManager.player.stamina.max_stamina
	stamina_bar.value = PlayerManager.player.stamina.current_stamina


func update_health_bar():
	health_points.text = str(PlayerManager.player.health.current_health) + "/" + str(PlayerManager.player.health.max_health)
	health_bar.max_value = PlayerManager.player.health.max_health
	health_bar.value = PlayerManager.player.health.current_health


func update_mana_bar():
	mana_points.text = str(PlayerManager.player.mana.current_mana) + "/" + str(PlayerManager.player.mana.max_mana)
	mana_bar.max_value = PlayerManager.player.mana.max_mana
	mana_bar.value = PlayerManager.player.mana.current_mana


func update_runes_held():
	runes_held_label.text = str(PlayerManager.player.runes_held.amount)	


func update_keys_held():
	keys_held_label.text = str(HotBarManager.key_quantity)


func _process(delta):
	if PlayerManager.player != null:
		update_health_bar()
		update_mana_bar()
		update_stamina_bar()
		update_runes_held()
		update_keys_held()
