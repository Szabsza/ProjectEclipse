extends Node2D

var starting_point : Vector2 = Vector2(226, 736)
var last_interacted_checkpoint : Checkpoint = null


func place_runes_where_player_died():
	WorldManager.remains.setup(PlayerManager.player.runes_held.amount, PlayerManager.player.global_position)
	

func respawn_player():
	if last_interacted_checkpoint == null:
		PlayerManager.player.global_position = starting_point
	else:
		PlayerManager.player.global_position = last_interacted_checkpoint.global_position
	PlayerManager.player.runes_held.take_all_runes()
	PlayerManager.player.health.increase_current_health(PlayerManager.player.health.max_health)
	
