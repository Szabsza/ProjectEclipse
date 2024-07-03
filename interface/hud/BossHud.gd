class_name BossHud extends CanvasLayer	

@onready var boss_name_label : Label = $Label
@onready var boss_health_bar : TextureProgressBar = $BossHealthBar
@onready var toast : Control = $Toast
@onready var animation_player : AnimationPlayer = $AnimationPlayer

const TOAST_ANIMATION : String = "show_toast"

var boss_name : String
var boss_health : Health


func setup(_boss_name : String, _boss_health : Health):
	boss_name = _boss_name
	boss_health = _boss_health
	
	boss_name_label.text = boss_name
	boss_health_bar.max_value = boss_health.max_health
	
	
func _ready():
	visible = false
	toast.visible = false


func _process(delta):
	boss_health_bar.value = boss_health.current_health


func show_victory_toast():
	boss_health_bar.visible = false
	boss_name_label.visible = false
	
	toast.visible = true
	animation_player.play(TOAST_ANIMATION)


func _on_animation_player_animation_finished(anim_name):
	if anim_name == TOAST_ANIMATION:
		toast.visible = false
