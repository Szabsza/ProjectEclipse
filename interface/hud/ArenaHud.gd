class_name ArenaHud extends CanvasLayer

signal on_match_can_start()

@onready var player_name_input : LineEdit = $MultiplayerControlPanel/Panel/PlayerName

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
@onready var score_points : Label = $Score/ScorePoints

@onready var winner_toast : Control = $WinnerToast
@onready var winner_toast_label : Label = $WinnerToast/Label
@onready var winner_toast_animation_player : AnimationPlayer = $WinnerToast/AnimationPlayer

const COUNTDOWN_ANIMATION : String = "countdown"
const WINNER_ANIMATION : String = "winner"

var players : Dictionary = {}

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
	player_a = _player
	player_info_a = _player.player_data


func setup_player_b(_player : Player):
	player_b = _player
	player_info_b = _player.player_data

	
@rpc('any_peer', 'call_local')
func assign_score_player_a():
	var score : String = score_points.text
	
	var score_player_a = score.split(" : ")[0].to_int()
	var score_player_b = score.split(" : ")[1].to_int()
	
	score_points.text = str(score_player_a + 1) + " : " + str(score_player_b)
	
	
@rpc('call_local')	
func assign_score_player_b():
	var score : String = score_points.text
	
	var score_player_a = score.split(" : ")[0].to_int()
	var score_player_b = score.split(" : ")[1].to_int()
	
	score_points.text = str(score_player_a) + " : " + str(score_player_b + 1)	

	
@rpc('any_peer', 'call_local')
func update_stamina_bar_a(max_stamina : int, current_stamina : int):
	player_staminabar_a.max_value = max_stamina
	player_staminabar_a.value = current_stamina
	

@rpc('any_peer', 'call_local')
func update_health_bar_a(max_health : int, current_health : int):
	player_healthbar_a.max_value = max_health
	player_healthbar_a.value = current_health


@rpc('any_peer', 'call_local')
func update_stamina_bar_b(max_stamina : int, current_stamina : int):
	player_staminabar_b.max_value = max_stamina
	player_staminabar_b.value = current_stamina
	

@rpc('any_peer', 'call_local')
func update_health_bar_b(max_health : int, current_health : int):
	player_healthbar_b.max_value = max_health
	player_healthbar_b.value = current_health


@rpc('any_peer', 'call_local')
func update_player_name_a(name : String):
	player_name_a.text = name
	MultiplayerManager.host_name = name	


@rpc('any_peer', 'call_local')
func update_player_name_b(name : String):
	player_name_b.text = name
	MultiplayerManager.client_name = name		


func update_host_hud():
	if player_a != null:
		var player_a_health_max_value = player_info_a.health.max_health
		var player_a_health_current_value = player_info_a.health.current_health
			
		var player_a_stamina_max_value = player_info_a.stamina.max_stamina
		var player_a_stamina_current_value = player_info_a.stamina.current_stamina
			
		update_player_name_a.rpc(MultiplayerManager.host_name)
		update_health_bar_a.rpc(player_a_health_max_value, player_a_health_current_value)
		update_stamina_bar_a.rpc(player_a_stamina_max_value, player_a_stamina_current_value)


func update_client_hud():
	if player_b != null:
		var player_b_health_max_value = player_info_b.health.max_health
		var player_b_health_current_value = player_info_b.health.current_health
			
		var player_b_stamina_max_value = player_info_b.stamina.max_stamina
		var player_b_stamina_current_value = player_info_b.stamina.current_stamina
			
		update_player_name_b.rpc(MultiplayerManager.client_name)
		update_health_bar_b.rpc(player_b_health_max_value, player_b_health_current_value)
		update_stamina_bar_b.rpc(player_b_stamina_max_value, player_b_stamina_current_value)


func _process(delta):	
	if multiplayer.is_server():
		update_host_hud()
	else:
		update_client_hud()


func _on_host_game_pressed() -> void:
	player_name_a.text = player_name_input.text
	MultiplayerManager.host_game(player_name_input.text)
	multiplayer_control_panel.hide()
	

func _on_join_game_pressed() -> void:
	player_name_b.text = player_name_input.text
	MultiplayerManager.join_game(player_name_input.text)
	multiplayer_control_panel.hide()


@rpc('any_peer')
func setup_player_name_a(name : String):
	player_name_a.text = name
	MultiplayerManager.host_name = name


@rpc('any_peer')
func setup_player_name_b(name : String):
	player_name_b.text = name
	MultiplayerManager.client_name = name


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
	score.visible = true
	
	
@rpc("call_local")
func hide_match_hud():
	player_hud_a.visible = false
	player_hud_b.visible = false
	score.visible = false

	
@rpc("call_local")
func hide_winner_toast():
	winner_toast.visible = false


@rpc("call_local")
func show_winner_toast(victorious : String):
	hide_match_hud()
	winner_toast.visible = true
	winner_toast_label.text = victorious.to_upper() + " WINS THE ROUND!"
	winner_toast_animation_player.play(WINNER_ANIMATION)


func _on_count_down_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == COUNTDOWN_ANIMATION:
		hide_countdown.rpc()
		show_match_hud.rpc()
		on_match_can_start.emit()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == WINNER_ANIMATION:
		hide_winner_toast.rpc()
		start_count_down.rpc()
