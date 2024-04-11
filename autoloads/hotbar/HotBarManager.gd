extends Node

signal potions_restored()
signal potions_quantity_updated()
signal necklace_slot_changed()
signal bracelet_slot_changed()
signal wings_slot_changed()

var player : Player = null 

var health_potion : HealthPotion = null 
var mana_potion : ManaPotion = null
var wings : Wings = null
var necklace : Necklace = null
var bracelet : Bracelet = null

var key_quantity : int = 0


func set_health_potion(health_potion : HealthPotion):
	self.health_potion = health_potion


func set_mana_potion(mana_potion : ManaPotion):
	self.mana_potion = mana_potion


func set_wings(wings : Wings):
	self.wings = wings
	wings_slot_changed.emit(wings)


func set_bracelet(bracelet : Bracelet):
	self.bracelet = bracelet
	bracelet_slot_changed.emit(bracelet)
	

func set_necklace(necklace : Necklace):
	self.necklace = necklace
	necklace_slot_changed.emit(necklace)


func drink_health_potion():
	if player.health.current_health + health_potion.regeneration_amount > player.health.max_health:
		player.health.current_health = player.health.max_health
	else:
		player.health.current_health += health_potion.regeneration_amount
	

func drink_mana_potion():
	if player.mana.current_mana + mana_potion.regeneration_amount > player.mana.max_mana:
		player.mana.current_mana = player.mana.max_mana
	else:
		player.mana.current_mana += mana_potion.regeneration_amount 


func reset_potions():
	health_potion.quantity = health_potion.max_quantity
	mana_potion.quantity = mana_potion.max_quantity
	potions_restored.emit()
	

func increase_health_potions_regeneration(amount):
	health_potion.regeneration_amount += amount


func increase_mana_potions_regeneration(amount):
	mana_potion.regeneration_amount += amount


func increase_health_potions_quantity(amount):
	health_potion.max_quantity += amount
	health_potion.quantity += amount 
	potions_quantity_updated.emit()


func increase_mana_potions_quantity(amount):
	mana_potion.max_quantity += amount
	mana_potion.quantity += amount 
	potions_quantity_updated.emit()


func increase_keys(amount):
	key_quantity += amount
