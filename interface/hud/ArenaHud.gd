class_name ArenaHud extends CanvasLayer

signal on_match_can_start()

@onready var player_name_a : Label = $PlayerInfoA/PlayerName
@onready var player_healthbar_a : TextureProgressBar = $PlayerInfoA/HealthBar
@onready var player_staminabar_a : TextureProgressBar = $PlayerInfoA/StaminaBar

@onready var player_name_b : Label = $PlayerInfoB/PlayerName
@onready var player_healthbar_b : TextureProgressBar = $PlayerInfoB/HealthBar
@onready var player_staminabar_b : TextureProgressBar = $PlayerInfoB/StaminaBar

@onready var multiplayer_control_panel : Control = $MultiplayerControlPanel

@onready var count_down : Control = $CountDown
@onready var countdow_animation_player = $CountDown/CountDownAnimationPlayer

@onready var player_hud_a : Control = $PlayerInfoA
@onready var player_hud_b : Control = $PlayerInfoB
@onready var score : Control = $Score

const COUNTDOWN_ANIMATION : String = "countdown"

var player_a : Player
var player_info_a : PlayerData

var player_b : Player
var player_info_b : PlayerData


func _ready() -> void:
	count_down.visible = false
	player_hud_a.visible = false
	player_hud_b.visible = false
	score.visible = false


func setup_player_a(_player : Player):
	player_name_a.text = _player.name
	player_a = _player
	player_info_a = _player.player_data


func setup_player_b(_player : Player):
	player_name_b.text = _player.name
	player_b = _player
	player_info_b = _player.player_data
	
	
func update_stamina_bar_a():
	player_staminabar_a.max_value = player_info_a.stamina.max_stamina
	player_staminabar_a.value = player_info_a.stamina.current_stamina
	

func update_health_bar_a():
	player_healthbar_a.max_value = player_info_a.health.max_health
	player_healthbar_a.value = player_info_a.health.current_health


func update_stamina_bar_b():
	player_staminabar_b.max_value = player_info_b.stamina.max_stamina
	player_staminabar_b.value = player_info_b.stamina.current_stamina
	

func update_health_bar_b():
	player_healthbar_b.max_value = player_info_b.health.max_health
	player_healthbar_b.value = player_info_b.health.current_health

	
func _process(delta):
	if player_a != null:
		update_health_bar_a()
		update_stamina_bar_a()
	
	if player_b != null:
		update_health_bar_b()
		update_stamina_bar_b()


func _on_host_game_pressed() -> void:
	MultiplayerManager.host_game()
	multiplayer_control_panel.hide()
	

func _on_join_game_pressed() -> void:
	MultiplayerManager.join_game()
	multiplayer_control_panel.hide()


@rpc("call_local")
func start_count_down():
	count_down.visible = true
	countdow_animation_player.play(COUNTDOWN_ANIMATION)


@rpc("call_local")
func hide_countdown():
	count_down.visible = false


@rpc("call_local")
func show_match_hud():
	player_hud_a.visible = true
	player_hud_b.visible = true
	

func _on_count_down_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == COUNTDOWN_ANIMATION:
		hide_countdown.rpc()
		show_match_hud.rpc()
		on_match_can_start.emit()
