extends Node

var player : Player = null 

const HEALTH_POTION_REGENERATION : int = 50
const MANA_POTION_REGENERATION : int = 20

var health_potion_quantity : int = 3
var health_potion_max_quantity : int = 3

var mana_potion_quantity : int = 1
var mana_potion_max_quantity : int = 1

var wing_slot : Node = null
var ring_slot : Node = null
var bracelet_slot : Node = null

signal potions_restored()


func drink_health_potion():
	if player.health.current_health + HEALTH_POTION_REGENERATION > player.health.max_health:
		player.health.current_health = player.health.max_health
	else:
		player.health.current_health += HEALTH_POTION_REGENERATION 
	

func drink_mana_potion():
	if player.mana.current_mana + MANA_POTION_REGENERATION > player.mana.max_mana:
		player.mana.current_mana = player.mana.max_mana
	else:
		player.mana.current_mana += MANA_POTION_REGENERATION 


func reset_potions():
	health_potion_quantity = health_potion_max_quantity
	mana_potion_quantity = mana_potion_max_quantity
	potions_restored.emit()
	
