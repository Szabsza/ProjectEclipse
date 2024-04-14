extends Node2D

const HEALTH_UPGRADE : int = 20
const MANA_UPGRADE : int = 5
const STAMINA_UPGRADE : int = 20


func increase_needed_runes(player : Player):
	player.status.runes_needed += 100


func decrease_needed_runes(player : Player):
	if player.status.runes_needed - 100 >= 0:
		player.status.runes_needed -= 100


func increase_health(player : Player):
	if player.status.runes_needed <= player.runes_held.amount:
		player.status.health += 1
		player.status.level += 1
		player.health.increase_max_health(HEALTH_UPGRADE)
		player.runes_held.decrease_runes(player.status.runes_needed)
		increase_needed_runes(player)
	

func increase_stamina(player : Player):
	if player.status.runes_needed <= player.runes_held.amount:
		player.status.stamina += 1
		player.status.level += 1
		player.stamina.increase_max_stamina(STAMINA_UPGRADE)
		player.runes_held.decrease_runes(player.status.runes_needed)
		increase_needed_runes(player)


func increase_mana(player : Player):
	if player.status.runes_needed <= player.runes_held.amount:
		player.status.mana += 1
		player.status.level += 1
		player.mana.increase_max_mana(MANA_UPGRADE)
		player.runes_held.decrease_runes(player.status.runes_needed)
		increase_needed_runes(player)


func increase_attack_power(player : Player):
	if player.status.runes_needed <= player.runes_held.amount:
		player.status.attack_power += 1
		player.status.level += 1
		#player.attack_power.increase_attack_power(ATTACK_POWER_UPGRADE)
		player.runes_held.decrease_runes(player.status.runes_needed)
		increase_needed_runes(player)


func decrease_health(player : Player):
	if player.status.health - 1 >= 0: 
		player.status.health -= 1
		player.status.level -= 1
		player.health.decrease_max_health(HEALTH_UPGRADE)
		player.runes_held.increase_runes(player.status.runes_needed)
		decrease_needed_runes(player)
	

func decrease_stamina(player : Player):
	if player.status.stamina - 1 >= 0: 
		player.status.stamina -= 1
		player.status.level -= 1
		player.stamina.decrease_max_stamina(STAMINA_UPGRADE)
		player.runes_held.increase_runes(player.status.runes_needed)
		decrease_needed_runes(player)


func decrease_mana(player : Player):
	if player.status.mana - 1 >= 0: 
		player.status.mana -= 1
		player.status.level -= 1
		player.mana.decrease_max_mana(MANA_UPGRADE)
		player.runes_held.increase_runes(player.status.runes_needed)
		decrease_needed_runes(player)


func decrease_attack_power(player : Player):
	if player.status.attack_power - 1 >= 0: 
		player.status.attack_power -= 1
		player.status.level -= 1
		#player.attack_power.decrease_attack_power(ATTACK_POWER_UPGRADE)
		player.runes_held.increase_runes(player.status.runes_needed)
		decrease_needed_runes(player)
