extends Node2D

var save_path : String = "user://game.save"
var player : Player = null
var remains : Remains = null


func get_game_data() -> Dictionary:
	var game_data = {
		"player_global_position_x" : player.global_position.x,
		"player_global_position_y" : player.global_position.y,
		
		"max_health": player.health.max_health,
		"current_health": player.health.current_health,
		"max_stamina": player.stamina.max_stamina,
		"current_stamina": player.stamina.current_stamina,
		"max_mana": player.mana.max_mana,
		"current_mana": player.mana.current_mana,
		
		"runes_held" : RuneManager.runes_held,
		
		"health_potion_quantity" : HotBarManager.health_potion.quantity,
		"health_potion_max_quantity": HotBarManager.health_potion.max_quantity,
		"mana_potion_quantity" : HotBarManager.mana_potion.quantity,
		"mana_potion_max_quantity" : HotBarManager.mana_potion.max_quantity,
		"wing_slot" : HotBarManager.wing,
		"bracelet_slot" : HotBarManager.bracelet,
		"ring_slot" : HotBarManager.ring,
		"key_quantity" : HotBarManager.key_quantity,
		
		"health_points" : StatusManager.health_points,
		"stamina_points" : StatusManager.stamina_points,
		"mana_points" : StatusManager.mana_points,
		"power_points" : StatusManager.power_points,
		"level" : StatusManager.level,
		
		"current_level" : WorldManager.current_level,
		"runes_needed" : StatusManager.runes_needed,
		"opened_chests" : WorldManager.get_opened_chests_for_each_level(),
		"activated_checkpoints" : WorldManager.get_activated_checkpoints_for_each_level(),
		
		"remains_position_x" : remains.global_position.x,
		"remains_position_y" : remains.global_position.y,
		"remains_runes_amount" : remains.runes_amount,
	}
	
	return game_data


func save_game():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	print(get_game_data())
	file.store_var(get_game_data())
	file.close()
