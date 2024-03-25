extends Node2D

var save_path : String = "user://game.save"
@onready var player : Player = get_tree().get_first_node_in_group("player")


func get_game_data() -> Dictionary:
	var game_data = {
		"player_global_position_x" : player.global_position.x,
		"player_global_position_y" : player.global_position.y,
		"runes_held" : RuneManager.runes_held,
		"health_potions_quantity" : HotBarManager.health_potion_quantity,
		"health_potions_max_quantity": HotBarManager.health_potion_max_quantity,
		"mana_potions_quantity" : HotBarManager.health_potion_quantity,
		"mana_potions_max_quantity" : HotBarManager.health_potion_max_quantity,
		"wing_slot" : HotBarManager.wing_slot,
		"bracelet_slot" : HotBarManager.bracelet_slot,
		"ring_slot" : HotBarManager.ring_slot,
		"health_points" : StatusManager.health_points,
		"stamina_points" : StatusManager.stamina_points,
		"mana_points" : StatusManager.mana_points,
		"power_points" : StatusManager.power_points,
		"level" : StatusManager.level,
		"runes_needed" : StatusManager.runes_needed,
		"opened_chests" : WorldManager.get_opened_chests_for_each_level(),
		"activated_checkpoints" : WorldManager.get_activated_checkpoints_for_each_level(),
	}
	
	return game_data


func save_game():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	print(get_game_data())
	file.store_var(get_game_data())
	file.close()
