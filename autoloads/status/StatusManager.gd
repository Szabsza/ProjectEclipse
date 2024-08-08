extends Node2D

const HEALTH_UPGRADE : int = 20
const MANA_UPGRADE : int = 5
const STAMINA_UPGRADE : int = 20
const ATTACK_POWER_UPGRADE : int = 2


func increase_needed_runes():
	PlayerManager.player.status.runes_needed += 100


func decrease_needed_runes():
	if PlayerManager.player.status.runes_needed - 100 >= 0:
		PlayerManager.player.status.runes_needed -= 100


func increase_health(force : bool = false, amount : int = 0):
	if force:
		PlayerManager.player.health.increase_max_health(HEALTH_UPGRADE * amount)
		return
	
	if PlayerManager.player.status.runes_needed <= PlayerManager.player.runes_held.amount:
		PlayerManager.player.status.health += 1
		PlayerManager.player.status.level += 1
		PlayerManager.player.health.increase_max_health(HEALTH_UPGRADE)
		PlayerManager.player.runes_held.decrease_runes(PlayerManager.player.status.runes_needed)
		increase_needed_runes()
	

func increase_stamina(force : bool = false, amount : int = 0):
	if force:
		PlayerManager.player.stamina.increase_max_stamina(STAMINA_UPGRADE * amount)
		return
	
	if PlayerManager.player.status.runes_needed <= PlayerManager.player.runes_held.amount:
		PlayerManager.player.status.stamina += 1
		PlayerManager.player.status.level += 1
		PlayerManager.player.stamina.increase_max_stamina(STAMINA_UPGRADE)
		PlayerManager.player.runes_held.decrease_runes(PlayerManager.player.status.runes_needed)
		increase_needed_runes()


func increase_mana(force : bool = false, amount : int = 0):
	if force:
		PlayerManager.player.mana.increase_max_mana(MANA_UPGRADE * amount)
		return
	
	if PlayerManager.player.status.runes_needed <= PlayerManager.player.runes_held.amount:
		PlayerManager.player.status.mana += 1
		PlayerManager.player.status.level += 1
		PlayerManager.player.mana.increase_max_mana(MANA_UPGRADE)
		PlayerManager.player.runes_held.decrease_runes(PlayerManager.player.status.runes_needed)
		increase_needed_runes()


func increase_attack_power(force : bool = false, amount : int = 0):
	if force:
		PlayerManager.player.attack_power.increase_attack_power(ATTACK_POWER_UPGRADE * amount)
		return
	
	if PlayerManager.player.status.runes_needed <= PlayerManager.player.runes_held.amount:
		PlayerManager.player.status.attack_power += 1
		PlayerManager.player.status.level += 1
		PlayerManager.player.power.increase_attack_power(ATTACK_POWER_UPGRADE)
		PlayerManager.player.runes_held.decrease_runes(PlayerManager.player.status.runes_needed)
		increase_needed_runes()


func decrease_health():
	if PlayerManager.player.status.health - 1 >= 0: 
		PlayerManager.player.status.health -= 1
		PlayerManager.player.status.level -= 1
		PlayerManager.player.health.decrease_max_health(HEALTH_UPGRADE)
		PlayerManager.player.runes_held.increase_runes(PlayerManager.player.status.runes_needed)
		decrease_needed_runes()
	

func decrease_stamina():
	if PlayerManager.player.status.stamina - 1 >= 0: 
		PlayerManager.player.status.stamina -= 1
		PlayerManager.player.status.level -= 1
		PlayerManager.player.stamina.decrease_max_stamina(STAMINA_UPGRADE)
		PlayerManager.player.runes_held.increase_runes(PlayerManager.player.status.runes_needed)
		decrease_needed_runes()


func decrease_mana():
	if PlayerManager.player.status.mana - 1 >= 0: 
		PlayerManager.player.status.mana -= 1
		PlayerManager.player.status.level -= 1
		PlayerManager.player.mana.decrease_max_mana(MANA_UPGRADE)
		PlayerManager.player.runes_held.increase_runes(PlayerManager.player.status.runes_needed)
		decrease_needed_runes()


func decrease_attack_power():
	if PlayerManager.player.status.attack_power - 1 >= 0: 
		PlayerManager.player.status.attack_power -= 1
		PlayerManager.player.status.level -= 1
		PlayerManager.player.power.decrease_attack_power(ATTACK_POWER_UPGRADE)
		PlayerManager.player.runes_held.increase_runes(PlayerManager.player.status.runes_needed)
		decrease_needed_runes()
