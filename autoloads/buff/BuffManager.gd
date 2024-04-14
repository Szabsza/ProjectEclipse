extends Node


func apply_buff(buff : Buff):
	for buff_behavior in buff.behaviors:
		match buff_behavior.target:
			BuffBehavior.Target.MAX_POTIONS_QUANTITY:
				if buff_behavior.is_increasing:
					HotBarManager.increase_health_potions_quantity(buff_behavior.amount)
					HotBarManager.increase_mana_potions_quantity(buff_behavior.amount)
					
				if buff_behavior.is_decreasing:
					pass
					
			BuffBehavior.Target.POTIONS_REGENERATION:
				if buff_behavior.is_increasing:
					HotBarManager.increase_health_potions_regeneration(buff_behavior.amount)
					HotBarManager.increase_health_potions_regeneration(floor(buff_behavior.percent * \
						HotBarManager.health_potion.regeneration_amount / 100))
						
					HotBarManager.increase_mana_potions_regeneration(buff_behavior.amount)
					HotBarManager.increase_mana_potions_regeneration(floor(buff_behavior.percent * \
						HotBarManager.health_potion.regeneration_amount / 100))
				
				if buff_behavior.is_decreasing:
					pass
				
			BuffBehavior.Target.STATUS_ATTACK_POWER:
				if buff_behavior.is_increasing:
					pass
					
				if buff_behavior.is_decreasing:
					pass
					
			BuffBehavior.Target.STATUS_HEALTH:
				if buff_behavior.is_increasing:
					pass
					
				if buff_behavior.is_decreasing:
					pass
					
			BuffBehavior.Target.STATUS_MANA:
				if buff_behavior.is_increasing:
					pass
					
				if buff_behavior.is_decreasing:
					pass
					
			BuffBehavior.Target.STATUS_STAMINA:
				if buff_behavior.is_increasing:
					pass
					
				if buff_behavior.is_decreasing:
					pass
					
	
