class_name PlayerHud extends CanvasLayer

@onready var health_bar : TextureProgressBar = $Health/HealthBar
@onready var health_points : Label = $Health/HealthPoints
@onready var stamina_bar : TextureProgressBar = $Stamina/StaminaBar
@onready var stamina_points : Label = $Stamina/StaminaPoints
@onready var mana_bar : TextureProgressBar = $Mana/ManaBar
@onready var mana_points : Label = $Mana/ManaPoints
@onready var runes_held_label : Label = $Runes/RunesHeldLabel
@onready var keys_held_label : Label = $Keys/KeysHeldLabel
@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var death_toast : Control = $DiedToast

const DEATH_TOAST_ANIMATION : String = "show_death_toast"

var player : Player
var player_info : PlayerData


func show_death_toast():
	animation_player.play(DEATH_TOAST_ANIMATION)
	await animation_player.animation_finished


func setup(_player : Player):
	player = _player
	player_info = _player.player_data


func update_stamina_bar():
	stamina_points.text = str(player_info.stamina.current_stamina) + "/" + str(player_info.stamina.max_stamina)
	stamina_bar.max_value = player_info.stamina.max_stamina
	stamina_bar.value = player_info.stamina.current_stamina


func update_health_bar():
	health_points.text = str(player_info.health.current_health) + "/" + str(player_info.health.max_health)
	health_bar.max_value = player_info.health.max_health
	health_bar.value = player_info.health.current_health


func update_mana_bar():
	mana_points.text = str(player_info.mana.current_mana) + "/" + str(player_info.mana.max_mana)
	mana_bar.max_value = player_info.mana.max_mana
	mana_bar.value = player_info.mana.current_mana


func update_runes_held():
	runes_held_label.text = str(player_info.runes_held.amount)


func update_keys_held():
	keys_held_label.text = str(player_info.keys_held)


func _process(delta):
	if player != null:
		update_health_bar()
		update_mana_bar()
		update_stamina_bar()
		update_runes_held()
		update_keys_held()
