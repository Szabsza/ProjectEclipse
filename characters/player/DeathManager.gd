extends Node2D

var starting_point : Vector2 = Vector2(226, 736)
var last_interacted_checkpoint : Checkpoint = null


func place_runes_where_player_died(player : Player):
	WorldManager.remains.setup(RuneManager.runes_held, player.global_position)
	

func respawn_player(player : Player):
	if last_interacted_checkpoint == null:
		player.global_position = starting_point
	else:
		player.global_position = last_interacted_checkpoint.global_position
	RuneManager.take_all_runes()
	player.health.increase_current_health(player.health.max_health)
	
