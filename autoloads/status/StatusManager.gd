extends Node2D

@onready var player : Player = get_tree().get_first_node_in_group("player")

var health_points : int = 0
var stamina_points : int = 0
var mana_points : int = 0
var power_points : int = 0

var level : int = 0
var runes_needed : int = 50

const HEALTH_UPGRADE : int = 20
const MANA_UPGRADE : int = 5
const STAMINA_UPGRADE : int = 20

func increase_needed_runes():
	runes_needed += 100


func decrease_needed_runes():
	if runes_needed - 100 >= 0:
		runes_needed -= 100


func increase_health():
	health_points += 1
	level += 1
	player.health.increase_max_health(HEALTH_UPGRADE)
	

func increase_stamina():
	stamina_points += 1
	level += 1
	player.stamina.increase_max_stamina(STAMINA_UPGRADE)


func increase_mana():
	mana_points += 1
	level += 1
	player.mana.increase_max_mana(MANA_UPGRADE)


func increase_power():
	power_points += 1
	level += 1


func decrease_health():
	if health_points - 1 >= 0: 
		health_points -= 1
		level -= 1
		player.health.decrease_max_health(HEALTH_UPGRADE)
	

func decrease_stamina():
	if stamina_points - 1 >= 0: 
		stamina_points -= 1
		level -= 1
		player.stamina.decrease_max_stamina(STAMINA_UPGRADE)


func decrease_mana():
	if mana_points - 1 >= 0: 
		mana_points -= 1
		level -= 1
		player.mana.decrease_max_mana(MANA_UPGRADE)


func decrease_power():
	if power_points - 1 >= 0: 
		power_points -= 1
		level -= 1
